import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/edit_advanced_configs_usecase.dart';
import '../../domain/use_cases/get_advanced_configs_usecase.dart';

part 'advanced_cofigs_state.dart';

@injectable
class AdvancedCofigsCubit extends Cubit<AdvancedCofigsState> {
  final GetAdvancedConfigsUsecase _getAdvancedConfigsUsecase;
  final EditAdvancedConfigsUsecase _editAdvancedConfigsUsecase;

  AdvancedCofigsCubit(
    this._getAdvancedConfigsUsecase,
    this._editAdvancedConfigsUsecase,
  ) : super(AdvancedCofigsState());

  List<ConfigModel> configs = [];
  List<ConfigModel> tempEditedConfigs = [];

  Future<void> getAdvancedConfigs() async {
    emit(state.copyWith(getAdvancedConfigsStatus: const BlocStatus.loading()));
    final result =
        await _getAdvancedConfigsUsecase(const GetAdvancedConfigsParams());
    result.fold(
      (e) => emit(
          state.copyWith(getAdvancedConfigsStatus: BlocStatus.fail(error: e))),
      (data) {
        configs = data;
        tempEditedConfigs = List<ConfigModel>.from(configs);
        emit(state.copyWith(
          getAdvancedConfigsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  Future<void> updateConfigs() async {
    emit(state.copyWith(editAdvancedConfigsStatus: const BlocStatus.loading()));
    final result = await _editAdvancedConfigsUsecase(
      EditAdvancedConfigsParams(configs: tempEditedConfigs),
    );
    result.fold(
      (e) => emit(
          state.copyWith(editAdvancedConfigsStatus: BlocStatus.fail(error: e))),
      (data) {
        configs = List<ConfigModel>.from(tempEditedConfigs);
        emit(state.copyWith(
          editAdvancedConfigsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  void locallyEditAdvancedConfig(ConfigModel config, String? value) {
    AppConstants.debounceFunction(
      () {
        final index = tempEditedConfigs.indexWhere((element) {
          return element.idConfig == config.idConfig;
        });
        tempEditedConfigs[index] = config.copyWith(valueConfig: value);
      },
      tag: 'locallyEditAdvancedConfig',
    );
  }
}
