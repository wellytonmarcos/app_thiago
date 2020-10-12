import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:thiago/views/cadastroView.dart';
import 'package:thiago/views/homeView.dart';
import 'package:thiago/views/listaView.dart';
import 'package:thiago/views/sobreView.dart';
import 'package:thiago/views/temasView.dart';

void main() {
  runApp(ThiagoApp());
}

/// Manter somente no modo retrato
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeView(),
  "/cadastro": (BuildContext context) => CadastroView(),
  "/temas": (BuildContext context) => TemasView(),
  "/lista": (BuildContext context) => ListaView(),
  "/sobre": (BuildContext context) => SobreView(),
};

class ThiagoApp extends StatefulWidget {
  @override
  _ThiagoAppState createState() => _ThiagoAppState();
}

Future<void> inicializeParse() async {
  await Parse().initialize('tZCafdS7XQGP12NbzKPver4ERXpmHCd66TjlbiDh',
      'https://parseapi.back4app.com/',
      clientKey: 'NoRm32MunDxt8jzRVeHCBJWHZAB067ojwPbUvGMK',
      autoSendSessionId: true,
      debug: true);
}

class _ThiagoAppState extends State<ThiagoApp> {
  @override
  void initState() {
    _portraitModeOnly();
    inicializeParse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Estudos',
      debugShowCheckedModeBanner: false, //Desabilita a faixa de debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
      routes: routes,
    );
  }
}
