import 'package:thiago/models/temaModel.dart';

class ListaTemaModel {
  TemaModel tema;

  ListaTemaModel({this.tema});

  ListaTemaModel.fromJson(Map<String, dynamic> json) {
    tema = json['tema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tema'] = this.tema;
    return data;
  }
}
