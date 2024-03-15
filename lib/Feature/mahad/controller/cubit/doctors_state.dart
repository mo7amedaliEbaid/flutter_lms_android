part of 'doctors_cubit.dart';

sealed class DoctorsState extends Equatable {
  const DoctorsState();

  @override
  List<Object> get props => [];
}

final class DoctorsInitial extends DoctorsState {}

final class GetDoctorsLouding extends DoctorsState {}

final class GetDoctorsSuccess extends DoctorsState {}

final class GetDoctorsFailure extends DoctorsState {
  final String errMsg;

  const GetDoctorsFailure(this.errMsg);
}
