// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTkalf extends StatelessWidget {
  const ExamTkalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawerr(),
        floatingActionButton: FloatingActionButtonn(),
        backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
        body: ListView(children: [
          CustomAppBar(),
          Center(
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(300, 0, 0, 0),
                    child: Text(
                      "العودة",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'wolfexx',
                        fontWeight: FontWeight.w700,
                        height: 0.09.h,
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
          Container(
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/exam-tkalf');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 25, 10, 0),
                        width: 117.w,
                        height: 42.h,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.00, -0.10),
                            end: Alignment(-1, 0.1),
                            colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Center(
                          child: Text(
                            "جدول التخلفات",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/exam-final');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 25, 5, 0),
                        width: 117.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromRGBO(82, 63, 237, 1),
                              width: 1.5.w,
                            )),
                        child: Center(
                          child: Text(
                            "جدول الفاينال",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/exam-medterm');
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 25, 0, 0),
                        width: 117.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromRGBO(82, 63, 237, 1),
                              width: 1.5.w,
                            )),
                        child: Center(
                          child: Text(
                            "جدول الميد ترم",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ]),
          ),
        ]));
  }
}
