import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:thiago/models/temaModel.dart';

import '../main.dart';

class TemaRepository {
  /** 
   * Cadastra um Tema
   * @param [_tema] Modelo de Tema
   * @return [bool] resultado da operaçao 
   */
  Future<bool> inserirTema(TemaModel _tema) async {
    await inicializeParse();
    final novoTema = ParseObject('tema')..set('name', _tema.name);
    final response = await novoTema.save();
    if (response.success) {
      return true;
    } else {
      return false;
    }
  }

  /** 
   * Deleta Tema
   * @param [string] ID do Tema 
   * @return [bool] resultado da operaçao 
   */
  Future<bool> excluirTema(String id) async {
    await inicializeParse();
    final tema = await ParseObject('tema').delete(id: id);
    print(tema);
    if (tema.success) {
      return true;
    } else {
      return false;
    }
  }

  /** 
   * Retorna todos os Temas
   * @return [List] resultado da consulta 
   */
  Future<List<TemaModel>> getAllItems() async {
    final apiResponse = await ParseObject('tema').getAll();
    if (apiResponse.success && apiResponse.count > 0) {
      return listTema(apiResponse.results);
    } else {
      return new List<TemaModel>();
    }
  }

  /** 
   * Formata os planos de Parse para Tema
   * @return [List] resultado da operação 
   */
  List<TemaModel> listTema(List<dynamic> result) {
    List<TemaModel> _lista = new List<TemaModel>();
    for (final ParseObject item in result) {
      TemaModel _tema = TemaModel(
          id: item.objectId.toString(), name: item["name"].toString());

      _lista.add(_tema);
    }
    return _lista;
  }
}
