import 'package:flutter/material.dart';

/**  
 * Classe de renderizar um CardButton 
 */
class CardButton extends StatelessWidget {
  String myRoute; //Rota do Button
  IconData myIcon; //Icone
  String myTitle; //Titulo
  String myDescription; //Descrição
  CardButton({
    this.myRoute,
    this.myIcon,
    this.myTitle,
    this.myDescription,
  }); //Construtor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //Captura de toque
      onTap: () {
        Navigator.of(context).pushNamed(myRoute);
      },
      child: Card(
        //Card
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      myIcon,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      myTitle,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )
                  ],
                ),
                Text(
                  myDescription,
                  style: TextStyle(
                      color: Colors.teal[300],
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
