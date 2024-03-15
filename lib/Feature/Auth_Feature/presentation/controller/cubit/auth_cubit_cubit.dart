// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names, prefer_final_fields, avoid_print
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Feature/Auth_Feature/data/Models/auth_Model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());
  String _BaseUrl = 'https://server-hmit.onrender.com/application/login';
  AuthModel? authModel;

  login(String num, password) async {
    emit(LoginLoudingState());
    //Post req to the server
    try {
      http.Response response = await http.post(
        Uri.parse(_BaseUrl),
        body: {
          'num': password,
          'password': num,
        },
      );
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        authModel = AuthModel.fromJson(data);
        CacheNetwork.insertToCache(key: 'token', value: authModel!.token);
        emit(LoginSuccessState(authModel!));
      } else {
        emit(LoginFailureState(data['msg']));
      }
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
