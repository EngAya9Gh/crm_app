import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/count_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/tickets_cubit/tickets_cubit.dart';
import '../widgets/filter_tickets_sheet.dart';
import '../widgets/tickets_list.dart';
import 'add_ticket_page.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
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
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'تذاكر العملاء',
        actions: [
          if (context.read<PrivilegesCubit>().checkPrivilege('26')) ...[
            Directionality(
              textDirection: TextDirection.rtl,
              child: AppTextButton(
                text: "إضافة\nتذكرة",
                onPressed: () => AppNavigator.push(AddTicketPage()),
                textStyle: AppStyles.textStyle.copyWith(
                  fontSize: (16.0).scaleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2,
                  color: AppColors.kWhiteColor,
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
                    return AppErrorWidget(
                      message: state.message,
                      onPressed: () async {
                        await _cubit.getTickets();
                      },
                    );
                  } else if (state is GetTicketsLoaded &&
                      _cubit.pageVariables.allList.isEmpty) {
                    return AppErrorWidget(
                      message: 'لا يوجد بيانات',
                    );
                  } else if (state is GetTicketsLoading ||
                      _cubit.pageVariables.allList.isEmpty) {
                    return AppLoader();
                  }

                  return TicketsPaginatedList();
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
