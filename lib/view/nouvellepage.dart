import 'package:firapplicationdigtitalcampus/model/Utilisateur.dart';
import 'package:flutter/material.dart';

class NouvellePage extends StatefulWidget {
  Utilisateur otherUser;
  NouvellePage({Key? key,required this.otherUser}) : super(key: key);

  @override
  State<NouvellePage> createState() => _NouvellePageState();
}

class _NouvellePageState extends State<NouvellePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.otherUser.nomComplet),

      ),
        body : bodyPage()
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        //affichage des messages
        Container(
          child: Center(
            child: Text("Afficher mes messages"),
          ),

        ),
        //écrire notre message,
        Container(
          child: Row(
            children: [
              TextField(),
              IconButton(
                  onPressed: (){

                  },
                  icon: const Icon(Icons.send)
              )
            ],
          ),
        )
      ],
    );
  }
}
