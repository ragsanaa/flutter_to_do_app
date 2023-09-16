// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/screens/home_screen.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset("assets/images/icon.png"),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your name",
            labelText: "Username",
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Enter your password",
            labelText: "Password",
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text("Sign In"))
      ]),
    );
  }
}
