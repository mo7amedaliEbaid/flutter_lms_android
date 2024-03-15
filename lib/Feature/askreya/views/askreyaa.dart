// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/Spaces.dart';
import 'package:flutter_lms/Core/utils/Custom_noification_page.dart';
import 'package:flutter_lms/Core/utils/FloatingActionButton.dart';
import 'package:flutter_lms/Core/utils/drawer.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/askreya/controller/cubit/askarya_cubit.dart';
import 'package:flutter_lms/Feature/askreya/views/askreya.dart';
import 'package:flutter_lms/Feature/askreya/views/widgets/helper_widgets.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(e) async {
  if (!await launchUrl(e)) {
    throw Exception('Could not launch $e');
  }
}

class Askreyaa extends StatelessWidget {
  const Askreyaa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AskaryaCubit()..getAskaeyaData(),
        ),
        BlocProvider(
          create: (context) => AuthCubit()..login(user!, password),
        ),
      ],
      child: BlocConsumer<AskaryaCubit, AskaryaState>(
        builder: (context, state) {
          return BlocConsumer<AuthCubit, AuthCubitState>(
              listener: (context, state) {
            if (state is LoginLoudingState) {}
          }, builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            final cubitaskaryadata = BlocProvider.of<AskaryaCubit>(context);

            CacheNetwork.getCachedata(key: 'token');

            return cubitaskaryadata.askreyaModel != null &&
                    cubitaskaryadata.askreyaModel?.num != null &&
                    cubitaskaryadata.askreyaModel?.endDate != null &&
                    cubitaskaryadata.askreyaModel?.startDate != null
                ? Scaffold(
                    drawer: Drawerr(),
                    floatingActionButton: FloatingActionButtonn(),
                    backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
                    body: SafeArea(
                      child: Column(
                        children: [
                          CustomAppBar(),
                          verticalSpace(20),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 25),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Welcome();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'العودة',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: "wolfexx"),
                                  ),
                                  Icon(
                                    Icons.chevron_right_sharp,
                                    size: 33.sp,
                                    color: Color.fromRGBO(68, 54, 189, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(17.5),
                          Text(
                            'رقم الدورة',
                            style: TextStyle(
                                fontFamily: "wolfex",
                                fontSize: 18,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w700),
                          ),
                          verticalSpace(7),
                          Column(
                            children: [
                              Text(
                                ' تبداء دورة التربية العسكرية الحالية من تاريخ //${cubitaskaryadata.askreyaModel == null ? '' : cubitaskaryadata.askreyaModel!.startDate}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: "wolfex",
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                              verticalSpace(10),
                              Text(
                                'الي ${cubitaskaryadata.askreyaModel == null ? '' : cubitaskaryadata.askreyaModel!.endDate}',
                                style: TextStyle(
                                  fontFamily: "wolfex",
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          Center(
                            child: SizedBox(
                              height: 50.h,
                              child: ListView.builder(
                                  itemCount:
                                      cubitaskaryadata.askreyaModel?.num == null
                                          ? 2
                                          : cubitaskaryadata
                                              .askreyaModel?.num.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: CustomContainer(
                                          number:
                                              "${cubitaskaryadata.askreyaModel?.num == null ? 0 : cubitaskaryadata.askreyaModel?.num[index]}"),
                                    );
                                  }),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/img/yyo.png',
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        verticalSpace(48),
                                        CustomText2(
                                          datee:
                                              'الاسم :  ${cubit.authModel == null ? '' : cubit.authModel!.f_Name} ${cubit.authModel == null ? '' : cubit.authModel!.l_Name}',
                                        ),
                                        verticalSpace(26),
                                        CustomText2(
                                          //where is the number ?
                                          datee: 'مسلسل : 25',
                                        ),
                                        verticalSpace(26),
                                        CustomText2(
                                          datee:
                                              'الشعبه : ${cubit.authModel == null ? '' : cubit.authModel!.section}',
                                        ),
                                        verticalSpace(26),
                                        CustomText2(
                                          datee:
                                              'الفرقه : ${cubit.authModel == null ? '' : cubit.authModel!.squad}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 60.h),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10.w),
                                        width: 364,
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
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              CustomText(
                                                  date:
                                                      'من يتخلف عن الحضور ليوم واحد يعد'),
                                              CustomText(
                                                  date:
                                                      'راسب في الدورة والحضور الساعة'),
                                              CustomText(
                                                  date:
                                                      ' السابعة والنصف صباحا'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30, left: 30),
                                    child: Image.asset(
                                      'assets/img/askreyaaa.png',
                                      width: 128,
                                      height: 171,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Askreya();
          });
        },
        listener: (context, state) {},
      ),
    );
  }
}
