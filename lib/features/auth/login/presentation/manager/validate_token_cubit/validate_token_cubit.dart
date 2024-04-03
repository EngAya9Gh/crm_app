import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_cases/validate_token_usecase.dart';

part 'validate_token_state.dart';

@injectable
class ValidateTokenCubit extends Cubit<ValidateTokenState> {
  final ValidateTokenUsecase _validateTokenUsecase;

  ValidateTokenCubit(this._validateTokenUsecase)
      : super(ValidateTokenInitial());

  Future<void> validateToken() async {
    emit(ValidateTokenLoading());
    final result = await _validateTokenUsecase(ValidateTokenParams());
    result.fold(
      (error) => emit(ValidateTokenFailure(error)),
      (_) => emit(ValidateTokenSuccess()),
    );
  }
}
