import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/count_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/utils/extensions/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/filter_tickets_sheet.dart';
import '../widgets/tickets_list.dart';
import 'add_ticket_page.dart';

class ClientsTicketsPage extends StatefulWidget {
  const ClientsTicketsPage({super.key});

  @override
  State<ClientsTicketsPage> createState() => _ClientsTicketsPageState();
}

class _ClientsTicketsPageState extends State<ClientsTicketsPage> {
  late String typePayController;
  late TicketsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<TicketsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getTickets();
      await _cubit.getCategories();
      Provider.of<ClientTypeProvider>(context, listen: false)
          .getreasons('ticket');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تذاكر العملاء',
        // add new ticket
        actions: [
          if (context.read<PrivilegeCubit>().checkPrivilege('26')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "إضافة\nتذكرة",
                onPressed: () => AppNavigator.push(AddTicketPage()),
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: kfontfamily2,
                  color: kWhiteColor,
                ),
                appButtonStyle: AppButtonStyle.secondary,
              ),
            ),
          ],
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: _cubit.pageVariables.searchController,
                    onChanged: (value) {
                      _cubit.getTickets(isDebounced: true);
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    final value = await AppBottomSheet.show(
                      context: context,
                      child: FilterTicketsSheet(),
                    );
                    if (value != true) {
                      _cubit.returnToPreviousState();
                    }
                  },
                ),
                8.width,
              ],
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CountPaginatedList<TicketsCubit, TicketsState>(
                label: "عدد التذاكر",
                totalCount: (state) => _cubit.pageVariables.totalCount,
                countSelector: (state) => _cubit.pageVariables.allList.length,
              ),
            ),
            10.height,
            Expanded(
              child: BlocBuilder<TicketsCubit, TicketsState>(
                buildWhen: (previous, current) {
                  return _shouldRebuild(current, previous);
                },
                builder: (context, state) {
                  if (state is GetTicketsError) {
                    return CustomErrorWidget(
                      message: state.message,
                      onPressed: () async {
                        await _cubit.getTickets();
                      },
                    );
                  } else if (state is GetTicketsLoaded &&
                      _cubit.pageVariables.allList.isEmpty) {
                    return CustomErrorWidget(
                      message: 'لا يوجد بيانات',
                    );
                  } else if (state is GetTicketsLoading ||
                      _cubit.pageVariables.allList.isEmpty) {
                    return AppLoader();
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TicketsList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldRebuild(
    TicketsState current,
    TicketsState previous,
  ) {
    return current != previous &&
        _cubit.pageVariables.isNewFilter &&
        (current is GetTicketsLoaded ||
            current is GetTicketsError ||
            current is GetTicketsLoading ||
            current is GetTicketsLoaded);
  }
}
