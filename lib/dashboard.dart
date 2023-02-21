import 'package:firapplicationdigtitalcampus/view/list_personne.dart';
import 'package:firapplicationdigtitalcampus/view/messagerie.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
