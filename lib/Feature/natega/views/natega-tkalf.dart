// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class NategaaTkalf extends StatelessWidget {
  NategaaTkalf({super.key, this.backwards});

  List? backwards;

  @override
  Widget build(BuildContext context) {
    return backwards == null
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(top: 28),
            ),
          )
        : Column(
            children: [
              ...backwards!.map(
                (e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 36.77,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.40, color: Color(0xFF523FED)),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(7),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(60, 7, 0, 0),
                        child: Text(
                          e['value'],
                          style: TextStyle(
                              color: Color.fromARGB(219, 255, 17, 0),
                              fontFamily: "wolfexx",
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 36.77,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.40, color: Color(0xFF523FED)),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(7),
                            topLeft: Radius.circular(0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(55, 6, 0, 0),
                        child: Text(
                          e['name'],
                          style: TextStyle(
                              color: Color.fromARGB(219, 255, 255, 255),
                              fontFamily: "wolfexx",
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              )
              /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 36.77,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.40, color: Color(0xFF523FED)),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(7),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 7, 0, 0),
                child: Text(
                  "ضـ جـ",
                  style: TextStyle(
                      color: Color.fromARGB(219, 255, 17, 0),
                      fontFamily: "wolfexx",
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 36.77,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.40, color: Color(0xFF523FED)),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(7),
                    topLeft: Radius.circular(0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(55, 6, 0, 0),
                child: Text(
                  "قواعد البيانات",
                  style: TextStyle(
                      color: Color.fromARGB(219, 255, 255, 255),
                      fontFamily: "wolfexx",
                      fontSize: 12),
                ),
              ),
            )
          ],
        ),*/
              /*    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 36.77,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.40, color: Color(0xFF523FED)),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(7),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(66, 7, 0, 0),
                      child: Text(
                        "غ",
                        style: TextStyle(
                            color: Color.fromARGB(219, 255, 0, 0),
                            fontFamily: "wolfexx",
                            fontSize: 12),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: 150,
                    height: 36.77,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.40, color: Color(0xFF523FED)),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(7),
                          topLeft: Radius.circular(0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(66, 6, 0, 0),
                      child: Text(
                        "حزم الأحصاء",
                        style: TextStyle(
                            color: Color.fromARGB(219, 255, 255, 255),
                            fontFamily: "wolfexx",
                            fontSize: 12),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 36.77,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.40, color: Color(0xFF523FED)),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(7),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(66, 7, 0, 0),
                      child: Text(
                        "ض",
                        style: TextStyle(
                            color: Color.fromARGB(219, 255, 0, 0),
                            fontFamily: "wolfexx",
                            fontSize: 12),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: 150,
                    height: 36.77,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.40, color: Color(0xFF523FED)),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(7),
                          topLeft: Radius.circular(0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(41, 6, 0, 0),
                      child: Text(
                        "محاسبة التكاليف",
                        style: TextStyle(
                            color: Color.fromARGB(219, 255, 255, 255),
                            fontFamily: "wolfexx",
                            fontSize: 12),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  )
                ],
              ),*/
            ],
          ); /*BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AuthCubit>(context);
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Welcome();
                            }));
                          },
                          child: Text(
                            'العودة',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: "wolfexx"),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_sharp,
                          size: 33,
                          color: Color.fromRGBO(68, 54, 189, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "نتيجة الامتحانات",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "wolfex",
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "نتيجة امتحان الترمين الاول والثاني",
                          style: TextStyle(
                            color: const Color.fromARGB(68, 255, 255, 255),
                            fontFamily: "wolfexx",
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/natega-trakomy');
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 8, 10, 0),
                                width: 89,
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(82, 63, 237, 1),
                                      width: 1.5,
                                    )),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/natega-trakomy');
                                  },
                                  child: Center(
                                    child: Text(
                                      "التراكمي",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "wolfexx",
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              width: 89,
                              height: 28,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(1.00, -0.10),
                                  end: Alignment(-1, 0.1),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xFF7D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              child: Center(
                                child: Text(
                                  "مواد التخلف",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "wolfexx",
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/nategaa');
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                                width: 89,
                                height: 28,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(82, 63, 237, 1),
                                      width: 1.5,
                                    )),
                                child: Center(
                                  child: Text(
                                    "النتيجة",
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
                      SizedBox(
                        height: 26,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "الاسم : ${cubit.authModel!.f_Name} ${cubit.authModel!.l_Name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 13,
                            width: 370,
                          ),
                          Text(
                            "الحالة  : ${cubit.authModel!.studyCase}",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 16,
                                child: ListView.builder(
                                    itemCount:
                                        cubit.authModel!.seatingNumbers?.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        '${cubit.authModel!.seatingNumbers?[index]}',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    }),
                              ),
                              Text(
                                "  : رقم الجلوس",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 13),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 26,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(7),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(60, 7, 0, 0),
                              child: Text(
                                "ضـ جـ",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 17, 0),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(7),
                                  topLeft: Radius.circular(0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(55, 6, 0, 0),
                              child: Text(
                                "قواعد البيانات",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 255, 255),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(7),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(66, 7, 0, 0),
                              child: Text(
                                "غ",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 0, 0),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 20),
                          ),
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(7),
                                  topLeft: Radius.circular(0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(66, 6, 0, 0),
                              child: Text(
                                "حزم الأحصاء",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 255, 255),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 20),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(7),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(7),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(66, 7, 0, 0),
                              child: Text(
                                "ض",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 0, 0),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 20),
                          ),
                          Container(
                            width: 150,
                            height: 36.77,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.40, color: Color(0xFF523FED)),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(7),
                                  topLeft: Radius.circular(0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(41, 6, 0, 0),
                              child: Text(
                                "محاسبة التكاليف",
                                style: TextStyle(
                                    color: Color.fromARGB(219, 255, 255, 255),
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );*/
  }
}
