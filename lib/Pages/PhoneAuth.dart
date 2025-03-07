import 'package:audixa/Pages/VerifyCode.dart';
import 'package:audixa/widgets/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Phone Authentication"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomField(
                TextInputType.phone,
                "Enter your phone number",
                "Phone Number",
                Icon(Icons.phone),
                phoneController,
                false),
            SizedBox(
              height: 20,
            ),
            Uihelper.CustomButton(() async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendToken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Verifycode(
                                  verificationId: verificationId,
                                )));
                    return;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber: phoneController.text.toString());
            }, Text("SEND OTP"))
          ],
        ),
      )),
    );
  }
}
