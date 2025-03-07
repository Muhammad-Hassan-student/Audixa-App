import 'package:flutter/material.dart';

class Uihelper {
  static CustomField(TextInputType, String hint, String label, icon,
      textController, bool obsecure) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: TextField(
        keyboardType: TextInputType,
        controller: textController,
        obscureText: obsecure,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback callback, Widget child) {
    return ElevatedButton(
      onPressed: callback,
      child: child,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Icon(Icons.add_alert, size: 50,),
                SizedBox(height: 20,),
                Text(text, style: TextStyle(fontSize: 16, color: Colors.red),)
              ],
            ),
            actions: [
              Center(
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Ok")),
              )
            ],
          );
        });
  }

  static CustomPhoneField(VoidCallback callBack,Widget Icon, String buttonText,ButtonStyle ) {
    return Padding(
      padding: const EdgeInsets.only(left: 40 ,right: 40),
      child: ElevatedButton(onPressed: callBack,
          style: ButtonStyle,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon, Text(buttonText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),)],)),
    );
  }
}
