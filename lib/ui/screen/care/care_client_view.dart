import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_tab_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../view_model/communication_vm.dart';
import 'communcation_view_widget.dart';

class CareClientView extends StatefulWidget {
  CareClientView({
    required this.fk_client,
    Key? key,
    this.tabCareIndex = 0,
    required this.idCommunication,
  }) : super(key: key);
  String fk_client;
  int tabCareIndex;
  String idCommunication;

  @override
  _CareClientViewState createState() => _CareClientViewState();
}

class _CareClientViewState extends State<CareClientView> {
  Map tabsToIndex = {
    0: "ترحيب",
    1: "تركيب",
    2: "دورى",
    3: "تقييم النظام",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: tabBar(),
      ),
    );
  }

  Widget tabBar() {
    return Consumer<CommunicationVm>(builder: (context, communicationVm, _) {
      final carteClientState = communicationVm.careClientState;
      final isLoading = communicationVm.isLoadingCareClient;

      final initialIndex = carteClientState.keys.toList().indexOf(tabsToIndex[widget.tabCareIndex]) == -1
          ? 0
          : carteClientState.keys.toList().indexOf(tabsToIndex[widget.tabCareIndex]);
      if (isLoading) return AppLoader();

      return DefaultTabController(
        length: carteClientState.keys.length,
        initialIndex: initialIndex,
        child: Builder(builder: (context) {
          return Column(
            children: [
              AddManualTaskButton(
                list: carePublicTypeList,
                clientId: widget.fk_client,
              ),
              CustomTabBar(
                tabController: DefaultTabController.of(context),
                tabBarTabsText: carteClientState.keys.map((e) => e).toList(),
                labelColor: AppColors.primaryMain,
                indicatorColor: AppColors.primaryMain,
                unselectedLabelColor: Colors.grey.shade700,
              ),
              Expanded(
                child: TabBarView(
                  children: carteClientState.keys.mapIndexed((i, e) {
                    final list = carteClientState.values.toList()[i];
                    if(e=='تقييم النظام'){
                      if (list.first.lastRateDate != null)
                        return  Padding(
                          padding: EdgeInsets.all( 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "تاريخ اخر تقييم عبر النظام",
                                fontSize: 16,
                              ),
                              10.width,
                              AppText(
                                DateFormat('yyyy-MM-dd').format(list.first.lastRateDate!),
                                color: AppColors.primaryMain,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        );

                    }
                    return AppPaginatedList(
                      items: list,
                      itemBuilder: (context, index) {
                        return CommunicationExpandedWidget(
                        communicationModel: list[index],
                        initiallyExpanded: list[index].idCommunication == widget.idCommunication,
                      );
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          );
        }),
      );
    });
  }
}
