import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/lists/sections_lists.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/web_home_side_bar_variables_entity.dart';

part 'web_home_page_state.dart';

@injectable
class WebHomePageCubit extends Cubit<WebHomePageState> {
  WebHomePageCubit() : super(WebHomePageState());

  WebHomeSideBarVariablesEntity sideBarEntity = WebHomeSideBarVariablesEntity();

  void resetSelected() {
    emit(state.copyWith(resetSelected: const BlocStatus.loading()));
    sideBarEntity.resetSelected();
    emit(state.copyWith(resetSelected: const BlocStatus.success()));
  }

  void setSelected({
    required int selectedSectionIdx,
    required int selectedSubSectionIdx,
  }) {
    emit(state.copyWith(setSelected: const BlocStatus.loading()));
    sideBarEntity.setSelected(
      selectedSectionIdx: selectedSectionIdx,
      selectedSubSectionIdx: selectedSubSectionIdx,
    );
    emit(state.copyWith(setSelected: const BlocStatus.success()));
  }

  void setSelectedSubSections() {
    emit(state.copyWith(setSelected: const BlocStatus.loading()));
    sideBarEntity.selectedSubSections = SectionsLists
        .homeSections[sideBarEntity.currentSectionIndex].subSections;
    emit(state.copyWith(setSelected: const BlocStatus.success()));
  }
}
