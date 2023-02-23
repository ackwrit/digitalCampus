import 'package:firapplicationdigtitalcampus/controller/firestorehelper.dart';
import 'package:firapplicationdigtitalcampus/librairie/constatnte.dart';
import 'package:firapplicationdigtitalcampus/view/list_personne.dart';
import 'package:firapplicationdigtitalcampus/view/messagerie.dart';
import 'package:firapplicationdigtitalcampus/view/mydarwer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  //attributs
  String password;
  DashBoard({Key? key , required String this.password}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //variable
  int index = 0;
  PageController pageIndex = PageController();

  //////////

  @override
  void initState() {
    String uid = FirestoreHelper().getId();
    FirestoreHelper().getUtilisateur(uid).then((value) {
      setState(() {
        monIdentite = value;
      });

    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width/2,
        height:MediaQuery.of(context).size.height,
        color: Colors.white,
        child : MyDrawer()
      ),

      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                FirestoreHelper().logout();
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState((){
            index = value;
            pageIndex.jumpToPage(value);
          });

        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            label: "Personne",
            icon: Icon(Icons.person)
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.comment),
            label: "Messagerie",
          )
        ],
      ),
    );
  }

  Widget bodyPage(){
    return PageView(
      controller: pageIndex,
      onPageChanged: (value){
        setState(() {
          pageIndex.jumpToPage(value);
          index = value;
        });

      },
      children:  [
        ListPersonne(password: widget.password),
        Messagerie(),
      ],
    );
  }
}
