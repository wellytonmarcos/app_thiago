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

  Future<void> excluirTema(String id) async {
    if (id == null || id == '') {
    } else {
      return await _temaRepository.excluirTema(id);
    }
  }

  Future<List<TemaModel>> listarTema() async {
    List<TemaModel> myList = List<TemaModel>();
    try {
      final myList = await TemaRepository().getAllItems();
      return myList;
    } catch (e) {
      print(e);
    }
  }
}
