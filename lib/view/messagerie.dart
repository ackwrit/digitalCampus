import 'package:flutter/material.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({Key? key}) : super(key: key);

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messagerie"));
  }
}
