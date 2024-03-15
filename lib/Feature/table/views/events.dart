// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Feature/table/controller/cubit/time_table_cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../schedule_cubit.dart';
import '../schedule_model.dart';

class TimeLineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Data scheduleData;

  const TimeLineWidget(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.scheduleData});

  @override
  Widget build(BuildContext context) {
    print("scheduleData.subjName.toString()");
    print(scheduleData.subjName.toString());
    print(scheduleData.subjName.toString());
    print(scheduleData.subjName.toString());
    print(scheduleData.subjName.toString());
    return BlocConsumer<TimeTableCubit, TimeTableState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TimeTableCubit>(context);
        return SizedBox(
          height: 130,
          child: TimelineTile(
            startChild: Text(
              scheduleData.time.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: "wolfex",
              ),
            ),
            alignment: TimelineAlign.manual,
            lineXY: 0.15,
            isFirst: isFirst,
            isLast: isLast,
            beforeLineStyle: LineStyle(
                color: isPast
                    ? const Color.fromRGBO(82, 63, 237, 1)
                    : Colors.deepPurple.shade100),
            indicatorStyle: IndicatorStyle(
                color: isPast
                    ? const Color.fromRGBO(82, 63, 237, 1)
                    : Colors.deepPurple.shade100,
                iconStyle: IconStyle(
                    iconData: Icons.done,
                    color: isPast ? Colors.white : Colors.deepPurple.shade100)),
            endChild: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      end: Alignment(0.98, -0.21),
                      begin: Alignment(-0.98, 0.21),
                      colors: [Color(0xFF523FED), Color(0xE57D3CFC)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                    //    "نظم معلومات محاسبية",
                        scheduleData.subjName.toString(),
                        // "${cubit.timetable[0].name}",
                        // "${cubit.timetable[1].name}",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontFamily: "wolfex",
                        ),
                      ),
                      Text(
                        //"(د / محمد الغندور)",
                        scheduleData.docName.toString(),
                        // "${cubit.timetable[0].doctor}",
                        // "${cubit.timetable[1].doctor}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "wolfexx",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
