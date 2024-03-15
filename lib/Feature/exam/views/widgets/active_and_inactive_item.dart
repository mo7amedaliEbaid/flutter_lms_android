import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 25, 0, 0),
      height: 42.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromRGBO(82, 63, 237, 1),
            width: 1.5.w,
          )),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontFamily: "wolfexx", fontSize: 12),
        ),
      ),
    );
  }
}

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 25, 5, 0),
      height: 42.h,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(1.00, -0.10),
          end: Alignment(-1, 0.1),
          colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontFamily: "wolfexx", fontSize: 12),
        ),
      ),
    );
  }
}
