import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  final TextStyle styleDescription =
      TextStyle(fontSize: 18, color: Colors.white70);
  final TextStyle styleTitle = TextStyle(fontSize: 18, color: Colors.white);
  final double spaceSizedBox = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sobre o App'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        color: Colors.teal,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customRow('Informação',
                    'Esta aplicação visa gerenciar cursos que gostaria de fazer no futuro, os dados salvos são armazenados no site Parse - Back4App'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(
                      'assets/img/eu.jpeg',
                    ),
                  ),
                ),
                customRow('Desenvolvedor', 'Thiago Silva'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('E-mail', 'thiago.silva@gmail.com'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('Telefone', '(35) 99999-0000'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                Divider(),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('Disciplina', 'Nome da Disciplina'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('Professor', 'Nome do Professor'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('Curso', 'Nome do Curso'),
                SizedBox(
                  height: spaceSizedBox,
                ),
                customRow('Universidade', 'Nome da Universidade'),
                SizedBox(
                  height: spaceSizedBox,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column customRow(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: styleTitle,
        ),
        Text(
          value,
          style: styleDescription,
          maxLines: 5,
          softWrap: true,
        ),
      ],
    );
  }
}
