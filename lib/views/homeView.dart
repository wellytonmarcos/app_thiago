import 'package:flutter/material.dart';
import 'package:thiago/components/cardButton.dart';

/** 
 * Classe de View para Tela Inicial
 */
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Plano de Estudo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Text(
              'Gerencie seus planos de aprendizado!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardButton(
                    myRoute: '/cadastro',
                    myIcon: Icons.add,
                    myTitle: 'Novo',
                    myDescription:
                        'Cadastra novo plano de estudo para sua carreira'),
                CardButton(
                    myRoute: '/lista',
                    myIcon: Icons.list,
                    myTitle: 'Lista',
                    myDescription: 'Lista planos de estudo cadastrados')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardButton(
                    myRoute: '/temas',
                    myIcon: Icons.settings,
                    myTitle: 'Temas',
                    myDescription: 'Gerenciar temas a serem estudados'),
                CardButton(
                    myRoute: '/sobre',
                    myIcon: Icons.info_outline,
                    myTitle: 'Sobre',
                    myDescription: 'Informações do projeto')
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
    );
  }
}
