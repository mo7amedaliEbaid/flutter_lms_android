// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';
import 'package:flutter_lms/Feature/natega/controller/trakomy.dart';
import 'package:flutter_lms/Feature/natega/views/widgets/section_Item.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';

import '../../../Core/Network/local_Network.dart';

class NategaaTrakomy extends StatefulWidget {
  const NategaaTrakomy({super.key});

  @override
  State<NategaaTrakomy> createState() => _NategaaTrakomyState();
}

class _NategaaTrakomyState extends State<NategaaTrakomy> {
  @override
  void initState() {
    context.read<CumulativeCubit>().fetchCumulative(token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CumulativeCubit, CumulativeState>(
      builder: (context, state) {
        print(state.toString());
        if (state is CumulativeError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else if (state is CumulativeLoaded) {
          return Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SectionItem(
                            section: 'الفرقه التانيه',
                            mark: "${state.cumulative.one}"),
                        SectionItem(
                            section: "الفرقه الاولي",
                            mark: "${state.cumulative.two}")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SectionItem(
                            section: "القرقه التالته",
                            mark: "${state.cumulative.three}"),
                        SectionItem(
                            section: "الفرقه الرابعه ",
                            mark: "${state.cumulative.four}")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "مجموع التراكمي : ${state.cumulative.cumulative}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "wolfexx",
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 16,
                    width: 370,
                  ),
                  Text(
                    " %النسبة  : ${state.cumulative.ratio}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "wolfexx",
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "تقدير عام : ${state.cumulative.overallEstimate}",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "wolfexx",
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    state.cumulative.military == null ||
                            state.cumulative.military == ''
                        ? "تربية عسكرية : لم يجتاز"
                        : "تربية عسكرية : اجتاز",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "wolfexx",
                        fontSize: 15),
                  ),
                  /* SizedBox(
              height: 98,
            ),*/
                ],
              ),
            ],
          );
        }
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: 18),
            child: CustomLoadinfIndicator(),
          ),
        );
      },
    ); /*BlocConsumer<AuthCubit, AuthCubitState>(
        builder: (_, state) {
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
                          "نتيجة امتحانات الترمين",
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
                                margin: EdgeInsets.fromLTRB(0, 25, 10, 0),
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
                                    "التراكمي",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/natega-tkalf');
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
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
                                    "مواد التخلف",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/nategaa');
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(7, 25, 0, 0),
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
                            "الاسم: ${cubit.authModel!.f_Name} ${cubit.authModel!.l_Name}  ",
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
                        children: [
                          SectionItem(section: 'الفرقه التانيه', mark: "516"),
                          SectionItem(section: "الفرقه الاولي", mark: "513")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SectionItem(section: "القرقه التالته", mark: "961"),
                          SectionItem(section: "الفرقه الرابعه ", mark: "566")
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "مجموع التراكمي : 2340",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "wolfexx",
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 16,
                      width: 370,
                    ),
                    Text(
                      "النسبة  : 65.07",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "wolfexx",
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "تقدير عام : جيد",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "wolfexx",
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "تربية عسكرية : اجتاز",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "wolfexx",
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 98,
                    ),
                  ],
                ),
              ],
            )),
          );
        },
        listener: (_, state) {});*/
  }
}
