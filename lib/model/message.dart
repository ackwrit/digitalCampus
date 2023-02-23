import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  //attributs
  late String sender;
  late String receiver;
  late String contenu;
  late String id;
  late DateTime date;
  bool isRead = false;


  //Constructeur
  Message(DocumentSnapshot snapshot){
    id= snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    sender = map ["SENDER"];
    receiver = map ["RECEIVER"];
    contenu = map ["CONTENU"];
    Timestamp timestamp = map ["DATE"];
    date = timestamp.toDate();

  }
}