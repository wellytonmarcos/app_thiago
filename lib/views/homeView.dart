import 'package:flutter/material.dart';
import 'package:thiago/components/cardButton.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plano de Estudos'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        color: Colors.teal,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardButton(
                      myRoute: '/cadastro',
                      myIcon: Icons.add,
                      myTitle: 'Novo',
                      myDescription: 'Cadastra nova item'),
                  CardButton(
                      myRoute: '/lista',
                      myIcon: Icons.list,
                      myTitle: 'Lista',
                      myDescription: 'Lista planos cadastrados')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardButton(
                      myRoute: '/temas',
                      myIcon: Icons.settings,
                      myTitle: 'Temas',
                      myDescription: 'Gerenciar Temas de estudo'),
                  CardButton(
                      myRoute: '/sobre',
                      myIcon: Icons.info_outline,
                      myTitle: 'Sobre',
                      myDescription: 'Informações do App')
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'O melhor gerenciador de disciplinas de estudo',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
