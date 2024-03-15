import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Feature/Auth_Feature/data/Models/auth_Model.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/table/data/model/table_model.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'time_table_state.dart';

class TimeTableCubit extends Cubit<TimeTableState> {
  TimeTableCubit() : super(TimeTableInitial());
  List<TableModel> timeTable = [];
  List<Tabledata> data = [];
  AuthModel? authModel;

  getTimeTable() async {
    emit(TimeTablelouding());

    try {
      http.Response response = await http.get(
          Uri.parse('https://server-hmit.onrender.com/application/schedule'),
          headers: {'Authorization': token!});
      var data = jsonDecode(response.body); //data is list

      for (var element in data['days']) {
        timeTable.add(TableModel.fromJson(element));
        print("time Table is ${timeTable.length}");
        emit(TimeTablesuceess());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
