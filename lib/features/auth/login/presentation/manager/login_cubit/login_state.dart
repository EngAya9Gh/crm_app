part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

// verify otp
class VerifyOtpLoading extends LoginState {}

class VerifyOtpSuccess extends LoginState {}

class VerifyOtpFailure extends LoginState {
  final String message;

  VerifyOtpFailure(this.message);
}
