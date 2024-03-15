import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLodingIndicator extends StatelessWidget {
  const CustomLodingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
        indicatorType: Indicator.ballTrianglePathColoredFilled,

        /// Required, The loading type of the widget
        colors: [
          Color(0xff523FED),
          Color(0xff7D3CFC),
        ],

        /// Optional, The color collections
        strokeWidth: 2,

        /// Optional, The stroke of the line, only applicable to widget which contains line
        backgroundColor: Colors.black,

        /// Optional, Background of the widget
        pathBackgroundColor: Colors.black

        /// Optional, the stroke backgroundColor
        );
  }
}
