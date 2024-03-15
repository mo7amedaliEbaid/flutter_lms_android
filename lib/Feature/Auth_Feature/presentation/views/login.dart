// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/Spaces.dart';
import 'package:flutter_lms/Core/notification/local_notification.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/widgets/Custom_Error_Dialog.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/views/widgets/Custom_Loading_indicator.dart';
import 'package:flutter_lms/Feature/welcome/views/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController numController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginState extends State<Login> {
  final fromkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    listenToNotificationStream();
  }

  listenToNotificationStream() {
    LocalNotificationService.streamController.stream.listen((event) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Welcome();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String user= CacheNetwork.getCachedata(key: "password");
    String password=CacheNetwork.getCachedata(key: "user");
    log(user.toString());
    log(user.toString());
    log(user.toString());
    log(user.toString());
    log(password.toString());
    log(password.toString());
    log(password.toString());
    log(password.toString());
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Welcome();
              },
            ),
          );
          LocalNotificationService.showbasicNotification(
              massBody: 'مرحبا بك مجددا ${state.authModel.f_Name}');
        } else if (state is LoginFailureState) {
          customErroDialog(state.errorMessage, context);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<AuthCubit>(context);

        return Scaffold(
          backgroundColor: const Color.fromRGBO(25, 23, 44, 1),
          body: Form(
            key: fromkey,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Image.asset(
                      "assets/img/nun.png",
                      height: 30.h,
                    ),
                    Container(
                      child: Center(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/icons8-waving-hand-emoji-96 1 (1).png",
                            height: MediaQuery.of(context).size.width * 0.06,
                          ),
                          verticalSpace(3),
                          Text(
                            "HIMIT اهلا بك في",
                            style: TextStyle(
                                color: Colors.white, fontFamily: "wolfex"),
                          ),
                        ],
                      )),
                      margin: EdgeInsets.only(top: 6),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "يمكنك تسجيل الدخول من خلال رقمك القومي\n المسجل لدينا",
                          style: TextStyle(
                              color: Colors.white70,
                              fontFamily: "wolfexx",
                              fontSize: 13.spMin),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.only(top: 5, bottom: 99),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الرقم القومي",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "wolfex"),
                        ),
                      ],
                    ),
                    verticalSpace(17),
                    TextFormField(
                      // textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                      controller: numController,
                      validator: (value) {
                        if (numController.text.isEmpty) {
                          return "الرجاء إدخال الرقم القومي";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 9),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff523FED))),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(89, 255, 255, 255),
                              fontFamily: "wolfex",
                              fontSize: 10),
                          suffixIcon: SizedBox(
                            height: 7.h,
                            width: 7.w,
                            child: Padding(
                              padding: const EdgeInsets.all(11),
                              child: Image.asset(
                                  'assets/img/verifave-egyptian-national-id-verification-removebg-preview.png'),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          hintTextDirection: TextDirection.rtl,
                          hintText: 'ادخل رقمك القومي '),
                    ),
                    verticalSpace(17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الرقم السري",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "wolfex"),
                        ),
                      ],
                    ),
                    verticalSpace(17),
                    TextFormField(
                      // textAlign: TextAlign.right,
                      obscureText: _isSecurePassword,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.white),
                      controller: passwordController,
                      validator: (value) {
                        if (passwordController.text.isEmpty) {
                          return "الرجاء إدخال الرقم السري";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(100, 255, 255, 255),
                            fontFamily: "wolfex",
                            fontSize: 10),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff523FED))),
                        focusColor: Color.fromARGB(255, 255, 255, 255),
                        hintText: 'ادخل رقمك السري ',
                        prefixIcon: togglePassword(),
                        suffixIcon: SizedBox(
                          height: 6.h,
                          width: 6.w,
                          child: Padding(
                            padding: EdgeInsets.all(11),
                            child: Image.asset(
                                'assets/img/icons8-password-300 1.png'),
                          ),
                        ),
                        hintTextDirection: TextDirection.rtl,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (fromkey.currentState!.validate()) {
                          if (state is LoginLoudingState) {
                            CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            );
                          } else {
                            cubit.login(numController.text.toString(),
                                passwordController.text.toString());
                          }
                          CacheNetwork.insertToCache(
                              key: 'user',
                              value: passwordController.text.toString());
                          CacheNetwork.insertToCache(
                              key: 'password',
                              value: numController.text.toString());
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromRGBO(82, 63, 237, 1),
                              const Color.fromRGBO(125, 60, 252, 1)
                            ],
                            begin: const FractionalOffset(0.7, 0.7),
                            end: const FractionalOffset(0.9, 2.0),
                            stops: [0.0, 0.9],
                          ),
                        ),
                        margin: EdgeInsets.only(top: 30),
                        child: state is LoginLoudingState
                            ? Center(
                                child: SizedBox(
                                    height: 30.h,
                                    width: 30.w,
                                    child: CustomLoadinfIndicator()))
                            : Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontFamily: "wolfex"),
                              ),
                        width: 395,
                        height: 60,
                      ),
                    ),
                    verticalSpace(70),
                    Center(
                      child: Text(
                        "جميع الحقوق محفوظه لدي Team 7A ©",
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "wolfexx",
                            fontSize: 11),
                      ),
                    ),
                    verticalSpace(15),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Color.fromARGB(38, 158, 158, 158),
    );
  }
}

bool _isSecurePassword = true;
