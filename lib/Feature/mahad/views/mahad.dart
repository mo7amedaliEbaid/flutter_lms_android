// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Mahad extends StatelessWidget {
  const Mahad({super.key});

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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Welcome();
                        }));
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
                        "رؤية المعهد",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'wolfex',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "وله شخصية إعتبارية وأمواله مستقلة عن أموال الجمعية وتصرف فقط فى الأغراض العلمية والتعليمية والبحثية لتحقيق أهداف المعهد، يهدف المعهد إلى إعداد خريجين متميزين متخصصين للعمل فى مجالات الحاسبات وتكنولوجيا المعلومات والإدارة والمحاسبة مؤهلين للعمل والتعامل مع التغيرات البيئية وقادرين على التعامل مع سوق العمل المفتوح فى ظل العولمة وما تتطلبه من قدرات إبداعية خلاقة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "رسالة المعهد",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'wolfex',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "تأهيل الكوادر المتخصصة فى مجال المحاسبة وإدارة الأعمال وعلوم الحاسب ونظم المعلومات القادرة على العمل الجماعى والإبتكار والإبداع والتعامل مع مستجدات التغييرات البيئية لسوق العمل المفتوح والذى يؤمن بمبدأ البقاء للأفضل",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "أهداف المعهد",
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
                        "\u2022 العمل على تهيئة البيئة التعليمية التى تلبي تطلعات الطلاب وتعزيز الأنشطة الطلابية",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 الإرتقاء بمستوى الطلاب أخلاقياً وسلوكياً وفكرياً",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 السعى إلى تحقيق معايير الجودة والإعتماد المطلوبة فى جميع البرامج والمجالات الأكاديمية",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 ربط البرامج والمقررات الدراسية بمتطلبات وإحتياجات سوق العمل",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 السعى إلى زيادة المهارات الخاصة لدى الطلاب من خلال تأهيلهم للحصول على شهادات مهنية متخصصة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 يهدف المعهد إلى تطبيق إدارة الجودة الشامة ( ISO ) فى الخدمات الإدارية التى يقدمها",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.5,
                          fontFamily: 'wolfexx',
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "\u2022 السعى إلى مضاعفة أعداد البحوث العلمية والتطبيقية التى تساهم فى تشجيع الإبداع والإبتكار",
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
