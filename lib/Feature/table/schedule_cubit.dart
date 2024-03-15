/*
import 'package:http/http.dart' as http;
import 'dart:convert';
*/
/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Feature/table/schedule_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define states
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<Schedule> schedules;

  ScheduleLoaded(this.schedules);
}

class ScheduleError extends ScheduleState {
  final String errorMessage;

  ScheduleError(this.errorMessage);
}

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  Future<void> fetchSchedule(String token) async {
    emit(ScheduleLoading());
    try {
      final response = await http.get(
        Uri.https('server-hmit.onrender.com', '/application/schedule'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        final schedules = responseData.map((data) => Schedule.fromJson(data)).toList();
        emit(ScheduleLoaded(schedules));
      } else {
        throw Exception('Failed to load schedule');
      }
    } catch (e) {
      emit(ScheduleError('Failed to load schedule: $e'));
    }
  }
}
*/ /*

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Feature/table/schedule_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<Schedule> schedules;

  ScheduleLoaded(this.schedules);
}

class ScheduleError extends ScheduleState {
  final String errorMessage;

  ScheduleError(this.errorMessage);
}

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  Future<void> fetchSchedule(String token) async {
    emit(ScheduleLoading());
    try {
      final response = await http.get(
        Uri.https('server-hmit.onrender.com', '/application/schedule'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        final schedules = responseData.map((data) => Schedule.fromJson(data)).toList();
        emit(ScheduleLoaded(schedules));
      } else {
        throw Exception('Failed to load schedule');
      }
    } catch (e) {
      emit(ScheduleError('Failed to load schedule: $e'));
    }
  }
}

*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScheduleState {}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final Schedule schedule;

  ScheduleLoaded(this.schedule);
}

class ScheduleError extends ScheduleState {
  final String errorMessage;

  ScheduleError(this.errorMessage);
}

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());

  Future<void> fetchSchedule(String token) async {
    emit(ScheduleLoading());
    try {
      final response = await http.get(
        Uri.https('server-hmit.onrender.com', '/application/schedule'),
        headers: {'Authorization': token},
      );
      print("response $response");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        print("response data $responseData");
        final schedule = Schedule.fromJson(responseData);
        print(schedule.academicDivision);
        print(schedule.academicDivision);
        print(schedule.academicDivision);
        emit(ScheduleLoaded(schedule));
      } else {
        throw Exception('Failed to load schedule');
      }
    } catch (e) {
      emit(ScheduleError('Failed to load schedule: $e'));
    }
  }
}

class Schedule {
  String? sId;
  String? type;
  String? classRoom;
  String? academicDivision;
  List<Days>? days;
  int? iV;

  Schedule({
    this.sId,
    this.type,
    this.classRoom,
    this.academicDivision,
    this.days,
    this.iV,
  });

  Schedule.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    classRoom = json['classRoom'];
    academicDivision = json['academicDivision'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(Days.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['classRoom'] = classRoom;
    data['academicDivision'] = academicDivision;
    if (days != null) {
      data['days'] = days!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Days {
  String? name;
  List<Data>? data;

  Days({this.name, this.data});

  Days.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? subjName;
  String? docName;
  String? time;

  Data({this.subjName, this.docName, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    subjName = json['subjName'];
    docName = json['docName'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjName'] = subjName;
    data['docName'] = docName;
    data['time'] = time;
    return data;
  }
}
