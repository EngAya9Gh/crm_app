import 'package:collection/collection.dart';
import 'package:crm_smart/features/common/client_profile/tasks_tab/domain/use_cases/get_client_tasks_usecase.dart';
import 'package:crm_smart/features/common/client_profile/tasks_tab/presentation/manager/client_task_bloc.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../widgets/card_client_task.dart';

class ClientTasksTabPage extends StatefulWidget {
  const ClientTasksTabPage({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  State<ClientTasksTabPage> createState() => _ClientTasksTabPageState();
}

class _ClientTasksTabPageState extends State<ClientTasksTabPage> {
  late final ClientTaskBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<ClientTaskBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _bloc.add(GetClientTasksEvent(params: GetClientTasksParams(idClient: widget.client.idClients!)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<ClientTaskBloc, ClientTaskState>(
        builder: (context, state) => state.listClientTasks.when(
          success: (data) {
            /// grouped data by time create task
            Map<String, List<TaskModel>> groupedItems = groupBy(
              data ?? [],
              (p0) => DateFormat('yyyy MMM').format(p0.createdAt!),
            );
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText('عدد المهام: '),
                      BlocBuilder<ClientTaskBloc, ClientTaskState>(
                        builder: (context, state) {
                          return AppText('${state.listClientTasks.data?.length}/${state.totalCount}');
                        },
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: groupedItems.values.length,
                    itemBuilder: (context, index) => TimelineTile(
                      isFirst: index == 0,
                      isLast: index == (groupedItems.values.length - 1),
                      alignment: TimelineAlign.end,
                      indicatorStyle: IndicatorStyle(
                        width: 50,
                        // color: Colors.blue,
                        height: 100,
                        iconStyle: IconStyle(
                          iconData: Icons.circle,
                          color: Colors.black,
                        ),
                        indicatorXY: 0.00,
                        indicator: Container(
                          height: 150,
                          width: 50,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              width: 45,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue, width: 1),
                                // borderRadius: BorderRadius.circular(15.sp),
                              ),
                              child: FittedBox(
                                child: Text(
                                  '${groupedItems.keys.elementAt(index)}',
                                  style: Theme.of(context).textTheme.titleSmall!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      beforeLineStyle: LineStyle(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      afterLineStyle: LineStyle(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      ///iterate on list of values and get element at index to take it's list task model
                      startChild: Column(
                        children: groupedItems.values.elementAt(index).map((e) => ClientTaskCard(task: e)).toList(),
                      ),
                    ),
                  ))
                ],
              ),
            );
          },
          failure: (error, data) => AppErrorWidget(message: error),
        ),
      ),
    );
  }
}
