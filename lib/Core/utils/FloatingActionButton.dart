// ignore_for_file: file_names, sort_child_properties_last, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/utils/support.dart';

class FloatingActionButtonn extends StatelessWidget {
  const FloatingActionButtonn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Image.asset(
        "assets/img/iconsupport.png",
        width: 20,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return BackdropFilter(
                child: SizedBox(height: 600, child: Support()),
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              );
            });
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      backgroundColor: const Color.fromRGBO(72, 74, 247, 1),
    );
  }
}
