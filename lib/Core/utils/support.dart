// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(e) async {
  if (!await launchUrl(e)) {
    throw Exception('Could not launch $e');
  }
}

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 84, 81, 81),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: const Icon(
          Icons.keyboard_arrow_down,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 38,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        backgroundColor: const Color.fromRGBO(72, 74, 247, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromRGBO(86, 80, 222, 1),
                                const Color.fromRGBO(248, 105, 213, 1)
                              ],
                              begin: const FractionalOffset(0.4, 0.2),
                              end: const FractionalOffset(0.9, 0.5),
                              stops: [0.1, 2.0],
                            ),
                          ),
                          height: 176,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "                                           !مرحبا ",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "wolfex",
                                    color: Colors.white,
                                    // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                  ),
                                ),
                                Text(
                                  "اليك بعض الخطوات لمساعدتك علي    ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "wolfex",
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "           التواصل مع خدمة عملاء المعهد    ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "wolfex",
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 90, right: 172),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/icon/supportbig.png',
                              height: 178,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _launchUrl(
                            Uri.parse('https://www.facebook.com/Himit2018'));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromRGBO(82, 63, 237, 1),
                              const Color.fromRGBO(125, 60, 252, 1)
                            ],
                            begin: const FractionalOffset(0.4, 0.2),
                            end: const FractionalOffset(0.9, 0.5),
                            stops: [0.1, 2.0],
                          ),
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage(
                              'assets/img/facebook.png',
                            ),
                          ),
                        ),
                        height: 132,
                        child: Text(
                          " فيسبوك ",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "wolfex",
                            color: Colors.white,

                            // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _launchUrl(Uri.parse('tel:0473278920'));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromRGBO(82, 63, 237, 1),
                              const Color.fromRGBO(125, 60, 252, 1)
                            ],
                            begin: const FractionalOffset(0.4, 0.2),
                            end: const FractionalOffset(0.9, 0.5),
                            stops: [0.1, 2.0],
                          ),
                          image: DecorationImage(
                            alignment: Alignment.centerLeft,
                            image: AssetImage('assets/img/robot.png'),
                          ),
                        ),
                        height: 132,
                        child: Text(
                          "  رقم شؤن الطلاب ",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "wolfex",
                            color: Colors.white,
                            // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(82, 63, 237, 1),
                      const Color.fromRGBO(125, 60, 252, 1)
                    ],
                    begin: const FractionalOffset(0.4, 0.2),
                    end: const FractionalOffset(0.9, 0.5),
                    stops: [0.1, 2.0],
                  ),
                ),
                // padding: EdgeInsets.fromLTRB(0, 40, 10, 20),
                width: double.infinity,
                height: 245,

                child: Padding(
                  padding: const EdgeInsets.only(top: 27, right: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "أسئلة شائعة",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "wolfex",
                          color: Colors.white,
                          // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/hadaf');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/hadaf');
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_sharp,
                                      color: Color.fromRGBO(62, 184, 237, 1),
                                      size: 28,
                                    ),
                                  ),
                                  Text(
                                    "الهدف من التطبيق",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "wolfexx",
                                      color: Colors.white,

                                      // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/seyasa');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/seyasa');
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_sharp,
                                      color: Color.fromRGBO(62, 184, 237, 1),
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "سياسة الأستخدام",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "wolfexx",
                                      color: Colors.white,

                                      // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/tadres');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/tadres');
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_sharp,
                                      color: Color.fromRGBO(62, 184, 237, 1),
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 29,
                                  ),
                                  Text(
                                    "هيئة التدريس",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "wolfexx",
                                      color: Colors.white,

                                      // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/mahad');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/mahad');
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_left_sharp,
                                      color: Color.fromRGBO(62, 184, 237, 1),
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Text(
                                    "رؤية المعهد",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "wolfexx",
                                      color: Colors.white,

                                      // backgroundColor:const Color.fromRGBO(82, 63, 237, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
