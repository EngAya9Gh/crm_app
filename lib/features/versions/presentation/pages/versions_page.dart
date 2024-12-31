import 'dart:io';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:crm_smart/features/versions/presentation/pages/add_new_version_alert_dialog.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:stepper_list_view/stepper_list_view.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_fonts.dart';
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
    _bloc.add(GetAllVersionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الاصدارت', showBackButton: true, actions: [
        IconButton(
            onPressed: () {
              date.clear();
              versionNo.clear();
              _bloc.add(ResetListAddedEvent());
              AppConstants.showAppDialog(
                child: AddNewVersionAlertDialog(date: date, versionNo: versionNo, bloc: _bloc),
              );
            },
            icon: Icon(
              Icons.add,
              color: AppColors.white,
            ))
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
                            content: data?[index] as VersionModel,
                            avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
                          )),
                  stepAvatar: (_, data) {
                    final stepData = data as StepperItemData;
                    return PreferredSize(
                      preferredSize: const Size.fromRadius(20),
                      child: GestureDetector(
                        onTap: () {
                          print((stepData.content as VersionModel).managementId);
                          date.text = DateFormat('yyyy/MM/dd').format((stepData.content as VersionModel).versionDate ?? DateTime.now());
                          versionNo.text = (stepData.content as VersionModel).versionNo ?? '';
                          _bloc.add(ResetListAddedEvent());
                          _bloc.add(AddOrUpdateNewVersionItemEvent(
                              oneItemVersionEntity: OneItemVersionEntity(
                                  index: 0,
                                  title: (stepData.content as VersionModel).title ?? '',
                                  description: (stepData.content as VersionModel).description ?? '',
                                  management: "${(stepData.content as VersionModel).managementId ?? ''}")));
                          AppConstants.showAppDialog(
                            child: AddNewVersionAlertDialog(date: date, versionNo: versionNo, bloc: _bloc),
                          );
                        },
                        child: CircleAvatar(
                          child: FittedBox(child: AppText((stepData.content as VersionModel).versionNo)),
                        ),
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
                        0,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(7),
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        title: AppText(DateFormat('yyyy/MM/dd').format((stepData.content as VersionModel).versionDate ?? DateTime.now())),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.height,
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AppText((stepData.content as VersionModel).management ?? 'الادارة العامة'),
                                ),
                                Spacer(),
                                Expanded(flex: 7, child: AppText('الادارة الموجه لها التحديث')),
                              ],
                            ),
                            10.height,
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AppText((stepData.content as VersionModel).title),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 7,
                                  child: AppText('عنوان التحديث'),
                                ),
                              ],
                            ),
                            10.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AppText((stepData.content as VersionModel).description),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 7,
                                  child: AppText('تفاصيل التحديث'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Colors.grey.shade500,
                            width: 0.8,
                          ),
                        ),
                      ),
                    );
                  },
                  stepperThemeData: StepperThemeData(
                    lineColor: Colors.grey,
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
