// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';

class Notexam extends StatelessWidget {
  const Notexam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerr(),
      floatingActionButton: FloatingActionButtonn(),
      backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(321, 0, 0, 0),
                      child: Text(
                        "العودة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'wolfexx',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color.fromRGBO(82, 63, 237, 1),
                        size: 30,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Image.asset(
                        "assets/img/notexam.png",
                        scale: 1.0,
                        width: 204.77,
                        height: 204.77,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "! لم يتم الأعلان عن جداول الامتحانات بعد ",
              style: TextStyle(
                  color: Color.fromARGB(97, 255, 255, 255),
                  fontFamily: "wolfexx",
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
