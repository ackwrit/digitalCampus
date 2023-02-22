import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firapplicationdigtitalcampus/controller/firestorehelper.dart';
import 'package:firapplicationdigtitalcampus/model/Utilisateur.dart';
import 'package:flutter/material.dart';

class ListPersonne extends StatefulWidget {
  String password;
  ListPersonne({Key? key, required String this.password}) : super(key: key);

  @override
  State<ListPersonne> createState() => _ListPersonneState();
}

class _ListPersonneState extends State<ListPersonne> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().firebaseUsers.snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return  const CircularProgressIndicator();
          }
          else
            {
              List documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                  itemBuilder: (context,index){
                  Utilisateur otherUser = Utilisateur(documents[index]);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(otherUser.avatar!),
                    ),
                    title: Text(otherUser.nomComplet),
                  );

                  }
              );

            }
        }
    );
  }
}
