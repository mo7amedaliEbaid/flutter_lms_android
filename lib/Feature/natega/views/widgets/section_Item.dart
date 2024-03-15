import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key, required this.section, required this.mark});

  final String section;
  final String mark;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Stack(alignment: Alignment.topLeft, children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: (width / 2) - 35,
          height: 121,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.10, 0.70),
              end: Alignment(-0.45, 0.0),
              colors: [Color(0xD8F869D5), Color(0xFF523FED)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                  child: Text(
                    section,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "wolfex",
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                  child: Text(
                    mark,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "wolfex",
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/img/frka.png',
              height: 85,
            ),
          ),
        )
      ]),
    );
  }
}
