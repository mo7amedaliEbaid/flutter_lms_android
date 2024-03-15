import 'package:flutter/material.dart';

class GlosText extends StatelessWidget {
  const GlosText({
    super.key,
    required this.texty,
  });

  final String texty;

  @override
  Widget build(BuildContext context) {
    return Text(
      texty,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'wolfexx',
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

//Number Glos

class ContinerText extends StatelessWidget {
  const ContinerText({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(14, 5, 0, 0),
      width: 39,
      height: 50,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50, color: Color(0xCC523FED)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
              color: Colors.white, fontFamily: "wolfex", fontSize: 24),
        ),
      ),
    );
  }
}

//CONTINER

class ContinerEnd extends StatelessWidget {
  const ContinerEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: [
      Container(
        margin: EdgeInsets.only(
          left: 25,
          right: 15,
        ),
        width: 400,
        height: 137,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            end: Alignment(0.95, -0.31),
            begin: Alignment(-0.95, 0.31),
            colors: [
              Color(0xED5650DE),
              Color(0xDAEA66D5),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 16),
              child: Text(
                "هذه البيانات لا تتضمن أماكن اللجان",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "wolfexx",
                  fontSize: 13,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/lagnaa');
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 31, right: 10),
                child: Container(
                  width: 124,
                  height: 38,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      end: Alignment(1.00, -0.08),
                      begin: Alignment(-1, 0.08),
                      colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF523FED),
                        blurRadius: 8,
                        offset: Offset(-4, 4),
                        spreadRadius: -5,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/lagnaa');
                    },
                    child: Center(
                      child: Text(
                        "عرض اللجنة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'wolfex',
                          height: 0.11,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0, left: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/img/lagn.png',
            height: 178,
          ),
        ),
      )
    ]);
  }
}
