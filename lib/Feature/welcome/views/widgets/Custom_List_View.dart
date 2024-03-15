import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

var carouselCurrentIndex = 0;

class CustomItemSlider extends StatefulWidget {
  const CustomItemSlider({super.key});

  @override
  State<CustomItemSlider> createState() => _CustomItemSliderState();
}

CarouselController controller = CarouselController();

class _CustomItemSliderState extends State<CustomItemSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Align(
            child: CarouselSlider(
              carouselController: controller,

              options: CarouselOptions(

                initialPage: 0,
                onPageChanged: (index, _) {
                  setState(() {
                    carouselCurrentIndex = index;
                  });
                  print(carouselCurrentIndex);
                },
                padEnds: true,
                autoPlayCurve: Curves.easeIn,
                enableInfiniteScroll: false,
                autoPlay: false,
                enlargeCenterPage: true, //slide

                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                viewportFraction: 0.8,
                height: 240,
              ),
              items: const [
                Continerone(
                    imge: "assets/img/Tab1.png",
                    texty: "الجداول الدراسية",
                    link: "/table-mohadrat"),
                Continertow(
                    imge: "assets/img/stare.png",
                    texty: "التربية العسكرية",
                    link: "/askreyaa"),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // controller.jumpToPage(0);
                controller.animateToPage(0);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: carouselCurrentIndex == 0
                      ? const Color(0xff523FED)
                      : Colors.transparent,
                ))),
                child: const Text(
                  "الجداول الدراسية",
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                controller.animateToPage(1);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: carouselCurrentIndex != 0
                      ? const Color(0xff523FED)
                      : Colors.transparent,
                ))),
                child: const Text("التربية العسكرية",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            )
          ],
        )
      ],
    );
  }
}

class Continerone extends StatelessWidget {
  const Continerone(
      {super.key, required this.imge, required this.texty, required this.link});

  final String imge;
  final String texty;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, link);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Container(
              margin: const EdgeInsets.only(
                top: 43,
              ),
              width: 3330,
              height: 189,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  end: Alignment(0.88, -0.47),
                  begin: Alignment(-0.88, 0.47),
                  colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0xFF523FED),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: -1,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 123, right: 8),
                      child: Text(
                        texty,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'wolfex',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 149,
          child: Image.asset(
            imge,
            width: 163,
          ),
        ),
      ],
    );
  }
}

class Continertow extends StatelessWidget {
  const Continertow(
      {super.key, required this.imge, required this.texty, required this.link});

  final String imge;
  final String texty;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, link);
      },
      child: Container(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(top: 50, left: 18),
        width: 295,
        height: 180,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            end: Alignment(0.88, -0.47),
            begin: Alignment(-0.88, 0.47),
            colors: [Color(0xFF523FED), Color(0xFF7D3CFC)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          shadows: [
            BoxShadow(
              color: Color(0xFF523FED),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: -1,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(imge)),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, right: 8),
                child: Text(
                  texty,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: 'wolfex',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
