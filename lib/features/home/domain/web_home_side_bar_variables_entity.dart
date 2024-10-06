import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../core/common/lists/sections_lists.dart';
import '../../../core/common/models/sections/section_model.dart';

class WebHomeSideBarVariablesEntity {
  List<SectionModel> selectedSubSections = SectionsLists.homeSections;
  int currentSectionIndex = 0;
  int selectedSectionIndex = 0;
  int selectedSubSectionIndex = -1;
  List<ExpandedTileController> expandedTileControllers = List.generate(
    SectionsLists.homeSections.length,
    (index) => ExpandedTileController(),
  );

  void resetSelected() {
    currentSectionIndex = 0;
    selectedSectionIndex = 0;
    selectedSubSectionIndex = -1;
    selectedSubSections = SectionsLists.homeSections;
  }

  void setSelected({
    required int selectedSectionIdx,
    required int selectedSubSectionIdx,
  }) {
    currentSectionIndex = selectedSectionIdx;
    selectedSectionIndex = selectedSectionIdx;
    selectedSubSectionIndex = selectedSubSectionIdx;
    selectedSubSections =
        SectionsLists.homeSections[selectedSectionIdx].subSections;
  }
}
