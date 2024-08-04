import 'package:flutter/material.dart';

import '../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../core/common/enums/comments/no_comments_enum.dart';
import '../../../../../core/common/models/region_model.dart';
import '../../../../../model/usermodel.dart';

class FilterLatestUpdatesEntity {
  final ValueNotifier<bool> isMarketingNotifier = ValueNotifier<bool>(true);
  final ValueNotifier<TypeClientEnum?> typeClientNotifier =
      ValueNotifier<TypeClientEnum?>(null);

  final ValueNotifier<RegionModel?> fkRegionNotifier =
      ValueNotifier<RegionModel?>(null);
  final ValueNotifier<UserModel?> fkUserNotifier =
      ValueNotifier<UserModel?>(null);
  final ValueNotifier<NoCommentsEnum?> commentsNotifier =
      ValueNotifier<NoCommentsEnum?>(null);

  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();

  final TextEditingController ageFromController = TextEditingController();
  final TextEditingController ageToController = TextEditingController();

  void clearFilters() {
    fkRegionNotifier.value = null;
    isMarketingNotifier.value = true;
    typeClientNotifier.value = null;
    fkUserNotifier.value = null;
    dateFromController.text = '';
    dateToController.text = '';
    ageFromController.text = '';
    ageToController.text = '';
    commentsNotifier.value = null;
  }

  FilterLatestUpdatesEntity? _previousState;

  void savePreviousState() {
    _previousState = FilterLatestUpdatesEntity()
      ..fkRegionNotifier.value = this.fkRegionNotifier.value
      ..isMarketingNotifier.value = this.isMarketingNotifier.value
      ..typeClientNotifier.value = this.typeClientNotifier.value
      ..fkUserNotifier.value = this.fkUserNotifier.value
      ..dateFromController.text = this.dateFromController.text
      ..dateToController.text = this.dateToController.text
      ..ageFromController.text = this.ageFromController.text
      ..ageToController.text = this.ageToController.text
      ..commentsNotifier.value = this.commentsNotifier.value;
  }

  FilterLatestUpdatesEntity get returnToPreviousState {
    if (_previousState == null) {
      this.clearFilters();
      return this;
    }
    return _previousState!..savePreviousState();
  }

  Iterable<Listenable?> listenables() {
    return [
      fkRegionNotifier,
      isMarketingNotifier,
      typeClientNotifier,
      fkUserNotifier,
      dateFromController,
      dateToController,
      ageFromController,
      ageToController,
      commentsNotifier,
    ];
  }

  bool checkIfFilterIsNotEmpty() {
    return fkRegionNotifier.value != null ||
        isMarketingNotifier.value != true ||
        typeClientNotifier.value != null ||
        fkUserNotifier.value != null ||
        dateFromController.text.isNotEmpty ||
        dateToController.text.isNotEmpty ||
        ageFromController.text.isNotEmpty ||
        ageToController.text.isNotEmpty ||
        commentsNotifier.value != null;
  }
}
