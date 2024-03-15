// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Tableex extends StatelessWidget {
  const Tableex({super.key});

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
              height: 30,
            ),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
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
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Welcome();
                          }));
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Color.fromRGBO(82, 63, 237, 1),
                          size: 30,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              ),
            ),
            Container(
              child: Text(
                "أختار الشعبة",
                style: TextStyle(
                    color: Colors.white, fontFamily: "wolfex", fontSize: 19),
              ),
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(5, 30, 15, 0),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/team');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(200, 30, 0, 0),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(82, 63, 237, 1),
                      ),
                      padding: EdgeInsets.only(top: 50),
                      width: 181,
                      height: 116,
                      child: Text(
                        "  علوم الحاسب  ",
                        style: TextStyle(
                            fontFamily: "wolfex", color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/team');
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(200, 30, 0, 0),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(82, 63, 237, 1),
                      ),
                      padding: EdgeInsets.only(top: 50),
                      width: 181,
                      height: 116,
                      child: Text(
                        "  ادارة ومحاسبة  ",
                        style: TextStyle(
                            fontFamily: "wolfex", color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/team');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(200, 30, 0, 100),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(82, 63, 237, 1),
                ),
                padding: EdgeInsets.only(top: 50),
                width: 181,
                height: 116,
                child: Text(
                  "  محاسبة  ",
                  style: TextStyle(fontFamily: "wolfex", color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
