// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Seyasa extends StatelessWidget {
  const Seyasa({super.key});

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
                        "سياسة الاستخدام",
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
                        "\u2022  سياسة استخدام التطبيقات في الجامعات الحكومية تلعب دورًا حيويًا في ضمان تحقيق أقصى استفادة من التكنولوجيا الحديثة تتضمن هذه السياسة ضوابط صارمة للحفاظ على أمان المعلومات وحماية خصوصية الطلاب",
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
                        "\u2022  تُشجع الجامعات على توفير دورات تدريبية للطلاب لضمان فهمهم الكامل لاستخدام التطبيق بشكل آمن وفعّال يُحث الطلاب على استخدام التطبيقات كأداة تعليمية بناءة، وتجنب إساءة استخدامها للأغراض غير الملائمة ",
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
                        "\u2022  تتيح هذه السياسة أيضًا للجامعات مراقبة أداء التطبيق وجمع بيانات حول تفاعل الطلاب، مما يسهم في تحسين العملية التعليمية. بشكل عام، تتجه سياسات استخدام التطبيقات في الجامعات الحكومية نحو تحقيق التوازن بين التكنولوجيا وحقوق الأفراد وجودة التعليم",
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
