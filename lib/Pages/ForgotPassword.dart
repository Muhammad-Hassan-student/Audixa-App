import 'package:audixa/Pages/Signin.dart';
import 'package:audixa/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();

  forgotpassword(String email) async {
    if(email == ""){
      return Uihelper.CustomAlertBox(context, "Please provide your email to forgot password.");
    }else{
   await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((v) => Signin());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Forgot Password"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomField(TextInputType.emailAddress, "example@gmail.com", "Email address", Icon(Icons.email_outlined), emailController, false),
           SizedBox(height: 20,),
            Uihelper.CustomButton((){setState(() {
              forgotpassword(emailController.text.toString());
            });}, Text("Reset password",style: TextStyle(fontSize: 18, fontFamily: "Charmonman"),))
          ],
        ),
      )),
    );
  }
}
