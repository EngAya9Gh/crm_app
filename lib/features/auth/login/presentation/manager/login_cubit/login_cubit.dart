import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/cache_token_usecase.dart';
import '../../../domain/use_cases/get_token_usecase.dart';
import '../../../domain/use_cases/login_usecase.dart';
import '../../../domain/use_cases/verify_otp_usecase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final CacheTokenUsecase _cacheTokenUsecase;
  final GetTokenUsecase _getTokenUsecase;

  LoginCubit(
    this._loginUsecase,
    this._verifyOtpUsecase,
    this._cacheTokenUsecase,
    this._getTokenUsecase,
  ) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUsecase(
      LoginParams(email: email),
    );
    result.fold(
      (error) => emit(LoginFailure(error)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> verifyOtp(String otp, String email) async {
    print("objectobjectobjectobject");
    emit(VerifyOtpLoading());
    final result = await _verifyOtpUsecase(
      VerifyOtpParams(otp: otp, email: email),
    );
    result.fold(
      (error) => emit(VerifyOtpFailure(error)),
      (token) {
        cacheToken(token);
        emit(VerifyOtpSuccess());
      },
    );
  }

  Future<void> cacheToken(String token) async {
    final result = await _cacheTokenUsecase(CacheTokenParams(token: token));
    result.fold(
      (error) => emit(LoginFailure(error)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> getToken() async {
    final result = await _getTokenUsecase(GetTokenParams());
    result.fold(
      (error) => emit(LoginFailure(error)),
      (_) => emit(LoginSuccess()),
    );
  }
}
