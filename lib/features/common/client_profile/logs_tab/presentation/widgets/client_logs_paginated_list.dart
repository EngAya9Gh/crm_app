import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/common/client_profile/logs_tab/data/models/client_log_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/client_logs_cubit/client_logs_tab_cubit.dart';
import 'card_client_log.dart';

class ClientLogsPaginatedList extends StatelessWidget {
  const ClientLogsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ClientLogsTabCubit>();
    return BlocBuilder<ClientLogsTabCubit, ClientLogsTabState>(
      buildWhen: (previous, current) {
        return previous.getClientLogsStatus != current.getClientLogsStatus;
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: _cubit.pageVariables.filterList.length,
              itemBuilder: (context, index) {
                final dayLog = _cubit.pageVariables.filterList[index];

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TimelineTile(
                      alignment: TimelineAlign.end,
                      afterLineStyle: const LineStyle(
                        color: AppColors.primaryColor,
                      ),
                      beforeLineStyle: const LineStyle(
                        color: Colors.red,
                      ),
                      isFirst: index == 0,
                      isLast:
                          index == _cubit.pageVariables.filterList.length - 1,
                      indicatorStyle: IndicatorStyle(
                        width: 65.scaleIconsSize,
                        height: 65.scaleIconsSize,
                        padding: const EdgeInsets.all(8),
                        indicatorXY: 0.00,
                        indicator: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: (index & 1 == 0)
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            children: [
                              AppText(
                                "${_prepareDateDay(dayLog)}",
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              AppText(
                                "${_prepareDateMonth(dayLog)}",
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      startChild: dayLog.changesData?.isEmpty == true
                          ? SizedBox.shrink()
                          : CardClientLog(log: dayLog),
                    ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _prepareDateDay(ClientLogModel dayLog) {
    final date = DateTime.tryParse(dayLog.actionDate ?? '');
    if (date != null) {
      return DateFormat('dd').format(date);
    }
    return '';
  }

  String _prepareDateMonth(ClientLogModel dayLog) {
    final date = DateTime.tryParse(dayLog.actionDate ?? '');
    if (date != null) {
      return DateFormat('MMM').format(date);
    }
    return '';
  }
}
