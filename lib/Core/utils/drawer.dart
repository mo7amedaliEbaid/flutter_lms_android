// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/Spaces.dart';
import 'package:flutter_lms/Core/widgets.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/login.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchToWebsite(e) async {
  if (!await launchUrl(e)) {
    throw Exception('Could not launch $e');
  }
}

class Drawerr extends StatefulWidget {
  const Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  bool circlur = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthCubitState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          // return
          return Drawer(
            backgroundColor: const Color.fromRGBO(82, 63, 237, 1),
            width: 230.w,
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(child: Drawerheader()),
              SliverToBoxAdapter(child: verticalSpace(30)),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      cubit.authModel != null
                          ? Text(
                              "أهلا بك :  ${cubit.authModel?.f_Name}", //the model is back null
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "wolfexx",
                                fontSize: 16.sp,
                              ),
                            )
                          : CustomLoadinfIndicator(),
                      DrawerItems(),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                lunchToWebsite(Uri.parse(
                                    'https://www.facebook.com/Himit2018'));
                              },
                              child: Image.asset(
                                "assets/img/iconfacebook.png",
                                height: 30.h,
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                lunchToWebsite(Uri.parse(
                                    'https://www.youtube.com/channel/UCNvfr2Fx-C0YgZ1KNh69g9w'));
                              },
                              child: Image.asset(
                                "assets/img/iconyoutube.png",
                                height: 30.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text('Team 7A',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 0, bottom: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  await CacheNetwork.deleteCacheItem();

                                  Future.delayed(Duration(seconds: 0), () {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }), (route) => false);
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Expanded(
                                      child: Image.asset(
                                        "assets/icon/LogoutIcon.png",
                                        height: 26.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
          // : Center(child: CircularProgressIndicator());
        },
        listener: (context, state) {});
  }
}
