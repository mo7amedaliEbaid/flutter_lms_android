// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/utils/Custom_loading_indicator.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/exam/controller/exam_schedule.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_lms/Feature/exam/views/widgets/exam_item.dart';

import '../../../Core/Network/local_Network.dart';
import '../../Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';

class ExamMedterm extends StatefulWidget {
  const ExamMedterm({super.key});

  @override
  State<ExamMedterm> createState() => _ExamMedtermState();
}

class _ExamMedtermState extends State<ExamMedterm> {
  List<String> items = ['جدول التخلفات', 'جدول الفاينل', 'جدول الميد ترم'];

  int selecteditem = 2;

  @override
  void initState() {
    context.read<ExamCubit>().fetchExams(token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawerr(),
        floatingActionButton: FloatingActionButtonn(),
        backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
        body: ListView(children: [
          CustomAppBar(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
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
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Color.fromRGBO(82, 63, 237, 1),
                    size: 30.sp,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: items.asMap().entries.map((e) {
                  int index = e.key;
                  var value = e.value;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selecteditem = index;
                        });
                      },
                      child: Padding(
                        padding: index == 1
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : EdgeInsets.zero,
                        child: ExamItem(
                            tilte: items[index],
                            isactive: selecteditem == index),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            BlocBuilder<ExamCubit, ExamState>(
              builder: (context, state) {
                if (state is ExamError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (state is ExamLoading) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                      child: CustomLoadinfIndicator(),
                    ),
                  );
                } else if (state is ExamLoaded) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    // "نظم معلومات محاسبية",
                                    state.exam.days?.first["السبت"] != null
                                        ? state.exam.days!.first["السبت"]
                                            ['subject']
                                        : '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(0, 10)}  السبت "
                                        : '',
                                    //  "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(11, 19)}  وقت الامتحان "
                                        : '',
                                    // "12:00 PM وقت الامتحان",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    // "نظم معلومات محاسبية",
                                    state.exam.days?.first["السبت"] != null
                                        ? state.exam.days!.first["السبت"]
                                            ['subject']
                                        : '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(0, 10)}  السبت "
                                        : '',
                                    //  "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(11, 19)}  وقت الامتحان "
                                        : '',
                                    // "12:00 PM وقت الامتحان",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    // "نظم معلومات محاسبية",
                                    state.exam.days?.first["السبت"] != null
                                        ? state.exam.days!.first["السبت"]
                                            ['subject']
                                        : '',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(0, 10)}  السبت "
                                        : '',
                                    //  "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                  Text(
                                    state.exam.days?.first["السبت"] != null
                                        ? "${state.exam.days!.first["السبت"]['time'].toString().substring(11, 19)}  وقت الامتحان "
                                        : '',
                                    // "12:00 PM وقت الامتحان",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: Text(
                    "Else",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            SizedBox(
              height: 90,
            )
            /*selecteditem == 2
                ? Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 120, bottom: 11),
                              child: Text(
                                "نظم معلومات محاسبية",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'wolfex',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 170, bottom: 2),
                              child: Text(
                                "السبت   2024/1/2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12.sp),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 142, bottom: 1),
                              child: Text(
                                "12:00 PM وقت الامتحان ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12.sp),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 120, bottom: 11),
                              child: Text(
                                "نظم معلومات محاسبية",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'wolfex',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 170, bottom: 2),
                              child: Text(
                                "السبت   2024/1/2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12.sp),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 142, bottom: 1),
                              child: Text(
                                "12:00 PM وقت الامتحان ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12.sp),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 120, bottom: 11),
                              child: Text(
                                "نظم معلومات محاسبية",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'wolfex',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 170, bottom: 2),
                              child: Text(
                                "السبت   2024/1/2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 142, bottom: 1),
                              child: Text(
                                "12:00 PM وقت الامتحان ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 92),
                          width: 279.w,
                          height: 104.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.98, -0.21),
                              end: Alignment(-0.98, 0.21),
                              colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, left: 120, bottom: 11),
                              child: Text(
                                "نظم معلومات محاسبية",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontFamily: 'wolfex',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 170, bottom: 2),
                              child: Text(
                                "السبت   2024/1/2",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12.sp),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 142, bottom: 1),
                              child: Text(
                                "12:00 PM وقت الامتحان ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
                                    fontSize: 12),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  )
                : selecteditem == 1
                    ? Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "نظم معلومات محاسبية",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'wolfex',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "السبت   2024/1/2",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "12:00 PM وقت الامتحان",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "نظم معلومات محاسبية",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'wolfex',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "السبت   2024/1/2",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "12:00 PM وقت الامتحان",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "نظم معلومات محاسبية",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'wolfex',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "السبت   2024/1/2",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "12:00 PM وقت الامتحان",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "نظم معلومات محاسبية",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'wolfex',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "السبت   2024/1/2",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "12:00 PM وقت الامتحان",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 12),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 120, bottom: 11),
                                  child: Text(
                                    "نظم معلومات محاسبية",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 170, bottom: 2),
                                  child: Text(
                                    "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 142, bottom: 1),
                                  child: Text(
                                    "12:00 PM وقت الامتحان ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 120, bottom: 11),
                                  child: Text(
                                    "نظم معلومات محاسبية",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 170, bottom: 2),
                                  child: Text(
                                    "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 142, bottom: 1),
                                  child: Text(
                                    "12:00 PM وقت الامتحان ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 120, bottom: 11),
                                  child: Text(
                                    "نظم معلومات محاسبية",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 170, bottom: 2),
                                  child: Text(
                                    "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 142, bottom: 1),
                                  child: Text(
                                    "12:00 PM وقت الامتحان ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 92),
                              width: 279.w,
                              height: 104.h,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.98, -0.21),
                                  end: Alignment(-0.98, 0.21),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xE57D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 120, bottom: 11),
                                  child: Text(
                                    "نظم معلومات محاسبية",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'wolfex',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 170, bottom: 2),
                                  child: Text(
                                    "السبت   2024/1/2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12.sp),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 142, bottom: 1),
                                  child: Text(
                                    "12:00 PM وقت الامتحان ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      )*/
          ]),
        ]));
  }
}
