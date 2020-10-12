import 'package:flutter/material.dart';
import 'package:thiago/controllers/temaController.dart';
import 'package:thiago/models/temaModel.dart';

class TemasView extends StatefulWidget {
  @override
  _TemasViewState createState() => _TemasViewState();
}

class _TemasViewState extends State<TemasView> {
  TemaController _temaController = TemaController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _temaController.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Temas'),
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
                    setState(() {
                      value == null || value == '' ? 'Informe um tema!' : '';
                    });
                  },
                  controller: _temaController.adicionarTemaController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Adicionar tema de estudo',
                      labelStyle: TextStyle(color: Colors.orange),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _temaController.adicionarTema();
                          setState(() {});
                        },
                      )),
                  keyboardType: TextInputType.text,
                ),
                Divider(),
                Text(
                  'Temas Cadastrados:',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: Container(
                    child: FutureBuilder(
                      future: _temaController.listarTema(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return Container(
                              width: 200.0,
                              height: 200.0,
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
                              return Container(
                                  child: gerarItens(context, snapshot));
                            }

                          // else
                          //
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gerarItens(BuildContext context, AsyncSnapshot snapshot) {
    List<TemaModel> listaTema = snapshot.data;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listaTema.length,
      itemBuilder: (context, index) {
        return Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listaTema[index].name,
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.orange,
                    ),
                    color: Colors.orange,
                    onPressed: () {
                      _temaController
                          .excluirTema(listaTema[index].id.toString());
                      setState(() {});
                    })
              ],
            ));
      },
    );
  }
}
