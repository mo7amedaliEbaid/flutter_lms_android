import 'package:flutter/material.dart';

class DocCardItem extends StatelessWidget {
  final String docName;
  String? docImage;
  DocCardItem({super.key, required this.docName, this.docImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Container(
        width: 98,
        height: 184,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF474BF5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 29,
              top: 22,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 49, bottom: 2),
                    child: Text(
                      '/ا.م',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'wolfex',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    docName,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'wolfex',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: -5,
              top: 50,
              child: Container(
                width: 113,
                height: 113,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage("https://f.top4top.io/p_2895d73ac1.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(11),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 55,
              ),
              child: Center(
                child: Image.network(
                  docImage!,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
