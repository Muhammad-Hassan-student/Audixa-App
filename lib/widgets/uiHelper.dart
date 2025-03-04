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
            title: Text(text),
            // actions: [
            //   Navigator.pop(context);
            // ],
          );
        });
  }
}
