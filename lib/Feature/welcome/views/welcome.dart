// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/welcome/views/widgets/Custom_List_View.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/custom_category_item.dart';

Future<void> _launchUrl(e) async {
  if (!await launchUrl(e)) {
    throw Exception('Could not launch $e');
  }
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    print("Welcome Screen");
    token = CacheNetwork.getCachedata(key: 'token');
    print("token=$token");
    print(token.toString());
    print(token.toString());
    print(token.toString());
    user = CacheNetwork.getCachedata(key: "user");
    print(user.toString());
    print(user.toString());
    print(user.toString());
    print(user.toString());
    password = CacheNetwork.getCachedata(key: "password");
    print("password $password");
    print(password.toString());
    print(password.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        token = CacheNetwork.getCachedata(key: 'token');
        log("token=$token");
        log(token.toString());
        log(token.toString());
        log(token.toString());
        user = CacheNetwork.getCachedata(key: "user");
        log(user.toString());
        log(user.toString());
        log(user.toString());
        log(user.toString());
        password = CacheNetwork.getCachedata(key: "password");
        log("password $password");
        log(password.toString());
        log(password.toString());
        // cubit.login(user!, password);
        return Scaffold(
            drawer: Drawerr(),
            floatingActionButton: FloatingActionButtonn(),
            backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
            body: ListView(children: [
              CustomAppBar(),
              CustomItemSlider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 23, top: 28, bottom: 10),
                    child: Text(
                      "الاقسام",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 19,
                          fontFamily: "wolfex",
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextt(
                          imge: "assets/icon/gloss.png",
                          text4: "رقم الجلوس",
                          link: '/gloss',
                        ),
                      ),
                      Expanded(
                        child: CustomTextt(
                          imge: "assets/icon/natega.png",
                          text4: "نتيجة الأمتحان",
                          link: '/nategaa',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextt(
                          imge: "assets/img/emthanat.png",
                          text4: "جدول الامتحانات",
                          link: '/exam-medterm',
                        ),
                      ),
                      Expanded(
                        child: CustomTextt(
                          imge: "assets/icon/lagna.png",
                          text4: "اللجنة",
                          link: '/lagnaa',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 33, right: 25),
                    child: Text(
                      "المنصة التعليمية",
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: "wolfex",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Stack(alignment: Alignment.topLeft, children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromRGBO(86, 80, 222, 1),
                          Color.fromRGBO(248, 105, 213, 1)
                        ],
                        begin: const FractionalOffset(0.4, 0.2),
                        end: const FractionalOffset(0.9, 0.5),
                        stops: [0.1, 2.0],
                      ),
                    ),
                    width: 800,
                    height: 137,
                    margin: EdgeInsets.fromLTRB(30, 30, 20, 100),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "يمكنك من هنا الذهاب الي الموقع",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "wolfexx",
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "الخاص بالمعهد",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "wolfexx",
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 15, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                _launchUrl(Uri.parse('https://himit-kfs.com'));
                              },
                              child: Container(
                                width: 124,
                                height: 38,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-1, 0.08),
                                    end: Alignment(1.00, -0.08),
                                    colors: [
                                      Color(0xFF523FED),
                                      Color(0xFF7D3CFC)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 10, 0),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _launchUrl(Uri.parse(
                                              'https://himit-kfs.com'));
                                        },
                                        child: Text(
                                          "عرض الموقع",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "wolfexx",
                                            color: Colors.white,

                                            // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 45),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/img/website.png',
                        height: 178,
                      ),
                    ),
                  )
                ]),
              ),
            ]));
      },
    );
  }
}
