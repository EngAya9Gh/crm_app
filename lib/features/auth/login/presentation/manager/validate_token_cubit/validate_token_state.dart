part of 'validate_token_cubit.dart';

@immutable
abstract class ValidateTokenState {}

class ValidateTokenInitial extends ValidateTokenState {}

class ValidateTokenLoading extends ValidateTokenState {}

class ValidateTokenSuccess extends ValidateTokenState {}

class ValidateTokenFailure extends ValidateTokenState {
  final String error;

  ValidateTokenFailure(this.error);
}
