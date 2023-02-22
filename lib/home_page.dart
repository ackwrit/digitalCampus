import 'package:firapplicationdigtitalcampus/dashboard.dart';
import 'package:firapplicationdigtitalcampus/view/Inscription.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //variables
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenue"),
        centerTitle: true,
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/nanatsu.jpg")

          ),

          TextField(
            controller: mailController,
            decoration: const InputDecoration(
              hintText: "Entrer votre adresse"
            ),
          ),

          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
                hintText: "Entrer votre password"
            ),
          ),

          const SizedBox(height: 10,),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 10,

            ),
              onPressed: (){
                //action du bouton
                //naviguer vers la page dashboard
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return DashBoard(password: passwordController.text,);
                    }
                ));
              },
              child: const Text("Connection")
          ),


          TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return Inscription();
                    }
                ));

              },
              child: const Text("Inscription")
          )
        ],
      ),
    );




  }
}
