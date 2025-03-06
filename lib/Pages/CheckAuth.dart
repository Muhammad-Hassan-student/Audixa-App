import 'package:audixa/Pages/MyHome.dart';
import 'package:audixa/Pages/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkauth extends StatefulWidget {
  const Checkauth({super.key});

  @override
  State<Checkauth> createState() => _CheckauthState();
}

class _CheckauthState extends State<Checkauth> {
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
  checkUser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return MyHome();
    }else{
      return Signin();
    }
  }
}
