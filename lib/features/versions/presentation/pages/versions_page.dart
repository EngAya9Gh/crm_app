import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:stepper_list_view/stepper_list_view.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../notifications/presentation/widgets/card_notifications.dart';
import '../widgets/add_new_entry_version.dart';

class VersionsPage extends StatefulWidget {
  const VersionsPage({super.key});

  @override
  State<VersionsPage> createState() => _NotificationsState();
}

class _NotificationsState extends State<VersionsPage> {
  late final VersionsBloc _bloc;
  final TextEditingController date = TextEditingController();
  final TextEditingController versionNo = TextEditingController();

  @override
  void initState() {
    _bloc = context.read<VersionsBloc>();
    _bloc.add(AddVersionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الاصدارت', showBackButton: true, actions: [
        IconButton(
            onPressed: () {
              AppConstants.showAppDialog(
                child: AlertDialog(
                  title: AppText('add new version'),
                  elevation: 5,
                  content: SizedBox(
                    height: 300,
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
                              ),
                            ),
                          ],
                        ),
                        40.verticalSpace,
                        BlocBuilder<VersionsBloc, VersionsState>(
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsetsDirectional.only(bottom: 10),
                              child: Column(
                                children: state.listAddNew.map((e) {
                                  print(e.toString());
                                  return AddNewEntryVersion(
                                    bloc: _bloc,
                                    oneItemVersionEntity: e,
                                  );
                                }).toList(),
                              ),
                            );
                          },
                        ),
                        AppTextButton(
                          text: 'add new',
                          onPressed: () {
                            _bloc.add(AddOrUpdateNewVersionItemEvent(
                                oneItemVersionEntity: OneItemVersionEntity(index: _bloc.state.listAddNew.last.index + 1)));
                          },
                        )
                      ],
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
                                print(date.text);
                                print(versionNo.text);
                                print(_bloc.state.listAddNew.toString());
                              },
                            )),
                        Spacer(),
                        Expanded(
                            flex: 2,
                            child: AppElevatedButton(
                              text: 'cancel',
                            )),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: Icon(Icons.add))
      ]),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return state.getAllVersionsStatus.when(
              loading: () => AppLoader(),
              success: (data) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: StepperListView(
                  showStepperInLast: true,
                  stepperData: List.generate(
                      data?.length ?? 0,
                      (index) => StepperItemData(
                            id: '$index',
                            content: data?[index],
                            avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
                          )),
                  stepAvatar: (_, data) {
                    final stepData = data as StepperItemData;
                    return PreferredSize(
                      preferredSize: const Size.fromRadius(20),
                      child: CircleAvatar(
                        child: FittedBox(child: AppText((stepData.content as VersionModel).versionNo)),
                      ),
                    );
                  },
                  stepWidget: (_, data) {
                    final stepData = data as StepperItemData;
                    return PreferredSize(
                      preferredSize: const Size.fromWidth(30),
                      child: SizedBox
                          .shrink() /*AppText(
                        (stepData.content as VersionModel).versionNo,
                        textAlign: TextAlign.center,
                      )*/
                      ,
                    );
                  },
                  stepContentWidget: (_, data) {
                    final stepData = data as StepperItemData;
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      padding: const EdgeInsets.all(
                        15,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(7),
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        title: AppText((stepData.content as VersionModel).management ?? (stepData.content as VersionModel).title),
                        subtitle: AppText((stepData.content as VersionModel).description ?? ''),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Colors.green,
                            width: 0.8,
                          ),
                        ),
                      ),
                    );
                  },
                  stepperThemeData: StepperThemeData(
                    lineColor: Colors.red,
                    lineWidth: 5,
                  ),
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
              failure: (error, data) => AppErrorWidget(
                message: error,
                onPressed: () => _bloc.add(GetAllVersionsEvent()),
              ),
            );
          },
        ),
      ),
    );
  }
}
