part of 'general_cofigs_cubit.dart';

class GeneralCofigsState extends Equatable {
  final BlocStatus getGeneralConfigsStatus;
  final BlocStatus editGeneralConfigsStatus;

  GeneralCofigsState({
    this.getGeneralConfigsStatus = const BlocStatus.initial(),
    this.editGeneralConfigsStatus = const BlocStatus.initial(),
  });

  GeneralCofigsState copyWith({
    BlocStatus? getGeneralConfigsStatus,
    BlocStatus? editGeneralConfigsStatus,
  }) {
    return GeneralCofigsState(
      getGeneralConfigsStatus:
          getGeneralConfigsStatus ?? this.getGeneralConfigsStatus,
      editGeneralConfigsStatus:
          editGeneralConfigsStatus ?? this.editGeneralConfigsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getGeneralConfigsStatus,
      editGeneralConfigsStatus,
    ];
  }
}
