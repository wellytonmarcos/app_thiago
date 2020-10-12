import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thiago/controllers/cadastroController.dart';
import 'package:thiago/models/planoModel.dart';
import 'package:thiago/models/temaModel.dart';

/** 
 * Classe de View para Tela de Cadastro de Plano
 */

class CadastroView extends StatefulWidget {
  @override
  _CadastroViewState createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  CadastroController _cadastroController =
      new CadastroController(); //Inicializa Controller de Cadastro
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _cadastroController.scaffoldKey,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Espaço
                    SizedBox(height: 20),
                    //Instruções
                    Text(
                      'Preencha os dados abaixo para cadastrar um novo plano!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    //Espaço
                    const SizedBox(height: 15),
                    //Form
                    TextFormField(
                      decoration: _gerarInputDecoration(
                          'Nome do Plano (Ex: Aprender Card)'),
                      keyboardType: TextInputType.text,
                      controller: _cadastroController.nameTEC,
                    ),
                    //Espaço
                    const SizedBox(height: 15),
                    //Form
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                      controller: _cadastroController.startTEC,
                      decoration: _gerarInputDecoration('Início do Plano'),
                    ),
                    //Espaço
                    const SizedBox(height: 15),
                    //Form
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DataInputFormatter(),
                      ],
                      controller: _cadastroController.endTEC,
                      decoration: _gerarInputDecoration('Término do Plano'),
                    ),
                    //Espaço
                    const SizedBox(height: 15),
                    //Form
                    FutureBuilder(
                      future: _cadastroController.listarTema(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return Container(
                              width: 200.0,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.teal),
                                strokeWidth: 5.0,
                              ),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Container(
                                child: Text('Não foi possível obter os dados!'),
                              );
                            } else {
                              List<TemaModel> listaTema = snapshot.data;
                              return Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: DropdownButtonFormField(
                                        decoration: _gerarInputDecoration(
                                            _cadastroController.themeStr),
                                        items: listaTema.map((TemaModel opcao) {
                                          return DropdownMenuItem<String>(
                                            value: opcao.name,
                                            child: Text(opcao.name),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        onChanged: (selecionado) {
                                          setState(() {
                                            _cadastroController.themeStr =
                                                selecionado;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      title: SizedBox(
                        height: 44,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text('Cadastrar'),
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: () {
                            FocusScope.of(context).unfocus(); //Fecha o teclado
                            PlanoModel _plano = new PlanoModel(
                                name: _cadastroController.nameTEC.text,
                                start: _cadastroController.startTEC.text,
                                end: _cadastroController.endTEC.text,
                                theme: _cadastroController.themeStr,
                                status: false); //Cria um objeto do plano
                            _cadastroController
                                .adicionarPlano(_plano); //Adiciona um plano
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title: SizedBox(
                        height: 44,
                        child: TextButton(
                          child: Text('Ver lista de cadastrados'),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/lista');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Metodo de retornar a formatação de um imput
   * @param [label] Label do input
   */
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
