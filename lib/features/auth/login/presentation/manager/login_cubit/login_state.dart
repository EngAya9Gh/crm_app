part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BlocStatus loginStatus;
  final BlocStatus verifyOtpStatus;
  final BlocStatus validateTokenStatus;

  const LoginState({
    this.loginStatus = const BlocStatus.initial(),
    this.verifyOtpStatus = const BlocStatus.initial(),
    this.validateTokenStatus = const BlocStatus.initial(),
  });

  LoginState copyWith({
    BlocStatus? loginStatus,
    BlocStatus? verifyOtpStatus,
    BlocStatus? validateTokenStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      validateTokenStatus: validateTokenStatus ?? this.validateTokenStatus,
    );
  }

  @override
  List<Object> get props => [loginStatus, verifyOtpStatus, validateTokenStatus];
}
