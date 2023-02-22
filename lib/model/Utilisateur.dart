import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:flutter/material.dart';

class Utilisateur {
  //attributs
  late String id;
  late String nom;
  late String prenom;
  late String mail;
  String? avatar;
  DateTime? birthday;
  late Genre sexe;


  String get nomComplet {
    return prenom + " " + nom;
  }

  //constructeur
  Utilisateur(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map["PRENOM"];
    mail = map["MAIL"];
    String? avatarProvisoire = map["AVATAR"];
    //vérification de la valeur de l'avatar
    if(avatarProvisoire == null){
      //affection à notre image par défaut
      avatar = defaultImage;
    }
    else
      {
        //affection du lien de l'avatar de l'utilisateur
        avatar = avatarProvisoire;
      }
    Timestamp? dateProvisoire = map["BIRTHDAY"];
    if(dateProvisoire == null){
      birthday = DateTime.now();
    }
    else
      {
        birthday = dateProvisoire.toDate();
      }

    String sexeProvisoire= map["SEXE"] ;
    sexe = convertirStringEnGenre(sexeProvisoire);

  }

  Utilisateur.empty(){
    id = "";
    nom = "";
    prenom = "";
    mail = "";
    avatar = defaultImage;
    birthday = DateTime.now();
    sexe = Genre.licorne;

  }




  //méthode
  String convertirGenreEnString(){
    switch(this.sexe){
      case Genre.homme : return "Homme";
      case Genre.femme : return "Femme";
      case Genre.licorne : return "Licorne";
    }
  }

  Genre convertirStringEnGenre(String variable){
    switch(variable){
      case "Homme": return Genre.homme;
      case "Femme": return Genre.femme;
      case "Licorne": return Genre.licorne;
      default : return Genre.licorne;
    }
  }
}