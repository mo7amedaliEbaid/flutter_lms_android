// ignore_for_file: no_leading_underscores_for_local_identifiers, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/exam/views/widgets/active_and_inactive_item.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamFinal extends StatefulWidget {
  const ExamFinal({super.key});

  @override
  State<ExamFinal> createState() => _ExamFinalState();
}

class _ExamFinalState extends State<ExamFinal> {

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
          Container(
            child: Column(children: [
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: 
              // ),
              
            ]),
          ),
        ]));
  }
}
