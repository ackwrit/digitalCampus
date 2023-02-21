
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper{
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final firebaseUsers = FirebaseFirestore.instance.collection("UTILISATEURS");



  //création d'un utlisateurs
  createUtilisateur(String nom,String prenom,String mail,String password) async {
    UserCredential credential=await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid = credential.user!.uid;
    Genre sexe = Genre.licorne;
    Map<String,dynamic> map ={
      "NOM":nom,
      "PRENOM":prenom,
      "SEXE": "Licorne",
    };
  }


//connexion de l'utilisateurs

//mise à jour d'un utilisateurs
  updateUsers(String identfiant,Map<String,dynamic> dictionnaire){

  }

//ajout d'un utilisateur
  addUsers(String identifiant, Map<String,dynamic> dictionnaire){
    firebaseUsers.doc(identifiant).set(dictionnaire);
}


//Supression d'un utilisateur


//stockage d'une image




}