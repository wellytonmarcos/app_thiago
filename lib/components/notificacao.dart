import 'package:flutter/material.dart';

/**
  * Gera notificação 
  */
void gerarSnakBar(
    GlobalKey<ScaffoldState> scaffoldKey, String message, bool success) {
  scaffoldKey.currentState.hideCurrentSnackBar(); //Oculta existe
  final snackbar = SnackBar(
    duration: Duration(seconds: 10),
    content: Row(
      children: <Widget>[
        Icon(success ? Icons.check : Icons.warning),
        SizedBox(
          width: 12,
        ),
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
  scaffoldKey.currentState.showSnackBar(snackbar); //GEra
}
