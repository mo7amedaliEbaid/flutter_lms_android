// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/table/controller/cubit/time_table_cubit.dart';
import 'package:flutter_lms/Feature/table/schedule_cubit.dart';
import 'package:flutter_lms/Feature/table/views/Navigation_Bar.dart';
import 'package:flutter_lms/Feature/table/views/events.dart';
import 'package:flutter_lms/Feature/table/views/skashen.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';
import 'package:flutter_lms/Feature/welcome/views/widgets/Custom_List_View.dart';

import '../../../Core/Network/local_Network.dart';
import '../../Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';

class TableMohadrat extends StatefulWidget {
  const TableMohadrat({super.key});

  @override
  State<TableMohadrat> createState() => _TableMohadratState();
}

class _TableMohadratState extends State<TableMohadrat> {
  final currentTime = DateTime.now();

  bool? selected = true;
  bool? selected1 = false;
  bool? dataselected = false;

  @override
  void initState() {
    context.read<ScheduleCubit>().fetchSchedule(token!);
    String weekday = DateFormat('EEEE').format(currentTime);
    if (weekday == "Saturday") {
      carouselCurrentIndex = 0;
    } else if (weekday == "Sunday") {
      carouselCurrentIndex = 1;
    } else if (weekday == "Monday") {
      carouselCurrentIndex = 2;
    } else if (weekday == "Tuesday") {
      carouselCurrentIndex = 3;
    } else if (weekday == "Wednesday") {
      carouselCurrentIndex = 4;
    } else if (weekday == "Thursday") {
      carouselCurrentIndex = 5;
    }
    /* else if (weekday == "Friday") {
      carouselCurrentIndex = 6;
    }*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomAppBar();
    return BlocConsumer<TimeTableCubit, TimeTableState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TimeTableCubit>(context);

        return Scaffold(
            appBar: AppBar(
              leading: Builder(builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/berg.png',
                        width: 23,
                      ),
                    ],
                  ),
                );
              }),
              title: Image.asset(
                constant().logo,
                height: 40,
              ),
              centerTitle: true,
              actions: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/img/no-open.png",
                        height: 31,
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
              iconTheme: IconThemeData(
                color: const Color.fromRGBO(82, 63, 237, 1),
              ),
            ),
            drawer: Drawerr(),
            floatingActionButton: FloatingActionButtonn(),
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: ListView(children: [
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected1 = true;
                          selected = false;
                        });
                      },
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(140, 25, 1, 0),
                        width: 117,
                        height: 42,
                        decoration: selected1 != true
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color.fromRGBO(82, 63, 237, 1),
                                  width: 1.5,
                                ))
                            : ShapeDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xFF7D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                        child: const Center(
                          child: Text(
                            "جدول السكاشن",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = true;
                          selected1 = false;
                        });
                      },
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(10, 25, 15, 0),
                        width: 117,
                        height: 42,
                        decoration: selected == true
                            ? ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(1.00, -0.10),
                                  end: Alignment(-1, 0.1),
                                  colors: [
                                    Color(0xFF523FED),
                                    Color(0xFF7D3CFC)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color.fromRGBO(82, 63, 237, 1),
                                  width: 1.5,
                                )),
                        child: const Center(
                          child: Text(
                            "جدول المحاضرات",
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
              Container(
                  child: selected == true && selected1 == false
                      ? BlocBuilder<ScheduleCubit, ScheduleState>(
                          builder: (context, schState) {
                            if (schState is ScheduleLoading) {
                              return Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 88.0),
                                child: CustomLoadinfIndicator(),
                              ));
                            } else if (schState is ScheduleError) {
                              return Center(
                                child: Text(
                                  schState.errorMessage,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              );
                            } else if (schState is ScheduleLoaded) {
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Text(
                                        "المكان : سينمار 4 - الدور الخامس",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "wolfex",
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 66,
                                      child: ListView.builder(
                                          reverse: true,
                                          itemCount: 6,
                                          scrollDirection: Axis.horizontal,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Days[index];
                                                setState(() {
                                                  carouselCurrentIndex = index;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        12.2, 25, 0, 0),
                                                    width: 52.8,
                                                    height: 41,
                                                    decoration:
                                                        carouselCurrentIndex !=
                                                                index
                                                            ? BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                border:
                                                                    Border.all(
                                                                  color: const Color
                                                                      .fromRGBO(
                                                                      82,
                                                                      63,
                                                                      237,
                                                                      1),
                                                                  width: 1.5,
                                                                ))
                                                            : ShapeDecoration(
                                                                gradient:
                                                                    const LinearGradient(
                                                                  begin:
                                                                      Alignment(
                                                                          1.00,
                                                                          -0.10),
                                                                  end:
                                                                      Alignment(
                                                                          -1,
                                                                          0.1),
                                                                  colors: [
                                                                    Color(
                                                                        0xFF523FED),
                                                                    Color(
                                                                        0xFF7D3CFC)
                                                                  ],
                                                                ),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                              ),
                                                    child: Center(
                                                      child: Text(
                                                        days[index],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                "wolfexx",
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                        height: 10,
                                        child: Center(
                                            child: Days[carouselCurrentIndex])),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 0),
                                      child: Column(
                                        children: [
                                          if (schState
                                              .schedule
                                              .days![carouselCurrentIndex]
                                              .data!
                                              .isEmpty)
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 38.0),
                                                child: Text(
                                                  "لا يوجد لديك محاضرات اليوم",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "wolfex",
                                                  ),
                                                ),
                                              ),
                                            )
                                          else
                                            ...schState
                                                .schedule
                                                .days![carouselCurrentIndex]
                                                .data!
                                                .asMap()
                                                .entries
                                                .map(
                                              (entry) {
                                                final int index = entry.key;
                                                final Data e = entry.value;

                                                final dataTime =
                                                    e.time!.split(':');
                                                final dataHour =
                                                    int.parse(dataTime[0]);
                                                final dataMinute =
                                                    int.parse(dataTime[1]);

                                                final isPassed =
                                                    currentTime.hour >
                                                            dataHour ||
                                                        (currentTime.hour ==
                                                                dataHour &&
                                                            currentTime.minute >
                                                                dataMinute);

                                                // Determine if it's the first or last element
                                                final isFirst = index == 0;
                                                final isLast = index ==
                                                    schState
                                                            .schedule
                                                            .days![
                                                                carouselCurrentIndex]
                                                            .data!
                                                            .length -
                                                        1;

                                                return TimeLineWidget(
                                                  isFirst: isFirst,
                                                  isLast: isLast,
                                                  isPast: isPassed,
                                                  scheduleData: e,
                                                );
                                              },
                                            ).toList(),
                                        ],
                                      ),
                                    ),
                                  ]);
                            }
                            return Center(
                              child: Text(
                                "Else",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        )
                      : Skashen()),
              SizedBox(
                height: 70,
              )
            ]));
      },
    );
  }

  List<Widget> Days = [
    SizedBox(
      child: Text(
        "يوم السبت",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    ),
    Text(
      "يوم الحد",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
    Text(
      "يوم الاتثنين",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
    Text(
      "يوم الثلاثاء",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
    Text(
      "يوم الاربعاء",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
    Text(
      "يوم الخميس",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),
    /* Text(
      "يوم الحمعه",
      style: TextStyle(color: Colors.white, fontSize: 30),
    ),*/
  ];
}

List<String> days = [
  "السبت",
  "الاحد",
  "الاثنين",
  "الثلاثاء",
  "الاربعاء",
  "الخميس",
//  "الجمعة"
];
