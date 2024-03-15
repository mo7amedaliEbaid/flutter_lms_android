part of 'time_table_cubit.dart';

@immutable
sealed class TimeTableState {}

final class TimeTableInitial extends TimeTableState {}

final class TimeTablesuceess extends TimeTableState {}

final class TimeTablefailure extends TimeTableState {
  final String errorMsg;

  TimeTablefailure({required this.errorMsg});
}

final class TimeTablelouding extends TimeTableState {}
