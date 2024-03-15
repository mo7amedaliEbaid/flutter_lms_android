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
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

import '../controller/trakomy.dart';
import 'natega-tkalf.dart';
import 'natega-trakomy.dart';

class Nategaa extends StatefulWidget {
  const Nategaa({super.key});

  @override
  State<Nategaa> createState() => _NategaaState();
}

class _NategaaState extends State<Nategaa> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<AuthCubit>().login(user!, password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        if (state is LoginLoudingState) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: Center(child: CustomLoadinfIndicator()),
          );
        } else if (state is LoginFailureState) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        } else if (state is LoginSuccessState) {
          return Scaffold(
            drawer: Drawerr(),
            floatingActionButton: FloatingActionButtonn(),
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    CustomAppBar(),
                    const SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    Container(
                      child: Column(children: [
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
                            "نتيجة امتحان الترم الاول",
                            style: TextStyle(
                              color: const Color.fromARGB(68, 255, 255, 255),
                              fontFamily: "wolfexx",
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: GestureDetector(
                                  onTap: () {
                                    print("Tapped");
                                    print("Tapped");
                                    print("Tapped");
                                    context.read<CumulativeCubit>().fetchCumulative(token!);
                                    setState(() {
                                      currentIndex = 2;
                                    });
                                    context.read<CumulativeCubit>().fetchCumulative(token!);
                                  },
                                  child: CustomNategaItem(
                                    text: "تراكمي",
                                    isSelected: currentIndex == 2 ? true : null,
                                  )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                },
                                child: CustomNategaItem(
                                  text: "تخلفات",
                                  isSelected: currentIndex == 1 ? true : null,
                                )),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                                child: CustomNategaItem(
                                  text: "النتيجة",
                                  isSelected: currentIndex == 0 ? true : null,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "الاسم : ${state.authModel.f_Name} ${state.authModel.l_Name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "wolfexx",
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              //"الحالة  : ${cubit.authModel!.studyCase}",
                              "الحالة : مستجد  ",

                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "wolfexx",
                                  fontSize: 13),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: ListView.builder(
                                      itemCount: state.authModel.seatingNumbers
                                              ?.length ??
                                          1,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          '${state.authModel.seatingNumbers?[index] ?? 0}',
                                          style: TextStyle(color: Colors.white),
                                        );
                                      }),
                                ),
                                Text(
                                  " : رقم الجلوس ",
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
                        currentIndex == 0
                            ? Column(
                                children: [

                                  ...state.authModel.markers!.map(
                                    (e) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 36.77,
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.40,
                                                  color: Color(0xFF523FED)),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(0),
                                                bottomLeft: Radius.circular(7),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(7),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${e['value']}",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      219, 255, 255, 255),
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
                                                  width: 1.40,
                                                  color: Color(0xFF523FED)),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(7),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(7),
                                                topLeft: Radius.circular(0),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${e['name']}",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      219, 255, 255, 255),
                                                  fontFamily: "wolfexx",
                                                  fontSize: 12),
                                            ),
                                          ),
                                          margin: EdgeInsets.only(top: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        width: 370,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            " جيد",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: "wolfexx",
                                                fontSize: 15),
                                          ),
                                          Text(
                                            " : التقدير ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "wolfexx",
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "الدرجة:600 ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "النسبة  : % 65.07",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "wolfexx",
                                            fontSize: 15),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : currentIndex == 1
                                ? NategaaTkalf(backwards: state.authModel.backwards?.length==0?null:state.authModel.backwards,)
                                : NategaaTrakomy(),
                        SizedBox(
                          height: 100,
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class CustomNategaItem extends StatelessWidget {
  CustomNategaItem({super.key, required this.text, this.isSelected});

  final String text;
  bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 10, 0),
      width: 89,
      height: 28,
      decoration: BoxDecoration(
          gradient: isSelected == null
              ? null
              : LinearGradient(colors: [Color(0xff523FED), Color(0xff7D3CFC)]),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: const Color.fromRGBO(82, 63, 237, 1),
            width: 1.5,
          )),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontFamily: "wolfexx", fontSize: 12),
        ),
      ),
    );
  }
}
