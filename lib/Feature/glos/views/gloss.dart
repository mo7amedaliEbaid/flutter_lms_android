// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/notification/local_notification.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/glos/views/glos.dart';
import 'package:flutter_lms/Feature/glos/views/widgets/gloswidgets.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Gloss extends StatefulWidget {
  const Gloss({super.key});

  @override
  State<Gloss> createState() => _GlossState();
}

class _GlossState extends State<Gloss> {
  @override
  void initState() {
    LocalNotificationService.showbasicNotification(
        massBody: 'رقم الجلوس معلن الان!');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          cubit.login(user!, password);
          return Scaffold(
              drawer: Drawerr(),
              floatingActionButton: FloatingActionButtonn(),
              backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
              body: cubit.authModel?.seatingNumbers != null
                  ? Container(
                      child: Center(
                        child: ListView(
                          children: [
                            CustomAppBar(),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "رقم الجلوس",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "wolfex",
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "جميع بيانات الطالب معتمدة",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(68, 255, 255, 255),
                                    fontFamily: "wolfexx",
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                            Center(
                              child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    itemCount:
                                        cubit.authModel!.seatingNumbers?.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ContinerText(
                                          number:
                                              "${cubit.authModel!.seatingNumbers?[index]}");
                                    }),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     ContinerText(
                            //         number: "${cubit.authModel!.seatingNumbers[0]}"),
                            //     ContinerText(
                            //         number: "${cubit.authModel!.seatingNumbers[1]}"),
                            //     ContinerText(
                            //         number: "${cubit.authModel!.seatingNumbers[2]}"),
                            //     ContinerText(
                            //         number: "${cubit.authModel!.seatingNumbers[3]}"),
                            //   ],
                            // ),
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 19),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GlosText(texty: "المجموعة : 2"),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  GlosText(
                                      texty:
                                          "الشعبة: ${cubit.authModel!.section}"),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  GlosText(
                                      texty:
                                          "الحالة الدراسية : ${cubit.authModel!.studyCase}"),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  GlosText(
                                      texty:
                                          "الفرقة : ${cubit.authModel!.squad}"),
                                  SizedBox(
                                    height: 27,
                                  ),
                                  GlosText(
                                      texty:
                                          "التخصص :  ${cubit.authModel!.specialization}"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 102,
                            ),
                            ContinerEnd(),
                            SizedBox(
                              height: 23,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Glos());
        },
        listener: (context, state) {});
  }
}
