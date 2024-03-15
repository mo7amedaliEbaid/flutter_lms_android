part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoginLoudingState extends AuthCubitState {}

final class LoginSuccessState extends AuthCubitState {
  AuthModel authModel;

  LoginSuccessState(this.authModel);
}

final class LoginFailureState extends AuthCubitState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}
