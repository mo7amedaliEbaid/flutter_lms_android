// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Amed extends StatefulWidget {
  const Amed({super.key});

  @override
  State<Amed> createState() => _AmedState();
}

class _AmedState extends State<Amed> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "كلمة عميد المعهد",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'wolfex',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 98,
                    height: 184,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFF474BF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          top: 22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'ا.د',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'wolfexx',
                                ),
                              ),
                              Text(
                                'رضا إبراهيم صالح',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'wolfexx',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: -5,
                          top: 50,
                          child: Container(
                            width: 113,
                            height: 113,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://f.top4top.io/p_2895d73ac1.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(21),
                                  bottomRight: Radius.circular(11),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 62, right: 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/amed.png',
                              width: 400,
                              height: 300,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                "أبنائى وبناتى طلبة وطالبات المعهد العالى للإدارة وتكنولوجيا المعلومات بكفر الشيخ يسعدنى أن أرحب بكم فى رحاب معهدكم .. ذلك المعهد الذى كان أول نافذة للعلم فى محافظة كفر الشيخ على التعليم العالى والبحث العلمى وأيضاً هذا المعهد الذى يتميز بتخصصاته المختلفة من إدارة ومحاسبة وعلوم حاسب ونظم المعلومات الإدارية، وبما تسمح به إمكانياته المادية والبشرية والتى أخصها أعضاء هيئة تدريس متميزين ذو سمعة طيبة أرجو أن تستفيدوا بما يهيئه لكم معهدكم من خدمات علمية وأنشطة متنوعة رياضية وإجتماعية وثقافية .. وأن تتمتعوا بحياتكم الجامعية بممارسة كافة الأنشطة، بحيث يتحقق التوازن المطلوب بين العلم التخصصى كدراسة وبناء الشخصية الجيدة من خلال تنمية الإبتكار والإبداع فى كافة نواحى النشاط، ما أحلى النجاح وما أروع أن تحققوا أهدافكم .. كونوا أصحاب حلم أو أصحاب رؤية .. ولا ترضوا فى طموحكم بالقليل .. ولا تستصغروا من عملكم شيئاً .. فأول الطريق خطوة .. وبداية الغيث قطرة .. وإن الجبال من الحصى .. فإسعوا وأعملوا .. وإنجحوا .. وحققوا طموحاتكم وآمالكم .. وكونوا ذو إرادة وعزم، وإعلموا ” أن الله لا يضيع أجر من أحسن عملاً “وأخيراً : فانتم نصف الحاضر وكل المستقبل ومصرنا العزيزة تمر بمرحلة هامة وجادة، أوصيكم أن تكونوا أوفياء بررة لمصرنا الحبيبة، وأن تجدوا وتجتهدوا كى يكون لكم دور فى النهوض بهذا البلد الطيب المعطاء والله ولى التوفيق",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
