import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firapplicationdigtitalcampus/controller/firestorehelper.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:firapplicationdigtitalcampus/model/Utilisateur.dart';
import 'package:firapplicationdigtitalcampus/model/message.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class NouvellePage extends StatefulWidget {
  Utilisateur otherUser;
  NouvellePage({Key? key,required this.otherUser}) : super(key: key);

  @override
  State<NouvellePage> createState() => _NouvellePageState();
}

class _NouvellePageState extends State<NouvellePage> {
  //varibale
  TextEditingController message = TextEditingController();
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
        Flexible(
          child: Container(

            child: Center(
              child: StreamBuilder<QuerySnapshot>(
                stream : FirestoreHelper().firebaseMessages.snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return const CircularProgressIndicator();
                  }
                  else
                    {
                      List documents = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context,index){
                            Message mess = Message(documents[index]);
                            if(mess.receiver == widget.otherUser.id && mess.sender == monIdentite.id)
                              {
                                return Row(
                                  children: [
                                    Text(mess.contenu),
                                    Text(mess.date.toString())
                                  ],
                                );
                              }
                            else
                              {
                                return Container();
                              }


                          }
                      );
                    }
                },
              )
            ),

          ),
        ),
        //écrire notre message,
        Container(
          child: Row(
            children: [
              Container(
                width : MediaQuery.of(context).size.width - 50,
                  height: 100,
                  child: TextField(
                    controller: message,
                  )
              ),
              IconButton(
                  onPressed: (){
                    if(message.text != ""){
                      //création de l'identificant unique du message
                      String uid = randomAlphaNumeric(10);
                      //creer ma structure du message
                      Map<String,dynamic> map = {
                        "SENDER":monIdentite.id,
                        "RECEIVER":widget.otherUser.id,
                        "DATE": DateTime.now(),
                        "CONTENU":message.text,
                        "ISREAD":false,
                      };
                      FirestoreHelper().addMessage(uid, map);
                      message.text ="";
                    }


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
