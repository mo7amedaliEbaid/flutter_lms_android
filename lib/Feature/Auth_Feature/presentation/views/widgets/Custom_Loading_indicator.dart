import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadinfIndicator extends StatelessWidget {
  const CustomLoadinfIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: const LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color(0xff7D3CFC),
          ],
          strokeWidth: 2,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.black),
    );
  }
}
