import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firapplicationdigtitalcampus/controller/firestorehelper.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //attributs
  String? nameImage;
  String? urlImage;
  Uint8List? datasImage;


  //fonctions
  popImage(){
    //mise en place du Pop
    showDialog(context: context,
        builder: (context){
      if(Platform.isIOS){
        return CupertinoAlertDialog(
          title: const Text("Mon image"),
          content: Image.memory(datasImage!),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Refuser"),
            ),

            TextButton(
              onPressed: (){
                //récupération du lien de l'image
                FirestoreHelper().stockageImage(datasImage!, nameImage!).then((value) {
                  setState((){
                    urlImage = value;
                    monIdentite.avatar = urlImage;
                  });
                  Map<String,dynamic> map = {
                    "AVATAR":urlImage,
                  };
                  //mise à jour de l'utilisateur
                  FirestoreHelper().updateUsers(monIdentite.id, map);

                  Navigator.pop(context);
                });



              },
              child: const Text("Accepter"),
            ),
          ],
        );
      }
      else
        {
          return AlertDialog(
            title: const Text("Mon image"),
            content: Image.memory(datasImage!),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Refuser"),
              ),

              TextButton(
                onPressed: (){


                  Navigator.pop(context);
                },
                child: const Text("Accepter"),
              ),
            ],
          );
        }
        }
    );

  }


  recupImage() async{
    //récupérartion image
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if (resultat != null){
      nameImage = resultat.files.first.name;
      datasImage = resultat.files.first.bytes;
      popImage();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              print("j'ai tapé sur l'image");
              recupImage();
            },
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(monIdentite.avatar!,
              ),

            ),
          ),


          Text(monIdentite.nomComplet),

          Text(monIdentite.mail),

          Text(monIdentite.convertirGenreEnString())
        ],
      ),
    );
  }
}
