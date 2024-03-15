import 'package:flutter/material.dart';

class CustomTextt extends StatelessWidget {
  const CustomTextt(
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
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          alignment: Alignment.centerRight,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.88, -0.47),
              end: Alignment(-0.88, 0.47),
              colors: [Color(0xFF7D3CFC), Color(0xFF523FED)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
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
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            text4,
            style: const TextStyle(
                fontSize: 15, fontFamily: "wolfex", color: Colors.white),
          ),
        ));
  }
}
