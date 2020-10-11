import 'package:flutter/material.dart';
import 'package:thiago/models/temaModel.dart';
import 'package:thiago/repositories/temaRepository.dart';

class TemaController {
  TextEditingController adicionarTemaController = TextEditingController();
  //TemaModel _temaModel = TemaModel();
  TemaRepository _temaRepository = TemaRepository();

  Future<void> adicionarTema() async {
    String _tema = adicionarTemaController.text;
    if (_tema == null || _tema == '') {
    } else {
      TemaModel temaToInsert = new TemaModel(id: null, name: _tema);
      bool result = await _temaRepository.inserirTema(temaToInsert);
      if (result) {
        adicionarTemaController.text = '';
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
