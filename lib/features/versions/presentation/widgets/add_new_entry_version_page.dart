import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../model/versionModel.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../../clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../manager/versions_bloc.dart';
import 'new_entry_version_widget.dart';
import 'package:crm_smart/core/common/widgets/section_header.dart';
import 'package:crm_smart/core/common/widgets/info_item.dart';

class AddVersionPage extends StatefulWidget {
  const AddVersionPage({super.key, this.versionModel});

  final VersionModel? versionModel;

  @override
  _AddVersionPageState createState() => _AddVersionPageState();
}

class _AddVersionPageState extends State<AddVersionPage> {
  late final ViolationsCubit violationsCubit;
  final ValueNotifier<List<ManagementModel>> listManagement = ValueNotifier([]);
  final ValueNotifier<int?> versionDateIndex = ValueNotifier(0);
  final TextEditingController date = TextEditingController();
  final TextEditingController versionNo = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  late final VersionsBloc bloc;

  @override
  void initState() {
    bloc = context.read<VersionsBloc>();

    violationsCubit = context.read<ViolationsCubit>()..init;
    violationsCubit.getAllManagements(
      onSuccess: (value) {
        listManagement.value = value
          ..insert(0, ManagementModel(idManage: 0, nameManage: 'عام'));
      },
    );
    if (widget.versionModel?.versionDate != null) {
      date.text =
          DateFormat('yyyy-MM-dd').format(widget.versionModel!.versionDate!);
    }
    if (widget.versionModel?.versionNo != null) {
      versionNo.text = widget.versionModel!.versionNo!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'إضافة إصدار جديد', showBackButton: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: ValueListenableBuilder(
              valueListenable: versionDateIndex,
              builder: (context, typeVersion, child) => Column(
                children: [
                  SectionHeader(title: 'نوع التحديث'),
                  Container(
                    padding: EdgeInsets.only(left: 2, right: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Colors.black87.withOpacity(0.2),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: AppGroupButton(
                      width: (MediaQuery.of(context).size.width / 2) - 50,
                      groupButtonController:
                          GroupButtonController(selectedIndex: typeVersion),
                      buttons: ['تحديث جديد', 'تحديث قادم'],
                      onSelected: (value, index, isSelected) {
                        versionDateIndex.value = index;
                      },
                    ),
                  ),
                  10.height,
                  SectionHeader(title: 'معلومات التحديث'),
                  InfoItem(
                    title: "رقم التحديث",
                    isRequired: typeVersion != 1,
                    customWidget: AppTextField(
                      controller: versionNo,
                      enabled: widget.versionModel == null,
                    ),
                  ),
                  10.height,
                  InfoItem(
                    title: "التاريخ",
                    isRequired: typeVersion != 1,
                    customWidget: AppTextField(
                      controller: date,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            DateTime selectedDateTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                            );
                            print(selectedDateTime);
                            date.text = DateFormat('yyyy-MM-dd')
                                .format(selectedDateTime);
                          }
                        });
                      },
                      readOnly: true,
                    ),
                  ),
                  40.height,
                  SectionHeader(title: 'تفاصيل التحديث'),
                  BlocBuilder<VersionsBloc, VersionsState>(
                    builder: (context, state) {
                      return Column(
                        children: state.listAddNew.map((e) {
                          print(e.toString());
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 45),
                            child: ValueListenableBuilder(
                              valueListenable: listManagement,
                              builder: (context, value, child) =>
                                  AddNewEntryVersion(
                                isTitleOpional: typeVersion == 1,
                                shouldShowClose:
                                    e.index != 0 && widget.versionModel == null,
                                listManagement: value,
                                oneItemVersionEntity: e,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  if (widget.versionModel == null)
                    AppTextButton(
                      text: 'add new',
                      onPressed: () {
                        bloc.add(AddOrUpdateNewVersionItemEvent(
                            oneItemVersionEntity: OneItemVersionEntity(
                                index:
                                    (bloc.state.listAddNew.lastOrNull?.index ??
                                            -1) +
                                        1)));
                      },
                    ),
                  40.height,
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: AppElevatedButton(
                            text:
                                widget.versionModel != null ? "update" : 'add',
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {
                                if (widget.versionModel != null) {
                                  bloc.add(UpdateVersionEvent(
                                      onSuccess: () {
                                        context.pop();
                                        bloc.add(GetAllVersionsEvent());
                                      },
                                      addVersionPramas: AddVersionPramas(
                                          id: widget.versionModel!.id,
                                          versionNo: versionNo.text,
                                          versionDate: date.text,
                                          onItem: bloc.state.listAddNew)));
                                } else {
                                  bloc.add(AddOrVersionEvent(
                                      onSuccess: () {
                                        context.pop();
                                        bloc.add(GetAllVersionsEvent());
                                      },
                                      addVersionPramas: AddVersionPramas(
                                        versionNo: versionNo.text,
                                        versionDate: date.text,
                                        onItem: bloc.state.listAddNew,
                                        isCurrent: typeVersion == 0 ? 1 : null,
                                      )));
                                }
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
                  ),
                  15.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
