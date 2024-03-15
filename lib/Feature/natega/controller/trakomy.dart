import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CumulativeState {}

class CumulativeInitial extends CumulativeState {}

class CumulativeLoaded extends CumulativeState {
  final Cumulative cumulative;

  CumulativeLoaded(this.cumulative);
}

class CumulativeError extends CumulativeState {
  final String message;

  CumulativeError(this.message);
}

class CumulativeCubit extends Cubit<CumulativeState> {
  CumulativeCubit() : super(CumulativeInitial());

  Future<void> fetchCumulative(String token) async {
    try {
      final response = await http.get(
        Uri.https('server-hmit.onrender.com', '/application/cumulative'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final cumulative = Cumulative.fromJson(responseData);
        emit(CumulativeLoaded(cumulative));
      } else {
        throw Exception('Failed to load cumulative data');
      }
    } catch (e) {
      emit(CumulativeError('Failed to load cumulative data: $e'));
    }
  }
}

class Cumulative {
  String? one;
  String? two;
  String? three;
  String? four;
  String? cumulative;
  String? ratio;
  String? overallEstimate;
  String? military;

  Cumulative({
    this.one,
    this.two,
    this.three,
    this.four,
    this.cumulative,
    this.ratio,
    this.overallEstimate,
    this.military,
  });

  factory Cumulative.fromJson(Map<String, dynamic> json) {
    return Cumulative(
      one: json['one'],
      two: json['two'],
      three: json['three'],
      four: json['four'],
      cumulative: json['cumulative'],
      ratio: json['ratio'],
      overallEstimate: json['overallEstimate'],
      military: json['military'],
    );
  }
}
