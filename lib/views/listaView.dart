import 'package:flutter/material.dart';
import 'package:thiago/controllers/listaController.dart';
import 'package:thiago/models/planoModel.dart';

/** 
 * Classe de View para Listar Planos Cadastrados
 */
class ListaView extends StatefulWidget {
  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  ListaController _listaController = ListaController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _listaController.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Planos'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro');
        },
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        color: Colors.teal,
        child: Expanded(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Confira seus planos, clique sobre eles para detalhar!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: _listaController.listarPlanos(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return widgetCarregando();
                      default:
                        if (snapshot.hasError) {
                          return Container(
                            child: Text('Não foi possível obter os dados!'),
                          );
                        } else {
                          return Container(
                              child: gerarItens(context, snapshot));
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetCarregando() {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        alignment: Alignment.center,
        child: Column(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5.0,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Carregando conteúdo...',
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget gerarItens(BuildContext context, AsyncSnapshot snapshot) {
    List<PlanoModel> listaPlano = snapshot.data;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listaPlano.length,
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ExpansionTile(
              childrenPadding: EdgeInsets.all(20),
              title: Text(
                listaPlano[index].name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
              subtitle: Text(listaPlano[index].theme),
              trailing: Checkbox(
                value: listaPlano[index].status,
                activeColor: Colors.orange,
                onChanged: (value) {
                  final statusPlano = new PlanoModel(
                    objectId: listaPlano[index].objectId,
                    status: value,
                  );
                  _listaController.mudarStatus(statusPlano);
                  setState(() {});
                },
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Data Inicial:\n${listaPlano[index].start}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Data Final:\n ${listaPlano[index].end}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: SizedBox(
                    height: 44,
                    child: TextButton(
                      child: Text('Excluir Plano',
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        _listaController
                            .deletarPlano(listaPlano[index].objectId);
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
