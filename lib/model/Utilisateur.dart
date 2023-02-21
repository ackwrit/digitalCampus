import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:flutter/material.dart';

class Utilisateur {
  //attributs
  late String id;
  late String nom;
  late String prenom;
  late String mail;
  late String avatar;
  late DateTime birthday;
  late Genre sexe;


  String get nomComplet {
    return prenom + " " + nom;
  }

  //constructeur
  Utilisateur(){

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