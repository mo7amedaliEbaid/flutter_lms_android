// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/mahad/controller/cubit/doctors_cubit.dart';
import 'package:flutter_lms/Feature/mahad/views/widgets/doc_item.dart';
import 'package:flutter_lms/Feature/mahad/views/widgets/tadres_text.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

class Tadres extends StatefulWidget {
  const Tadres({super.key});

  @override
  State<Tadres> createState() => _TadresState();
}

class _TadresState extends State<Tadres> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit()..getDoctors(),
      child: BlocConsumer<DoctorsCubit, DoctorsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<DoctorsCubit>(context);
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
                    onTap: () {},
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

                  // أعضاء هيئة التدريس
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 17, bottom: 26),
                        child: Text(
                          "أعضاء هيئة التدريس",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "wolfex",
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 184,
                    child: ListView.builder(
                        itemCount: cubit.doctors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DocCardItem(
                            docName: cubit.doctors[index].fristName,
                            docImage:
                                cubit.doctors[index].image,
                          );
                        }),
                  ),
                  //المنصة
                  TadressText()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
