part of 'wrong_numbers_cubit.dart';

class WrongNumbersState extends Equatable {
  final BlocStatus getWrongNumbersStatus;

  WrongNumbersState({
    this.getWrongNumbersStatus = const BlocStatus.initial(),
  });

  WrongNumbersState copyWith({
    BlocStatus? getWrongNumbersStatus,
  }) {
    return WrongNumbersState(
      getWrongNumbersStatus:
          getWrongNumbersStatus ?? this.getWrongNumbersStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getWrongNumbersStatus,
    ];
  }
}
