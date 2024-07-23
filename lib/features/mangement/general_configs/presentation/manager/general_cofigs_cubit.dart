import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/config_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/edit_general_configs_usecase.dart';
import '../../domain/use_cases/get_general_configs_usecase.dart';

part 'general_cofigs_state.dart';

@injectable
class GeneralCofigsCubit extends Cubit<GeneralCofigsState> {
  final GetGeneralConfigsUsecase _getGeneralConfigsUsecase;
  final EditGeneralConfigsUsecase _editGeneralConfigsUsecase;

  GeneralCofigsCubit(
    this._getGeneralConfigsUsecase,
    this._editGeneralConfigsUsecase,
  ) : super(GeneralCofigsState());

  List<ConfigModel> configs = [];
  List<ConfigModel> tempEditedConfigs = [];

  Future<void> getGeneralConfigs() async {
    emit(state.copyWith(getGeneralConfigsStatus: const BlocStatus.loading()));
    final result =
        await _getGeneralConfigsUsecase(const GetGeneralConfigsParams());
    result.fold(
      (e) => emit(
          state.copyWith(getGeneralConfigsStatus: BlocStatus.fail(error: e))),
      (data) {
        configs = data;
        tempEditedConfigs = List<ConfigModel>.from(configs);
        emit(state.copyWith(
          getGeneralConfigsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  Future<void> updateConfigs() async {
    emit(state.copyWith(editGeneralConfigsStatus: const BlocStatus.loading()));
    final result = await _editGeneralConfigsUsecase(
      EditGeneralConfigsParams(configs: tempEditedConfigs),
    );
    result.fold(
      (e) => emit(
          state.copyWith(editGeneralConfigsStatus: BlocStatus.fail(error: e))),
      (data) {
        configs = List<ConfigModel>.from(tempEditedConfigs);
        emit(state.copyWith(
          editGeneralConfigsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  void locallyEditGeneralConfig(ConfigModel config, String? value) {
    AppConstants.debounceFunction(
      () {
        final index = tempEditedConfigs.indexWhere((element) {
          return element.idConfig == config.idConfig;
        });
        tempEditedConfigs[index] = config.copyWith(valueConfig: value);
      },
      tag: 'locallyEditGeneralConfig',
    );
  }
}
