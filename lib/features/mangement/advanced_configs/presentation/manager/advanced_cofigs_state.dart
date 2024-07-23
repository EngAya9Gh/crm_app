part of 'advanced_cofigs_cubit.dart';

class AdvancedCofigsState extends Equatable {
  final BlocStatus getAdvancedConfigsStatus;
  final BlocStatus editAdvancedConfigsStatus;

  AdvancedCofigsState({
    this.getAdvancedConfigsStatus = const BlocStatus.initial(),
    this.editAdvancedConfigsStatus = const BlocStatus.initial(),
  });

  AdvancedCofigsState copyWith({
    BlocStatus? getAdvancedConfigsStatus,
    BlocStatus? editAdvancedConfigsStatus,
  }) {
    return AdvancedCofigsState(
      getAdvancedConfigsStatus:
          getAdvancedConfigsStatus ?? this.getAdvancedConfigsStatus,
      editAdvancedConfigsStatus:
          editAdvancedConfigsStatus ?? this.editAdvancedConfigsStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      getAdvancedConfigsStatus,
      editAdvancedConfigsStatus,
    ];
  }
}
