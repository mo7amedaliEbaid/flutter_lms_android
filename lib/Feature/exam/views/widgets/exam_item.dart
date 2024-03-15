import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Feature/exam/views/widgets/active_and_inactive_item.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.isactive, required this.tilte});
  final bool isactive;
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 100),
      crossFadeState:
          isactive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: InActiveItem(
        title: tilte,
      ),
      secondChild: ActiveItem(
        title: tilte,
      ),
    );
  }
}
