import 'package:flutter/material.dart';

class TadressText extends StatelessWidget {
  const TadressText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 40, 13, 25),
          child: Text(
            "المنصة التعليمية للمعهد العالي للإدارة وتكنولوجيا المعلومات بكفر الشيخ",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "wolfexx",
              fontSize: 18,
            ),
          ),
        ),

        //  الوصف
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 13, 20),
          child: Text(
            "التطوّر المستمر للتكنولوجيا يعني التطوّر المستمر لتصميم مواقع الإنترنت الفارق بين مقدمي خدمات الويب المختلفة هو إنشاء موقع إحترافي عالي الجودة يميزك بين منافسيك في المجال نعمل داخل اكس ديزاين وفي أذهاننا تقديم أفضل تجربة إستخدام ممكنة لك عبر تمكينك من التحكم في موقعك عبر لوحة تحكم، وفي تقديم أفضل تجربة إستخدام لزوارك عبر توفير أسهل وأفضل أسلوب تصفح لصفحات الموقع المختلفة.",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              height: 1.5,
              fontFamily: 'wolfexx',
            ),
          ),
        ),
      ],
    );
  }
}
