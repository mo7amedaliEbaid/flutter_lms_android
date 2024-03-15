// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_lms/Feature/table/views/events.dart';

import '../../../Core/Network/local_Network.dart';
import '../../Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';
import '../../welcome/views/widgets/Custom_List_View.dart';
import '../schedule_cubit.dart';

class Skashen extends StatefulWidget {
  const Skashen({super.key});

  @override
  State<Skashen> createState() => _SkashenState();
}

class _SkashenState extends State<Skashen> {
  final currentTime = DateTime.now();
  bool? selected = true;
  bool? selected1 = false;
  bool? dataselected = false;

  @override
  void initState() {
    context.read<ScheduleCubit>().fetchSchedule(token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ScheduleCubit, ScheduleState>(
      builder: (context, schState) {
        if (schState is ScheduleLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 88.0),
            child: CustomLoadinfIndicator(),
          ));
        } else if (schState is ScheduleError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0),
              child: Text(
                schState.errorMessage,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        } else if (schState is ScheduleLoaded) {
          return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                            margin: EdgeInsets.fromLTRB(12.2, 25, 0, 0),
                            width: 52.8,
                            height: 41,
                            decoration: carouselCurrentIndex != index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(82, 63, 237, 1),
                                      width: 1.5,
                                    ))
                                : ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(1.00, -0.10),
                                      end: Alignment(-1, 0.1),
                                      colors: [
                                        Color(0xFF523FED),
                                        Color(0xFF7D3CFC)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                            child: Center(
                              child: Text(
                                days[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfexx",
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
                height: 10, child: Center(child: Days[carouselCurrentIndex])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Column(
                children: [
                  if (schState
                      .schedule.days![carouselCurrentIndex].data!.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 38.0),
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
                    ...schState.schedule.days![carouselCurrentIndex].data!
                        .asMap()
                        .entries
                        .map(
                      (entry) {
                        final int index = entry.key;
                        final Data e = entry.value;

                        final dataTime = e.time!.split(':');
                        final dataHour = int.parse(dataTime[0]);
                        final dataMinute = int.parse(dataTime[1]);

                        final isPassed = currentTime.hour > dataHour ||
                            (currentTime.hour == dataHour &&
                                currentTime.minute > dataMinute);

                        // Determine if it's the first or last element
                        final isFirst = index == 0;
                        final isLast = index ==
                            schState.schedule.days![carouselCurrentIndex].data!
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
    );
  }
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
  /*Text(
    "يوم الحمعه",
    style: TextStyle(color: Colors.white, fontSize: 30),
  ),*/
];

List<String> days = [
  "السبت",
  "الاحد",
  "الاثنين",
  "الثلاثاء",
  "الاربعاء",
  "الخميس",
 // "الجمعة"
];
