import 'package:audixa/Pages/MyHome.dart';
import 'package:audixa/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verifycode extends StatefulWidget {
  String verificationId;

  Verifycode({super.key, required this.verificationId});

  @override
  State<Verifycode> createState() => _VerifycodeState();
}

class _VerifycodeState extends State<Verifycode> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(title: Text("VERIFICATION OTP CODE"),),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomField(
                    TextInputType.phone, "Enter your code", "Code",
                    Icon(Icons.phone_iphone), otpController, false
                ),
                SizedBox(height: 20,),
                Uihelper.CustomButton(() async {
                  try {
                    PhoneAuthCredential credential = await PhoneAuthProvider
                        .credential(verificationId: widget.verificationId,
                        smsCode: otpController.text.toString());
                    FirebaseAuth.instance.signInWithCredential(credential).then((v) => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHome()))});
                  } catch (ex){
                     Uihelper.CustomAlertBox(context, ex.toString());
                  }
                }, Text("VERIFICATION OTP"))
              ],
            ),
          )),
    );
  }
}
