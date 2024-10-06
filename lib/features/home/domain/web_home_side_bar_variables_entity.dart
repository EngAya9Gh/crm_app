import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../core/common/lists/sections_lists.dart';
import '../../../core/common/models/sections/section_model.dart';

class WebHomeSideBarVariablesEntity {
  List<SectionModel> selectedSubSections = SectionsLists.salesSections;
  int selectedSectionIndex = 0;
  int selectedSubSectionIndex = -1;
  List<ExpandedTileController> expandedTileControllers = [];

  void resetSelected() {
    selectedSubSections = SectionsLists.salesSections;
    selectedSectionIndex = 0;
    selectedSubSectionIndex = -1;
  }

  void initExpandedTileControllers() {
    expandedTileControllers = List.generate(
      SectionsLists.homeSections.length,
      (index) =>
          ExpandedTileController(isExpanded: index == selectedSectionIndex),
    );
  }
}
