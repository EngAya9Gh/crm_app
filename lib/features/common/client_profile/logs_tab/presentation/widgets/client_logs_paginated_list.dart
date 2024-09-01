import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_log_model.dart';
import '../manager/client_logs_cubit/client_logs_tab_cubit.dart';

class ClientLogsPaginatedList extends StatelessWidget {
  const ClientLogsPaginatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<ClientLogsTabCubit>();
    return BlocBuilder<ClientLogsTabCubit, ClientLogsTabState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            Example8Vertical(dayLogs: _cubit.pageVariables.allList),
          ],
        );
      },
    );
  }
}

class Example8Vertical extends StatelessWidget {
  const Example8Vertical({
    super.key,
    required this.dayLogs,
  });

  final List<ClientDayLogsModel> dayLogs;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: dayLogs.length,
      itemBuilder: (context, index) {
        final dayLog = dayLogs[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TimelineTile(
              alignment: TimelineAlign.end,
              isFirst: index == 0,
              isLast: index == dayLogs.length - 1,
              indicatorStyle: IndicatorStyle(
                width: 100,
                height: 60,
                padding: const EdgeInsets.all(8),
                indicator: Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: [
                      AppText(dayLog.date.split('-')[1]),
                      AppText(_convertMonthNumberIntoString(dayLog.date)),
                    ],
                  ),
                ),
              ),
              startChild: _Child(
                logs: dayLog.logs,
              ),
            ),
          ],
        );
      },
    );
  }

  _convertMonthNumberIntoString(String date) {
    int month = int.parse(date.split('-')[1]);
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return '';
    }
  }
}

class _Child extends StatelessWidget {
  const _Child({
    required this.logs,
  });

  final List<ClientLogModel> logs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          logs.length,
          (index) {
            final item = logs[index];
            return AppCardContainer(
              child: Column(
                children: [
                  SizedBox(width: double.infinity),
                  AppText("${item.date}"),
                  AppText("${item.log}"),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
