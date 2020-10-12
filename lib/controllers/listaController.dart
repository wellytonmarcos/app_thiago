import 'package:flutter/material.dart';
import 'package:thiago/components/notificacao.dart';
import 'package:thiago/models/planoModel.dart';
import 'package:thiago/models/temaModel.dart';
import 'package:thiago/repositories/planoRepository.dart';

/**
 * Controller de operação de Cadastro de Plano
 */
class ListaController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /**
  * Busca a seleção de planos cadastrados 
  */
  Future<List<PlanoModel>> listarPlanos() async {
    List<TemaModel> myList = List<TemaModel>(); //Modelo de lista
    try {
      final myList = await PlanoRepository().getAllItems(); //Pega a lista
      return myList; //Retorna a lista
    } catch (e) {
      print(e); //TODO
    }
  }

  /**
  * Muda o status de um Plano
  * @param [plano] Modelo de Plano 
  */
  Future<void> mudarStatus(PlanoModel plano) async {
    try {
      final operation =
          await PlanoRepository().mudarStatus(plano); //Pega a lista
      if (operation) {
        gerarSnakBar(scaffoldKey, 'Status alterado!', true);
      } else {
        gerarSnakBar(scaffoldKey, 'Falha ao alterar stauts!', false);
      } //Retorna a lista
    } catch (e) {
      print(e); //TODO
    }
  }

  /**
  * Muda o status de um Plano
  * @param [id] Modelo de Plano 
  */
  Future<void> deletarPlano(String id) async {
    try {
      final operation = await PlanoRepository().deletarPlano(id); //Pega a lista
      if (operation) {
        gerarSnakBar(scaffoldKey, 'Plano Excluído!', true);
      } else {
        gerarSnakBar(scaffoldKey, 'Falha ao excluir plano!', false);
      } //Retorna a lista
    } catch (e) {
      print(e); //TODO
    }
  }
}
