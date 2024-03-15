part of 'askarya_cubit.dart';

@immutable
sealed class AskaryaState {}

final class AskaryaInitial extends AskaryaState {}

final class AskaryaSuccess extends AskaryaState {}

final class AskaryaFailure extends AskaryaState {
  final String errorMassage;

  AskaryaFailure({required this.errorMassage});
}

final class AskaryaLouding extends AskaryaState {}
