import 'package:flutter/material.dart';

customErroDialog(String errorMassg, context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(
            backgroundColor: Color(0xFF523FED),
            content: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Text(
                errorMassg,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "wolfexx",
                    color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      });
}
