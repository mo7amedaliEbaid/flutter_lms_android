// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class MnMahad extends StatelessWidget {
  const MnMahad({super.key});

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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Welcome();
                  }));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              'العودة',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "wolfexx"),
                            ),
                            Icon(
                              Icons.chevron_right_sharp,
                              size: 32,
                              color: Color.fromRGBO(68, 54, 189, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: Text(
                      "ما يمنحة المعهد",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'wolfex',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset(
                    'assets/img/yyo.png',
                    width: 300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    "يمنح المعهد العالي للإدارة وتكنولوجيا المعلومات بكفر الشيخ شهادة بكالوريوس في التخصص ويؤجل الجيش الي سن 28 سنه وبعد الحصول علي البكالوريوس سوف تكون الخدمة العسكرية سنه واحده فقط وشهادة البكالوريوس معتمده من وزير التعليم العالي ومن المجلس الاعلي للجامعات ويتضمن فيها نصاً ان الدرجة تعادل درجة البكالوريوس التي تمنحها الجامعات الحكومية المصريه والطالب له جميع الحقوق مثل خريجي الجامعات الحكومية وله حق عمل ماجستير ودكتوراه أيضا وبالتوفيق الدائم للجميع.",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.5,
                      fontFamily: 'wolfexx',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
