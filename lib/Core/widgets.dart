import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/Spaces.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/mahad/controller/cubit/doctors_cubit.dart';
import 'package:flutter_lms/Feature/table/controller/cubit/time_table_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Drawerheader extends StatelessWidget {
  const Drawerheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        verticalSpace(110),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            constant().logo,
            height: 49.h,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  "المعهد العالي  للإدارة",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "wolfexx",
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "وتكنولوجيا المعلومات",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "wolfexx",
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 85),
                child: Text(
                  "بكفر الشيخ",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "wolfexx",
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Texty extends StatelessWidget {
  const Texty({super.key, required this.texty, required this.link});

  final String texty;
  final String link;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimeTableCubit, TimeTableState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubitX = BlocProvider.of<TimeTableCubit>(context);
        return BlocConsumer<AuthCubit, AuthCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            return GestureDetector(
              onTap: () {
                user = CacheNetwork.getCachedata(key: "user");
                password = CacheNetwork.getCachedata(key: "password");
                cubit.login(user!, password);
                cubitX.getTimeTable();
                Navigator.pushReplacementNamed(
                  context,
                  link,
                );
              },
              child: Text(
                texty,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "wolfexx",
                  fontSize: 16,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        verticalSpace(10),
        const Texty(texty: "الجداول الدراسية", link: '/table-mohadrat'),
        verticalSpace(15),
        const Texty(texty: "التربية العسكرية", link: '/askreyaa'),
        verticalSpace(15),
        GestureDetector(
          onTap: () {
            lunchToWebsite(Uri.parse('https://himit-kfs.com'));
          },
          child: const Text(
            "موقع المعهد",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "wolfexx",
              fontSize: 16,
            ),
          ),
        ),
        verticalSpace(15),
        const Texty(texty: "معرفة رقم الجلوس", link: '/gloss'),
        verticalSpace(15),
        const Texty(texty: "معرفة مكان اللجنة", link: '/lagnaa'),
        verticalSpace(15),
        const Texty(texty: "معرفة نتيجة الامتحانات", link: '/nategaa'),
        verticalSpace(15),
        const Texty(texty: "ما يمنحة المعهد", link: '/mn-mahad'),
        verticalSpace(15),
        BlocProvider(
          create: (context) => DoctorsCubit()..getDoctors(),
          child: const Texty(texty: "أعضاء هيئة التدريس", link: '/tadres'),
        ),
        verticalSpace(15),
        const Texty(texty: "كلمة عميد المعهد", link: '/amed'),
        verticalSpace(15),
        const Texty(texty: "إعداد واشراف", link: '/moshref'),
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/img/logohm.png',
              width: 10.w,
              opacity: const AlwaysStoppedAnimation(.5),
            ),
          ),
        ),
      ],
    );
  }
}
