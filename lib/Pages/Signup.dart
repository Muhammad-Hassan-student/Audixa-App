import 'package:audixa/Pages/MyHome.dart';
import 'package:audixa/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Signup();
  }
}

class _Signup extends State<Signup> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  Signup(String email, String password) async {
    if (email == "" && password == "") {
      return Uihelper.CustomAlertBox(context, "Please required all fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password).then((v){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
        });
      } on FirebaseAuthException catch (e) {
        
        return Uihelper.CustomAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Center(
                child: Text(
              "Sign up",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Charmonman", fontSize: 26),
            )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emailController.text),
              Uihelper.CustomField(
                  TextInputType.emailAddress,
                  "Enter your email",
                  "Email",
                  Icon(Icons.email),
                  emailController,
                  false),
              Uihelper.CustomField(
                  TextInputType.visiblePassword,
                  "Enter your Password",
                  "Password",
                  Icon(Icons.password),
                  passwordController,
                  true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Text(
                      "If you have account",
                      style: TextStyle(
                          fontFamily: "Charmonman",
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyHome()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                ],
              ),
              Uihelper.CustomButton(() {
                setState(() {
                  Signup(emailController.text.toString(),
                      passwordController.text.toString());
                });
              },
                  Text(
                    "Sign up",
                    style: TextStyle(fontSize: 18, fontFamily: "Charmonman"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
