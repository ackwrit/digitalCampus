import 'package:firapplicationdigtitalcampus/controller/firestorehelper.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  //variables
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController nomController= TextEditingController();
  DateTime anniversaire = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: nomController,
            decoration: const InputDecoration.collapsed(
              hintText: "Entrer votre nom",


           ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: prenomController,
            decoration: const InputDecoration.collapsed(
                hintText: "Entrer votre prénom",

            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: mailController,
            decoration: const InputDecoration.collapsed(
                hintText: "Entrer votre mail"
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration.collapsed(
                hintText: "Entrer votre password"
            ),
          ),
          const SizedBox(height: 10,),


          const SizedBox(height: 10,),

          ElevatedButton(
              onPressed: (){
                FirestoreHelper().createUtilisateur(nomController.text, prenomController.text, mailController.text, passwordController.text).then((utilisateur){

                }).catchError((onError){
                  print(onError);
                });
              },
              child: const Text("Validation")
          )

        ],
      ),
    );
  }
}
