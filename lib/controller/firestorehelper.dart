
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:firapplicationdigtitalcampus/model/Utilisateur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper{
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final firebaseUsers = FirebaseFirestore.instance.collection("UTILISATEURS");



  //création d'un utlisateurs
  Future <Utilisateur> createUtilisateur(String nom,String prenom,String mail,String password) async {
    UserCredential credential=await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid = credential.user!.uid;
    Genre sexe = Genre.licorne;
    Map<String,dynamic> map ={
      "NOM":nom,
      "PRENOM":prenom,
      "SEXE": "Licorne",
      "MAIL":mail,
    };
    addUsers(uid, map);
    return getUtilisateur(uid);
  }


//connexion de l'utilisateurs
  Future<Utilisateur>connexionUtilisateur(String mail,String password) async{
    UserCredential credential = await auth.signInWithEmailAndPassword(email: mail, password: password);
    String uid = credential.user!.uid;
    return getUtilisateur(uid);
  }

//mise à jour d'un utilisateurs
  updateUsers(String identfiant,Map<String,dynamic> dictionnaire){
    firebaseUsers.doc(identfiant).update(dictionnaire);
  }

//ajout d'un utilisateur
  addUsers(String identifiant, Map<String,dynamic> dictionnaire){
    firebaseUsers.doc(identifiant).set(dictionnaire);
}


//récuperer l'identifiant de l'utilisateur
String getId(){
    return auth.currentUser!.uid;
}

//contruire l'utilisateur

Future <Utilisateur> getUtilisateur(String identifiant) async {
    DocumentSnapshot snapshot = await firebaseUsers.doc(identifiant).get();
    return Utilisateur(snapshot);
}


//Supression d'un utilisateur
deleteUser(){
    String identifiant = auth.currentUser!.uid;
    firebaseUsers.doc(identifiant).delete();
    auth.currentUser!.delete();

}


//stockage d'une image




}