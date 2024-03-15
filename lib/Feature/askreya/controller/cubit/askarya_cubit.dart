import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Feature/Auth_Feature/data/Models/auth_Model.dart';
import 'package:flutter_lms/Feature/askreya/data/askreya_Model.dart';
import 'package:http/http.dart' as http;

part 'askarya_state.dart';

class AskaryaCubit extends Cubit<AskaryaState> {
  AskaryaCubit() : super(AskaryaInitial());
  AskreyaModel? askreyaModel;
  AuthModel? authModel;
  getAskaeyaData() async {
    emit(AskaryaLouding());
    token = CacheNetwork.getCachedata(key: 'token');

    try {
      http.Response response = await http.get(
          Uri.parse('https://server-hmit.onrender.com/application/mility-edu'),
          headers: {'Authorization': token!});
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        askreyaModel = AskreyaModel.fromJson(data);
        emit(AskaryaSuccess());
      } else {
        emit(
          AskaryaFailure(
              errorMassage: "there Was An error please Try Again Later!"),
        );
      }

      emit(AskaryaSuccess());
    } on Exception catch (e) {
      emit(AskaryaFailure(errorMassage: e.toString()));
    }
  }
}
