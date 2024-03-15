// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';
import 'package:flutter_lms/Feature/askreya/views/widgets/helper_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/widgetslagna.dart';

Future<void> _launchUrl(e) async {
  if (!await launchUrl(e)) {
    throw Exception('Could not launch $e');
  }
}

class Lagnaa extends StatelessWidget {
  const Lagnaa({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<AuthCubit>(context);
        cubit.login(user!, password);
        return Scaffold(
            drawer: Drawerr(),
            floatingActionButton: FloatingActionButtonn(),
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: cubit.authModel != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, bottom: 25),
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
                                          size: 33,
                                          color: Color.fromRGBO(68, 54, 189, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17.5,
                        ),
                        Column(
                          children: [
                            Text(
                              "رقم اللجنة",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfex",
                                fontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "جميع بيانات الطالب معتمده",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(68, 255, 255, 255),
                                  fontFamily: "wolfexx",
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    itemCount: cubit
                                        .authModel!.committeeNumber?.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: CustomContainer(
                                              number:
                                                  '${cubit.authModel!.committeeNumber?[index]}'));
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 48,
                            ),
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/img/yyo.png',
                                  width: 320,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(),
                                      CustomTextLagna(
                                        datee: "الدور :  الارضي",
                                      ),
                                      CustomTextLagna(
                                        datee: "مكان اللجنة  :  مدرج 1",
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            child: ListView.builder(
                                                itemCount: cubit.authModel!
                                                    .seatingNumbers?.length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                    "${cubit.authModel!.seatingNumbers?[index]}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "wolfexx",
                                                        fontSize: 18),
                                                  );
                                                }),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                              height: 60,
                                              child: CustomTextt(
                                                datee: "  :  رقم الجلوس",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomTextt(
                                        datee:
                                            "الشعبة  : ${cubit.authModel!.section}",
                                      ),
                                      CustomTextt(
                                        datee:
                                            "الفرقة  : ${cubit.authModel!.squad}",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Center(
                    child:
                        CustomLoadinfIndicator(), //use custom louding indicator
                  ));
      },
    );
  }
}
