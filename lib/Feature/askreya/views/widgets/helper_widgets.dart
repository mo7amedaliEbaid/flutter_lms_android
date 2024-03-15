import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39.w,
      height: 46.h,
      decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(82, 63, 237, 1), width: 1.50),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            fontFamily: "wolfexx",
            fontSize: 23.sp,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 13.sp,
        fontFamily: "wolfexx",
      ),
    );
  }
}

class CustomTextt extends StatelessWidget {
  const CustomTextt({super.key, required this.datee});

  final String datee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        datee,
        style: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: 18.sp,
          fontFamily: "wolfexx",
        ),
      ),
    );
  }
}

class CustomText2 extends StatelessWidget {
  const CustomText2({super.key, required this.datee});

  final String datee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Text(
        datee,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 18,
          fontFamily: "wolfexx",
        ),
      ),
    );
  }
}
