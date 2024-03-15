import 'package:flutter/material.dart';

class CustomTextLagna extends StatelessWidget {
  const CustomTextLagna({super.key, required this.datee});

  final String datee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Text(
        datee,
        textAlign: TextAlign.right,
        style: const TextStyle(
            color: Colors.white, fontFamily: "wolfexx", fontSize: 18),
      ),
    );
  }
}

class Textyy extends StatelessWidget {
  const Textyy({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 7, 0, 0),
      width: 39,
      height: 46,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color.fromRGBO(82, 63, 237, 1),
            width: 1.5,
          )),
      child: Center(
        child: Text(
          date,
          style: TextStyle(
              color: Colors.white, fontFamily: "wolfex", fontSize: 24),
        ),
      ),
    );
  }
}
