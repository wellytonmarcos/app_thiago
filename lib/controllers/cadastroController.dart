import 'package:flutter/material.dart';
import 'package:thiago/components/notificacao.dart';
import 'package:thiago/models/planoModel.dart';
import 'package:thiago/models/temaModel.dart';
import 'package:thiago/repositories/planoRepository.dart';
import 'package:thiago/repositories/temaRepository.dart';

/**
 * Controller de operação de Cadastro de Plano
 */
class CadastroController {
  //Controllers dos Inputs
  TextEditingController nameTEC = TextEditingController();
  TextEditingController startTEC = TextEditingController();
  TextEditingController endTEC = TextEditingController();
  //Texto do DropDown
  String themeStr = "Selecione um tema";
  //Chave da Scaffold
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /**
  * Adiciona um plano no repositorio 
  * @param [plano] Modelo do Plano
  */
  Future<void> adicionarPlano(PlanoModel plano) async {
    //Checa se o plano foi preenchido
    if (plano.name == null || plano.name == '') {
      gerarSnakBar(scaffoldKey, 'Nome é obrigatório', false);
    } else if (plano.start == null || plano.start == '') {
      //Checa se a data foi preenchida (Não validado o formato)
      gerarSnakBar(scaffoldKey, 'Início é obrigatório', false);
    } else if (plano.end == null || plano.end == '') {
      //Checa se a data foi preenchida (Não validado o formato)
      gerarSnakBar(scaffoldKey, 'Termino é obrigatório', false);
    } else if (plano.theme == null || plano.theme == 'Selecione um tema') {
      //Checa o tema foi selecionado
      gerarSnakBar(scaffoldKey, 'Tema é obrigatório', false);
    } else {
      //Tenta cadastrar no repositorio
      final cadastrar = await PlanoRepository().inserirPlano(plano);
      //Se cadastrar
      if (cadastrar) {
        //Limpa os campos
        nameTEC.text = '';
        startTEC.text = '';
        endTEC.text = '';
        themeStr = "Selecione um tema";
        //Mensagem de sucesso
        gerarSnakBar(scaffoldKey, 'Plano Cadastrado!', true);
      } else {
        gerarSnakBar(
            scaffoldKey, 'Não foi possível cadatrar no momento', false);
      }
    }
  }

  /**
  * Busca a seleção de temas para cadastro 
  */
  Future<List<TemaModel>> listarTema() async {
    List<TemaModel> myList = List<TemaModel>(); //Modelo de lista
    try {
      final myList = await TemaRepository().getAllItems(); //Pega a lista
      return myList; //Retorna a lista
    } catch (e) {
      print(e); //TODO
    }
  }
}
