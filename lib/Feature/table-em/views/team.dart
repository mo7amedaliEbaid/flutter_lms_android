// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Team extends StatelessWidget {
  const Team({super.key});

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
                "أختار الفرقة",
                style: TextStyle(
                    color: Colors.white, fontFamily: "wolfex", fontSize: 19),
              ),
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(5, 30, 15, 0),
            ),
            SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset(
                      'assets/img/yyo.png',
                      width: 300,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/exam-medterm');
                          },
                          child: CustomText(
                            team: "الفرقة الأولي",
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/exam-medterm');
                          },
                          child: CustomText(
                            team: "الفرقة الثانية",
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/exam-medterm');
                          },
                          child: CustomText(
                            team: "الفرقة الثالثة",
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/exam-medterm');
                          },
                          child: CustomText(
                            team: "الفرقة الرابعة",
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.team});

  final String team;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 25, 15, 0),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(82, 63, 237, 1),
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage('assets/img/Group81.png'),
        ),
      ),
      padding: EdgeInsets.only(right: 25),
      width: 385,
      height: 52,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/exam-medterm');
        },
        child: Text(
          team,
          style: TextStyle(fontFamily: "wolfex", color: Colors.white),
        ),
      ),
    );
  }
}
