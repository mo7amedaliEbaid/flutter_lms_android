import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Feature/mahad/data/Doctors_Model.dart';
import 'package:http/http.dart' as http;

part 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  DoctorsCubit() : super(DoctorsInitial());
  final String _baseUrl = 'https://server-hmit.onrender.com/application/';
  List<DoctorsModel> doctors = [];

  getDoctors() async {
    emit(GetDoctorsLouding());
    http.Response response = await http.get(Uri.parse('${_baseUrl}get-doctors'),
        headers: {'Authorization': token!});
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var doctor in data) {
        doctors.add(DoctorsModel.fromJson(doctor));
        emit(GetDoctorsSuccess());
      }
    } else if (response.statusCode == 401) {
      emit(const GetDoctorsFailure("you Should Log in "));
    } else {
      emit(const GetDoctorsFailure(
          "Opps, There Was an Error Please try Again later!"));
    }
  }
}
