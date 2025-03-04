import 'package:flutter/material.dart';
import 'package:audixa/layout/colors.dart' as AppColors;
import 'package:google_fonts/google_fonts.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Audixa",
                  style: TextStyle(
                      fontFamily: "Charmonman",
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(left: 11, right: 11),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Popular  Books",
                        style: GoogleFonts.inika(
                            textStyle: Theme.of(context).textTheme.displaySmall,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(height: 1, width: 50, color: Colors.black),
                    ],
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          height: 180,
                          width: 180,
                          color: Colors.red,
                          child: Text("data"),
                        );
                      },
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
