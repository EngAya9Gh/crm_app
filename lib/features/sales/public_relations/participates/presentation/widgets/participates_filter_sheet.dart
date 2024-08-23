import 'dart:ui' as myui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/common/extensions/extensions.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/cities/presentation/pages/cities_searchable_drop_down.dart';
import '../manager/participate_list_bloc.dart';

class ParticipatesFilterSheet extends StatefulWidget {
  const ParticipatesFilterSheet({
    Key? key,
    required this.onFilter,
  });

  final VoidCallback onFilter;

  @override
  State<ParticipatesFilterSheet> createState() {
    return _ParticipatesFilterSheetState();
  }
}

class _ParticipatesFilterSheetState extends State<ParticipatesFilterSheet> {
  late final ParticipateListBloc _participateListBloc;

  @override
  void initState() {
    _participateListBloc = context.read<ParticipateListBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: myui.TextDirection.rtl,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _participateListBloc.filterVariables.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _participateListBloc.filterVariables
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _participateListBloc.filterVariables.clear();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            CitiesSearchableDropDown(
              selectedCityId: _participateListBloc
                  .filterVariables.selectedCity.value?.cityId,
              onSelected: (city) {
                _participateListBloc.filterVariables.selectedCity.value = city;
                //
              },
            ),
            10.height,
            CustomDropDown<StateParticipateEnum>(
              hint: 'حالة المتعاون',
              items: StateParticipateEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem:
                  _participateListBloc.filterVariables.stateParticipate.value,
              onChanged: (state) {
                _participateListBloc.filterVariables.stateParticipate.value =
                    state;
              },
              height: 100.h,
            ),
            20.height,
            AppElevatedButton(
              text: 'فلترة',
              width: double.infinity,
              onPressed: () => _filterAndCloseDialog(),
            ),
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _participateListBloc.filterVariables.savePreviousState();
    widget.onFilter();
    AppNavigator.pop(result: true);
  }
}
