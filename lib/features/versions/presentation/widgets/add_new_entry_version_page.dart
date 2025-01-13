import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
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

class AddVersionPage extends StatefulWidget {
  const AddVersionPage({super.key, this.versionModel});

  final VersionModel? versionModel;

  @override
  _AddVersionPageState createState() => _AddVersionPageState();
}

class _AddVersionPageState extends State<AddVersionPage> {
  late final ViolationsCubit violationsCubit;
  final ValueNotifier<List<ManagementModel>> listManagement = ValueNotifier([]);
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
        listManagement.value = value..insert(0, ManagementModel(idManage: 0, nameManage: 'عام'));
      },
    );
    if (widget.versionModel?.versionDate != null) {
      date.text = DateFormat('yyyy-MM-dd').format(widget.versionModel!.versionDate!);
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
            child: Column(
              children: [
                AppTextField(
                  hintText: "رقم الاصدار",
                  controller: versionNo,
                  isRequired: true,
                  enabled: widget.versionModel == null,
                  validator: InputValidator.requiredFiled,
                ),
                10.height,
                AppTextField(
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
                        date.text = DateFormat('yyyy-MM-dd').format(selectedDateTime);
                      }
                    });
                  },
                  readOnly: true,
                  isRequired: true,
                ),
                40.height,
                BlocBuilder<VersionsBloc, VersionsState>(
                  builder: (context, state) {
                    return Column(
                      children: state.listAddNew.map((e) {
                        print(e.toString());
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: ValueListenableBuilder(
                            valueListenable: listManagement,
                            builder: (context, value, child) => AddNewEntryVersion(
                              shouldShowClose: e.index!=0&&widget.versionModel==null,
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
                          oneItemVersionEntity: OneItemVersionEntity(index: (bloc.state.listAddNew.lastOrNull?.index ?? -1) + 1)));
                    },
                  ),
                40.height,
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: AppElevatedButton(
                          text: widget.versionModel != null ? "update" : 'add',
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
                                    addVersionPramas:
                                        AddVersionPramas(versionNo: versionNo.text, versionDate: date.text, onItem: bloc.state.listAddNew)));
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
    );
  }
}
