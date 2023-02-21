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
    return Center(child: Text("${widget.password}",
      style: TextStyle(
        color: Colors.black
      ),
    ));
  }
}
