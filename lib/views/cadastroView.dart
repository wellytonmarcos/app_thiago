import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thiago/controllers/temaController.dart';
import 'package:thiago/models/temaModel.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  TemaController _temaController = TemaController();
  List<TemaModel> _temas;

  @override
  void initState() async {
    super.initState();
    _temas = await _temaController.listarTema();
  }

  @override
  Widget build(BuildContext context) {
    //listar();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Plano de Estudo'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        color: Colors.teal,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    value == null || value == '' ? 'Informe um nome!' : '';
                    setState(() {});
                  },
                  decoration: _gerarInputDecoration(
                      'Nome do Plano (Ex: Aprender Card)'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  decoration: _gerarInputDecoration('Início do Plano'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
                  decoration: _gerarInputDecoration('Término do Plano'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    value == null || value == '' ? 'Informe um titulo!' : '';
                    setState(() {});
                  },
                  decoration: _gerarInputDecoration('Nome do Plano'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    value == null || value == '' ? 'Informe um titulo!' : '';
                    setState(() {});
                  },
                  decoration: _gerarInputDecoration('Nome do Plano'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _gerarInputDecoration(String label) {
    return InputDecoration(
      hintStyle: TextStyle(color: Colors.orange),
      border: const OutlineInputBorder(),
      isDense: true,
      labelText: label,
      labelStyle: TextStyle(color: Colors.orange),
    );
  }
}
