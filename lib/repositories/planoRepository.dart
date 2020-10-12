import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:thiago/models/planoModel.dart';
import '../main.dart';

/** 
 * Repositório de Planos de Estudo
 */
class PlanoRepository {
  /** 
   * Cadastra um Plano
   * @param [_plano] Modelo de Plano
   * @return [bool] resultado da operaçao 
   */
  Future<bool> inserirPlano(PlanoModel _plano) async {
    await inicializeParse();
    final novoPlano = ParseObject('plano')
      ..set(
        'name',
        _plano.name,
      )
      ..set(
        'start',
        _plano.start,
      )
      ..set(
        'end',
        _plano.end,
      )
      ..set(
        'status',
        _plano.status,
      )
      ..set(
        'theme',
        _plano.theme,
      );
    final response = await novoPlano.save();
    if (response.success) {
      return true;
    } else {
      return false;
    }
  }

  /** 
   * Retorna todos os Planos
   * @return [List] resultado da consulta 
   */
  Future<List<PlanoModel>> getAllItems() async {
    final apiResponse = await ParseObject('plano').getAll();
    if (apiResponse.success && apiResponse.count > 0) {
      return listPlano(apiResponse.results);
    } else {
      return new List<PlanoModel>();
    }
  }

  /** 
   * Formata os planos de Parse para Plano
   * @return [List] resultado da operação 
   */
  List<PlanoModel> listPlano(List<dynamic> result) {
    List<PlanoModel> _lista = new List<PlanoModel>();
    for (final ParseObject item in result) {
      PlanoModel _plano = PlanoModel.fromJson(item.toJson());
      _lista.add(_plano);
    }
    return _lista;
  }

  /** 
   * Muda Status
   * @param [_plano] Modelo de Plano
   * @return [bool] resultado da operaçao 
   */
  Future<bool> mudarStatus(PlanoModel _plano) async {
    await inicializeParse();
    final plano = ParseObject('plano')
      ..set(
        'objectId',
        _plano.objectId,
      )
      ..set(
        'status',
        _plano.status,
      );
    final response = await plano.save();
    if (response.success) {
      return true;
    } else {
      return false;
    }
  }

  /** 
   * Deleta Plano
   * @param [string] ID do plano 
   * @return [bool] resultado da operaçao 
   */
  Future<bool> deletarPlano(String id) async {
    await inicializeParse();
    final op = await ParseObject('plano').delete(id: id);
    if (op.success) {
      return true;
    } else {
      return false;
    }
  }
}
