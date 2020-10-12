import 'package:flutter/material.dart';
import 'package:thiago/components/notificacao.dart';
import 'package:thiago/models/temaModel.dart';
import 'package:thiago/repositories/temaRepository.dart';

/**
 * Controller de operação da Tela de Tema
 */
class TemaController {
  TextEditingController adicionarTemaController =
      TextEditingController(); //Text form de cadastro de novo tema
  TemaRepository _temaRepository = TemaRepository(); //Repositorio
  final scaffoldKey = GlobalKey<ScaffoldState>(); //chave do Scaffold
  /**
   * Adiciona um novo tema
   * return [void]
   */
  Future<void> adicionarTema() async {
    String _tema = adicionarTemaController.text;
    if (_tema == null || _tema == '') {
      gerarSnakBar(scaffoldKey, 'Preencha o nome!', false);
    } else {
      TemaModel temaToInsert = new TemaModel(id: null, name: _tema);
      bool result = await _temaRepository.inserirTema(temaToInsert);
      if (result) {
        adicionarTemaController.text = '';
        gerarSnakBar(scaffoldKey, 'Tema Cadastrado!', true);
      } else {
        gerarSnakBar(scaffoldKey, 'Falha ao Cadastar!', false);
      }
    }
  }

  /**
   * Exclui tema
   * return [void]
   */
  Future<void> excluirTema(String id) async {
    if (id == null || id == '') {
      gerarSnakBar(scaffoldKey, 'Itens não identificado!', false);
    } else {
      bool result = await _temaRepository.excluirTema(id);
      if (result) {
        gerarSnakBar(scaffoldKey, 'Tema Exluído!', true);
      } else {
        gerarSnakBar(scaffoldKey, 'Falha ao Exluir!', false);
      }
    }
  }

  /**
   * Lista tema
   * return [List] Todos os temas
   */
  Future<List<TemaModel>> listarTema() async {
    List<TemaModel> myList = List<TemaModel>();
    try {
      return await TemaRepository().getAllItems(); //Retorna todos itens
    } catch (e) {
      print(e);
    }
  }
}
