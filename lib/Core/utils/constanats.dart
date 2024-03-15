// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomTextty extends StatelessWidget {
  const CustomTextty(
      {super.key, required this.imge, required this.text4, required this.link});

  final String imge;
  final String text4;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, link);
        },
        child: Container(
          width: 169,
          height: 60,
          margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
          alignment: Alignment.centerRight,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.88, -0.47),
              end: Alignment(-0.88, 0.47),
              colors: [Color(0xFF7D3CFC), Color(0xFF523FED)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xFF523FED),
                blurRadius: 3,
                offset: Offset(0, 0),
                spreadRadius: -1,
              )
            ],
            image: DecorationImage(
              scale: 0.5,
              alignment: Alignment.centerLeft,
              image: AssetImage(
                imge,
              ),
            ),
          ),
          padding: EdgeInsets.only(right: 5),
          child: Text(
            text4,
            style: TextStyle(
                fontSize: 15, fontFamily: "wolfex", color: Colors.white),
          ),
        ));
  }
}

class Continerone extends StatelessWidget {
  const Continerone(
      {super.key, required this.imge, required this.texty, required this.link});

  final String imge;
  final String texty;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, link);
          },
          child: Container(
            margin: EdgeInsets.only(top: 49, left: 18),
            width: 295,
            height: 189,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                end: Alignment(0.88, -0.47),
                begin: Alignment(-0.88, 0.47),
                colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xFF523FED),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: -1,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 123, right: 8),
                    child: Text(
                      texty,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'wolfex',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 5),
          child: Image.asset(
            imge,
            width: 163,
          ),
        ),
      ],
    );
  }
}

