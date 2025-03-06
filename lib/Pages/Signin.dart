import 'package:audixa/Pages/ForgotPassword.dart';
import 'package:audixa/Pages/MyHome.dart';
import 'package:audixa/Pages/Signup.dart';
import 'package:audixa/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Signin(String email, String password) async {
    if (email == "" && password == "") {
      return Uihelper.CustomAlertBox(context, "Please required all fields");
    } else {
      UserCredential? usercredentials;
      try {
        usercredentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((val) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHome()));
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
          title: Text("Sign in"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomField(
                TextInputType.emailAddress,
                "example@gmail.com",
                "Email",
                Icon(Icons.email_outlined),
                emailController,
                false),
            Uihelper.CustomField(
                TextInputType.visiblePassword,
                "Enter your password",
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
                    "If you have no account",
                    style: TextStyle(
                        fontFamily: "Charmonman",
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Create a new account",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            Uihelper.CustomButton(() {
              setState(() {
                Signin(emailController.text.toString(),
                    passwordController.text.toString());
              });
            },
                Text(
                  "Sign in",
                  style: TextStyle(fontSize: 18, fontFamily: "Charmonman"),
                )),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
            }, child: Text("Forgot password"))
          ],
        ),
      )),
    );
  }
}
