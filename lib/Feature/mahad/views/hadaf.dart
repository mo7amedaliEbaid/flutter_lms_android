// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Hadaf extends StatelessWidget {
  const Hadaf({super.key});

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
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'العودة',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: "wolfexx"),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Welcome();
                        }));
                      },
                      child: Icon(
                        Icons.chevron_right_sharp,
                        size: 32,
                        color: Color.fromRGBO(68, 54, 189, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 17.5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/img/yyo.png',
                    width: 380,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "أهداف التطبيق",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "wolfex",
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022  التطبيقات الجامعية للجامعات الحكومية تشكل جزءًا أساسيًا من التحول الرقمي الحديث في مجال التعليم العالي.  ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\u2022  يعزز استخدام التطبيقات التكنولوجية في الجامعات الحكومية التفاعل بين الطلاب والمحاضرين، وتعزيز تجربة التعلم. ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\u2022  يوفر التطبيق للطلاب فرصة الوصول السهل والسريع إلى المحتوى التعليمي.",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\u2022  الهدف من  التطبيق،  سهولة وصول الطلاب الي المحتوي التعليمي، مما يعزز الفعالية في إدارة الوقت والدراسة.",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\u2022  كما يسهم التطبيق في تعزيز التواصل بين الطلاب من خلال منصات التواصل الاجتماعي المدمجة، مما يعزز التعاون وتبادل الأفكار.",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\u2022  من جانبها، تستفيد الجامعات من تطبيقاتها في تيسير عمليات الإدارة والتنظيم، سواء كان ذلك في تسجيل الطلاب أو إدارة الجداول الدراسية. تسهم هذه التكنولوجيا في تقديم خدمات فعالة وسلسة للطلاب وتعزيز جودة التعليم في الجامعات الحكومية. بشكل عام، يعكس تبني التطبيقات التكنولوجية للجامعات التزامها بتحسين تجربة الطلاب ورفع مستوى التعليم والبحث العلمي.",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
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
