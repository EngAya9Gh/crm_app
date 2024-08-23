import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_branches_by_id_country_use_case.dart';

part 'branches_state.dart';

@injectable
class BranchesCubit extends Cubit<BranchesState> {
  final GetBranchesByIdCountryUseCase _getBranchesByIdCountryUseCase;

  BranchesCubit(
    this._getBranchesByIdCountryUseCase,
  ) : super(BranchesState());

  List<BranchModel> branchesList = [];

  BranchModel? _selectedCity;

  BranchModel? get selectedCity => _selectedCity;

  set selectedCity(BranchModel? value) {
    _selectedCity = value;
    emit(state.copyWith(selectBranchStatus: BlocStatus.success()));
  }

  Future<void> getBranchesByIdCountry({
    required String fkCountry,
    Function? onSuccess,
  }) async {
    if (state.getBranchesStatus.isLoading() || branchesList.isNotEmpty) return;
    emit(state.copyWith(getBranchesStatus: BlocStatus.loading()));

    final result = await _getBranchesByIdCountryUseCase(
      GetBranchesByIdCountryParams(),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(getBranchesStatus: BlocStatus.fail()));
      },
      (r) {
        branchesList = r;
        emit(state.copyWith(getBranchesStatus: BlocStatus.success()));
      },
    );

    onSuccess?.call();
  }

  void loadCurrentBranchesById({String? cityId}) {
    if (cityId == null) {
      selectedCity = null;
    } else {
      _selectedCity = branchesList.firstWhereOrNull((element) {
        return element.branchId == cityId;
      });
    }
    emit(state.copyWith(selectBranchStatus: BlocStatus.success()));
  }
}
