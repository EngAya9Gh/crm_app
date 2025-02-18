import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_users_report_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/app_paginated_list.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../ui/widgets/custom_widget/card_expansion.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/common/widgets/data_table/app_data_table.dart';
import '../../../../core/common/widgets/data_table/app_data_table_cell.dart';
import '../../../../core/common/widgets/data_table/app_data_table_column.dart';
import '../../../../core/common/widgets/shimmer_widget.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/end_points.dart';
import '../../../app/presentation/widgets/app_text.dart';

class TaskUsersReportsPage extends StatefulWidget {
  const TaskUsersReportsPage({super.key});

  @override
  State<TaskUsersReportsPage> createState() => TaskUsersReportsPageState();
}

class TaskUsersReportsPageState extends State<TaskUsersReportsPage> {
  late final TaskCubit _cubit;
  GetUsersReportsParams params = GetUsersReportsParams(page: 1);
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _cubit = context.read<TaskCubit>()..getUserTaskReports(params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تقارير الموظفين'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    searchController: searchController,
                    onChanged: (value) {
                      AppConstants.debounceFunction(
                        () {
                          params = params.copyWith(filter: value, page: 1);
                          _cubit.getUserTaskReports(params);
                        },
                        tag: "search_user_task_report",
                        isDebounced: true,
                      );
                    },
                  ),
                ),
                // CustomFilterIcon(
                //   onTap: () async {
                //     // await AppBottomSheet.show(
                //     //   context: context,
                //     //   child: FilterClientDeptSheet(),
                //     // );
                //   },
                // ),
                8.width,
              ],
            ),
            10.height,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('عدد العناصر: '),
                    BlocBuilder<TaskCubit, TaskState>(
                      builder: (context, state) {
                        return ((state.getUsersTaskReports.data ?? []).isEmpty)
                            ? SizedBox.shrink()
                            : AppText('${state.getUsersTaskReports.data?.length ?? ''}/${state.totalUserReportCount}');
                      },
                    ),
                  ],
                )),
            10.height,
            BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) => state.getUsersTaskReports.when(success: (data) => Expanded(
                child: AppDataTable(
                  scrollControllerForPagination: _scrollController,
                  loadingRow: DataRow(
                    cells: <DataCell>[
                      AppDataTableCell(
                        customCellBody: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ShimmerWidget.circular(width: 20, height: 20), SizedBox(width: 8), Expanded(child: ShimmerWidget.rectangular(height: 20))],
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      AppDataTableCell(
                        customCellBody: ShimmerWidget.rectangular(height: 20),
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      AppDataTableCell(
                        customCellBody: ShimmerWidget.rectangular(height: 20),
                        alignment: Alignment.center,
                      ),
                      AppDataTableCell(
                        customCellBody: ShimmerWidget.rectangular(height: 20),
                        alignment: Alignment.center,
                      ),
                      AppDataTableCell(
                        width: MediaQuery.of(context).size.width * 0.1,
                        customCellBody: ShimmerWidget.rectangular(height: 20),

                        alignment: Alignment.center,
                      ),
                      AppDataTableCell(
                        width: MediaQuery.of(context).size.width * 0.1,
                        customCellBody: ShimmerWidget.rectangular(height: 20),
                        alignment: Alignment.center,
                      ),
                      AppDataTableCell(
                        width: MediaQuery.of(context).size.width * 0.1,
                        customCellBody: ShimmerWidget.rectangular(height: 20,width: 20),
                        alignment: Alignment.center,
                      ),
                      AppDataTableCell(
                        width: MediaQuery.of(context).size.width * 0.1,
                        customCellBody: ShimmerWidget.rectangular(height: 20,width: 20),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  columns: <DataColumn>[
                    AppDataTableColumn('الموظف'),
                    AppDataTableColumn('المهام\nالكلية'),
                    AppDataTableColumn('المهام\nالمفتوحة'),
                    AppDataTableColumn('المهام\nالمتسلمة'),
                    AppDataTableColumn('المهمام\nالمكتملة'),
                    AppDataTableColumn('المهام\nالمقيمة'),
                    AppDataTableColumn('متوسط\nالتقيم'),
                    AppDataTableColumn('متوسط\nالوقت المستغرق'),
                  ],
                  hasReachedEnd: state.hasGetAllReports,
                  isLoading: state.getUsersTaskReportsStatus.isLoading(),
                  onLoadMore: () {
                    if (state.hasGetAllReports || state.getUsersTaskReportsStatus.isLoading()) {
                      return;
                    }
                    _cubit.getUserTaskReports(
                      params.copyWith(page: params.page + 1),
                          () {
                        params = params.copyWith(page: params.page + 1);
                      },
                    );
                  },
                  rows: (data ?? []).map((item) {
                    return DataRow(
                      cells: <DataCell>[
                        AppDataTableCell(
                          customCellBody: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                child: CircleAvatar(
                                  backgroundImage: item.imgImage != null ? NetworkImage( item.imgImage!) : null,
                                  child: item.imgImage == null
                                      ? Center(
                                    child: AppText(item.nameUser?.substring(0, 2).toUpperCase(), color: Colors.white, fontSize: 12),
                                  )
                                      : null,
                                  radius: 14.scaleWidth,
                                ),
                              ),
                              SizedBox(width: 8),
                              AppText(item.nameUser, color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 12)
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        AppDataTableCell(
                          value: '${item.tasksCount ?? ''}',
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        AppDataTableCell(
                          value: '${item.taskOpenedCount ?? ''}',
                          alignment: Alignment.center,
                        ),
                        AppDataTableCell(
                          value: '${item.taskReceivedCount ?? ''}',
                          alignment: Alignment.center,
                        ),
                        AppDataTableCell(
                          width: MediaQuery.of(context).size.width * 0.1,
                          value: '${item.taskCompletedCount ?? ''}',
                          alignment: Alignment.center,
                        ),
                        AppDataTableCell(
                          width: MediaQuery.of(context).size.width * 0.1,
                          value: '${item.taskEvaluatedCount ?? ''}',
                          alignment: Alignment.center,
                        ),
                        AppDataTableCell(
                          width: MediaQuery.of(context).size.width * 0.1,
                          value: '${item.averageRate ?? ''}',
                          alignment: Alignment.center,
                        ),
                        AppDataTableCell(
                          width: MediaQuery.of(context).size.width * 0.1,
                          value: '${item.averageTimeTaken ?? ''}',
                          alignment: Alignment.center,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ), failure:(error, data) =>  AppErrorWidget(
                message: error,
                onPressed: () => _cubit.getUserTaskReports(params),
              )),
              // builder: (context, state) => AppPaginatedList(
              //   items: state.getUsersTaskReports.data ?? [],
              //   hasReachedEnd: state.hasGetAllReports,
              //   isLoading: state.getUsersTaskReportsStatus.isLoading(),
              //   onLoadMore: () {
              //     if (state.hasGetAllReports || state.getUsersTaskReportsStatus.isLoading()) {
              //       return;
              //     }
              //     _cubit.getUserTaskReports(
              //       params.copyWith(page: params.page + 1),
              //       () {
              //         params = params.copyWith(page: params.page + 1);
              //       },
              //     );
              //   },
              //   itemBuilder: (context, index) {
              //     return buildcardExpansion(
              //         '',
              //         '',
              //         Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 10),
              //           child: Column(
              //             children: [
              //               CardRow(title: 'عدد المهام المفتوحة', value: state.getUsersTaskReports.data?[index].taskOpenedCount),
              //               CardRow(title: 'عدد المهام المتسلمة', value: state.getUsersTaskReports.data?[index].taskReceivedCount),
              //               CardRow(title: 'عدد المهام المكتملة', value: state.getUsersTaskReports.data?[index].taskCompletedCount),
              //               CardRow(title: 'عدد المهام التي تم تقيمها', value: state.getUsersTaskReports.data?[index].taskEvaluatedCount),
              //               CardRow(title: 'متوسط التقييم', value: state.getUsersTaskReports.data?[index].averageRate),
              //               CardRow(
              //                 title: 'متوسط الوقت المستغرق',
              //                 value: state.getUsersTaskReports.data?[index].averageTimeTaken?.toStringAsFixed(2),
              //                 withDivider: false,
              //               ),
              //             ],
              //           ),
              //         ),
              //         subTitleWidget: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             AppText('عدد المهام الكلية', color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 12),
              //             AppText(state.getUsersTaskReports.data?[index].tasksCount, color: AppColors.primaryMain, fontSize: 12),
              //           ],
              //         ),
              //         titleWidget: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               decoration: BoxDecoration(shape: BoxShape.circle),
              //               child: CircleAvatar(
              //                 backgroundImage: state.getUsersTaskReports.data?[index].imgImage != null
              //                     ? NetworkImage(EndPoints.baseUrls.laravelFilesUrl + state.getUsersTaskReports.data![index].imgImage!)
              //                     : null,
              //                 child: state.getUsersTaskReports.data?[index].imgImage == null
              //                     ? Center(
              //                         child: AppText(state.getUsersTaskReports.data?[index].nameUser?.substring(0, 2).toUpperCase(),
              //                             color: Colors.white, fontSize: 12),
              //                       )
              //                     : null,
              //                 radius: 14.scaleWidth,
              //               ),
              //             ),
              //             SizedBox(width: 8),
              //             AppText(state.getUsersTaskReports.data?[index].nameUser,
              //                 color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 12)
              //           ],
              //         ));
              //   },
              //   separatorBuilder: (_, __) => const SizedBox.shrink(),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
