import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

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
              icon: Icon(Icons.list_alt),
            label: "Listes",
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
      children: const [
        Text("première page"),
        Text("Deuxième page")
      ],
    );
  }
}
