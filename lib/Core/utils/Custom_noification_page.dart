import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/utils/Logo.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/mahad/controller/cubit/doctors_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    showdilog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/img/no-close.png",
                            height: 31,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              width: 393,
                              height: 632,
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  end: Alignment(0.95, -0.31),
                                  begin: Alignment(-0.95, 0.31),
                                  colors: [
                                    Color(0xED5650DE),
                                    Color(0xD8F869D5)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/img/notification.png',
                                      width: 196,
                                    ),
                                    const Text(
                                      "لا توجد اشعارات ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "wolfexx",
                                        fontSize: 17,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubitdoctor = BlocProvider.of<DoctorsCubit>(context);
        return BlocConsumer<AuthCubit, AuthCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            return AppBar(
              leading: Builder(builder: (BuildContext context) {
                final cubit = BlocProvider.of<AuthCubit>(context);

                return GestureDetector(
                  onTap: () {
                    user = CacheNetwork.getCachedata(key: "user");
                    log(user.toString());
                    log(user.toString());
                    log(user.toString());
                    log(user.toString());
                    password = CacheNetwork.getCachedata(key: "password");
                    cubit.login(user!, password);
                    cubitdoctor.getDoctors();

                    Scaffold.of(context).openDrawer();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/berg.png',
                        width: 26,
                      ),
                    ],
                  ),
                );
              }),
              title: Image.asset(
                constant().logo,
                height: 40,
              ),
              centerTitle: true,
              actions: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        showdilog();
                      },
                      child: Image.asset(
                        "assets/img/no-open.png",
                        height: 31,
                      ),
                    ),
                  ),
                ),
              ],
              backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
              iconTheme: const IconThemeData(
                color: Color.fromRGBO(82, 63, 237, 1),
              ),
            );
          },
        );
      },
    );
  }
}
