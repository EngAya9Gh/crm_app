import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../widgets/add_new_entry_version.dart';

class AddNewVersionAlertDialog extends StatelessWidget {
  AddNewVersionAlertDialog({
    super.key,
    required this.date,
    required this.versionNo,
    required VersionsBloc bloc,
  }) : _bloc = bloc;

  final TextEditingController date;
  final TextEditingController versionNo;
  final VersionsBloc _bloc;
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppText('add new version'),
      elevation: 5,
      content: Form(
        key: _globalKey,
        child: SizedBox(
          height: 320,
          width: 500,
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppTextField(
                      hintText: "التاريخ",
                      controller: date,
                      validator: InputValidator.requiredFiled,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        ).then((selectedDate) {
                          // Handle the selected date and time here.
                          if (selectedDate != null) {
                            DateTime selectedDateTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                            );
                            print(selectedDateTime); // You can use the selectedDateTime as needed.
                            date.text = DateFormat('yyyy/MM/dd').format(selectedDateTime);
                          }
                        });
                      },
                      readOnly: true,
                      isRequired: true,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: AppTextField(
                      hintText: "رقم الاصدار",
                      controller: versionNo,
                      isRequired: true,
                      validator: InputValidator.requiredFiled,
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              BlocBuilder<VersionsBloc, VersionsState>(
                bloc: _bloc,
                builder: (context, state) {
                  return Column(
                    children: state.listAddNew.map((e) {
                      print(e.toString());
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: AddNewEntryVersion(
                          bloc: _bloc,
                          oneItemVersionEntity: e,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              AppTextButton(
                text: 'add new',
                onPressed: () {
                  _bloc.add(AddOrUpdateNewVersionItemEvent(oneItemVersionEntity: OneItemVersionEntity(index: _bloc.state.listAddNew.last.index + 1)));
                },
              )
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: AppElevatedButton(
                  text: 'add',
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _bloc.add(AddVersionEvent(
                        onSuccess: () {
                          context.pop();
                          _bloc.add(GetAllVersionsEvent());
                        },
                          addVersionPramas: AddVersionPramas(versionNo: versionNo.text, versionDate: date.text, onItem: _bloc.state.listAddNew)));
                    }
                  },
                )),
            Spacer(),
            Expanded(
                flex: 2,
                child: AppElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: 'cancel',
                )),
          ],
        )
      ],
    );
  }
}
