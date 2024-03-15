import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 1. States for ExamCubit
abstract class ExamState {}

class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamLoaded extends ExamState {
  final Exam exam;

  ExamLoaded(this.exam);
}

class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}

// 2. Cubit for managing the state
class ExamCubit extends Cubit<ExamState> {
  ExamCubit() : super(ExamInitial());

  Future<void> fetchExams(String token) async {
    emit(ExamLoading());

    try {
      final response = await http.get(
        Uri.parse('https://server-hmit.onrender.com/application/exam-table'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Exam exam = Exam.fromJson(responseData);
        emit(ExamLoaded(exam));
      } else {
        emit(ExamError('Failed to fetch exam: ${response.statusCode}'));
      }
    } catch (e) {
      emit(ExamError('Failed to fetch exam: $e'));
    }
  }
}


/*
class Exam {
  String? id;
  String? type;
  String? classRoom;
  String? academicDivision;
  Map<String, Map<String, dynamic>>? days;

  Exam({
    required this.id,
    required this.type,
    required this.classRoom,
    required this.academicDivision,
    required this.days,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['_id'],
      type: json['type'],
      classRoom: json['classRoom'],
      academicDivision: json['academicDivision'],
      days: Map<String, Map<String, dynamic>>.from(json['days']),
    );
  }
}
*/
class Exam {
  String? id;
  String? type;
  String? classRoom;
  String? academicDivision;
  List<Map<String, dynamic>>? days; // Changed type to List<Map<String, dynamic>>

  Exam({
    required this.id,
    required this.type,
    required this.classRoom,
    required this.academicDivision,
    required this.days,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    // Extracting the days list
    List<Map<String, dynamic>>? daysList = (json['days'] as List<dynamic>)
        .cast<Map<String, dynamic>>(); // Casting each element to the correct type

    return Exam(
      id: json['_id'],
      type: json['type'],
      classRoom: json['classRoom'],
      academicDivision: json['academicDivision'],
      days: daysList,
    );
  }
}
