import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/home/domain/repositories/pending_approvals_repository.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart' as typform;
import '../../../../features/notifications/presentation/manager/notifications_cubit.dart';
import '../../../../core/common/extensions/build_context.dart';

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../ui/widgets/custom_widget/customDrawer.dart';
import '../../../../ui/widgets/custom_widget/home_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../manager/search_cubit.dart';
import '../../../../core/common/models/search_client_model.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/config/navigator/app_routes_names.dart';
import '../../../../ui/screen/client/client_profile.dart';
import '../../../../features/ai_chat/presentation/pages/ai_chat_page.dart';
import 'package:intl/intl.dart' as intl;

var formatter = intl.NumberFormat("#,##0.00", "ar_SA");

/// Modelo para estadísticas de la página de inicio// To parse this JSON data, do
//
//     final homeStatisticsModel = homeStatisticsModelFromJson(jsonString);

class HomeStatisticsModel {
  final num? dailyClients;
  final num? notDoneVisits;
  final num? dailyNotDoneVisits;
  final num? tasks;
  final num? dailySales;
  final num? monthlySales;
  final num? monthlyWithdrawLosses;
  final num? monthlyNoWithdraw;
  final num? openTasksProgress;
  final num? openTicketsProgress;
  final num? notDoneVisitsProgress;
  final String? notDoneVisitsLabel;
  final String? openTasksLabel;
  final String? openTicketsLabel;
  final num? approveCount;

  HomeStatisticsModel({
    this.dailyClients,
    this.notDoneVisits,
    this.dailyNotDoneVisits,
    this.tasks,
    this.dailySales,
    this.monthlySales,
    this.monthlyWithdrawLosses,
    this.monthlyNoWithdraw,
    this.openTasksProgress,
    this.openTicketsProgress,
    this.notDoneVisitsProgress,
    this.notDoneVisitsLabel,
    this.openTasksLabel,
    this.openTicketsLabel,
    this.approveCount,
  });

  HomeStatisticsModel copyWith({
    num? dailyClients,
    num? notDoneVisits,
    num? dailyNotDoneVisits,
    num? tasks,
    num? dailySales,
    num? monthlySales,
    num? monthlyWithdrawLosses,
    num? monthlyNoWithdraw,
    num? openTasksProgress,
    num? openTicketsProgress,
    num? notDoneVisitsProgress,
    String? notDoneVisitsLabel,
    String? openTasksLabel,
    String? openTicketsLabel,
    num? approveCount,
  }) =>
      HomeStatisticsModel(
        dailyClients: dailyClients ?? this.dailyClients,
        notDoneVisits: notDoneVisits ?? this.notDoneVisits,
        dailyNotDoneVisits: dailyNotDoneVisits ?? this.dailyNotDoneVisits,
        tasks: tasks ?? this.tasks,
        dailySales: dailySales ?? this.dailySales,
        monthlySales: monthlySales ?? this.monthlySales,
        monthlyWithdrawLosses: monthlyWithdrawLosses ?? this.monthlyWithdrawLosses,
        monthlyNoWithdraw: monthlyNoWithdraw ?? this.monthlyNoWithdraw,
        openTasksProgress: openTasksProgress ?? this.openTasksProgress,
        openTicketsProgress: openTicketsProgress ?? this.openTicketsProgress,
        notDoneVisitsProgress: notDoneVisitsProgress ?? this.notDoneVisitsProgress,
        notDoneVisitsLabel: notDoneVisitsLabel ?? this.notDoneVisitsLabel,
        openTasksLabel: openTasksLabel ?? this.openTasksLabel,
        openTicketsLabel: openTicketsLabel ?? this.openTicketsLabel,
        approveCount: approveCount ?? this.approveCount,
      );

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) => HomeStatisticsModel(
        dailyClients: json["daily_clients"],
        notDoneVisits: json["not_done_visits"],
        dailyNotDoneVisits: json["daily_not_done_visits"],
        tasks: json["tasks"],
        dailySales: json["daily_sales"],
        monthlySales: json["monthly_sales"]?.toDouble(),
        monthlyWithdrawLosses: json["monthly_withdraw_losses"],
        monthlyNoWithdraw: json["monthly_no_withdraw"],
        openTasksProgress: json["open_tasks_progress"]?.toDouble(),
        openTicketsProgress: json["open_tickets_progress"]?.toDouble(),
        notDoneVisitsProgress: json["not_done_visits_progress"],
        notDoneVisitsLabel: json["not_done_visits_label"],
        openTasksLabel: json["open_tasks_label"],
        openTicketsLabel: json["open_tickets_label"],
        approveCount: json["approve_count"],
      );

  Map<String, dynamic> toJson() => {
        "daily_clients": dailyClients,
        "not_done_visits": notDoneVisits,
        "daily_not_done_visits": dailyNotDoneVisits,
        "tasks": tasks,
        "daily_sales": dailySales,
        "monthly_sales": monthlySales,
        "monthly_withdraw_losses": monthlyWithdrawLosses,
        "monthly_no_withdraw": monthlyNoWithdraw,
        "open_tasks_progress": openTasksProgress,
        "open_tickets_progress": openTicketsProgress,
        "not_done_visits_progress": notDoneVisitsProgress,
        "not_done_visits_label": notDoneVisitsLabel,
        "open_tasks_label": openTasksLabel,
        "open_tickets_label": openTicketsLabel,
        "approve_count": approveCount,
      };
}

class MobHomePage extends StatefulWidget {
  MobHomePage({Key? key}) : super(key: key);

  @override
  _MobHomePageState createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final SearchCubit _searchCubit;
  final TextEditingController _searchController = TextEditingController();
  bool _isApprovalExpanded = false;
  List<dynamic> _pendingApprovals = [1, 2, 3];
  bool _isLoadingApprovals = false;
  late final PendingApprovalsRepository _approvalsRepository;

  // Añadir propiedades para estadísticas

  @override
  void initState() {
    super.initState();
    _searchCubit = context.read<SearchCubit>();
    // Inicializar el repositorio
    // final ApiServices apiServices = context.read<ApiServices>();
    // _approvalsRepository = PendingApprovalsRepositoryImpl(apiServices);

    context.read<NotificationsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        _searchCubit.getHomeStatistics(),
        // context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        // Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        // Provider.of<RegionProvider>(context, listen: false).getRegions(),
        // Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        // Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
      //_fetchPendingApprovals();
    });
  }

  // Usar el repositorio para obtener los datos
  Future<void> _fetchPendingApprovals() async {
    if (mounted) {
      setState(() {
        _isLoadingApprovals = true;
      });

      try {
        final approvals = await _approvalsRepository.getPendingApprovals();

        if (mounted) {
          setState(() {
            _pendingApprovals = approvals;
            _isLoadingApprovals = false;
          });
        }
      } catch (e) {
        print('Error in _fetchPendingApprovals: $e');
        if (mounted) {
          setState(() {
            _isLoadingApprovals = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _searchCubit,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AppScaffold(
          scaffoldKey: _scaffoldKey,
          appBar: HomeAppBar(
            backgroundColor: Colors.grey.withOpacity(0.1),
            leading: IconButton(
              icon: AppIcon(
                Icons.menu,
                color: context.colorScheme.onSurface,
              ),
              tooltip: 'Menu',
              onPressed: () {
                FocusScope.of(context).unfocus();
                _scaffoldKey.currentState?.openDrawer();
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          drawer: CustomDrawer(),
          body: Stack(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                        decoration: BoxDecoration(
                          color: AppColors.primaryMain,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            typform.TypeAheadField<SearchClientModel>(
                              direction: VerticalDirection.down,
                              controller: _searchController,
                              builder: (context, controller, focusNode) => TextField(
                                controller: controller,
                                focusNode: focusNode,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  hintTextDirection: TextDirection.rtl,
                                  hintText: 'ابحث عن اسم المؤسسة, رقم الجوال...',
                                  hintStyle: TextStyle(
                                    fontSize: 12.scaleFontSize,
                                    color: Colors.grey.shade500,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                              decorationBuilder: (context, child) => Material(
                                type: MaterialType.card,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: child,
                              ),
                              itemBuilder: (context, suggestion) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  title: AppText(suggestion.nameEnterprise ?? ''),
                                  subtitle: AppText(suggestion.phone ?? ''),
                                ),
                              ),
                              debounceDuration: Duration(milliseconds: 1000),
                              hideOnSelect: true,
                              hideOnUnfocus: true,
                              showOnFocus: true,
                              hideKeyboardOnDrag: true,
                              hideWithKeyboard: false,
                              retainOnLoading: false,
                              hideOnLoading: false,
                              hideOnEmpty: false,
                              onSelected: (suggestion) {
                                _searchController.text = suggestion.nameEnterprise ?? '';

                                AppNavigator.go(
                                  ClientProfile(
                                    idClient: suggestion.idClients,
                                    tabIndex: 0,
                                  ),
                                  name: AppRoutesNames.clientProfile.inClientsList,
                                  pathParameters: {'idClient': suggestion.idClients.toString()},
                                );
                                FocusScope.of(context).unfocus();
                              },
                              suggestionsCallback: (pattern) async {
                                if (pattern.isEmpty) return [];
                                final results = await _searchCubit.searchClients(pattern);
                                return results;
                              },
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      //  if (context.read<PrivilegesCubit>().checkPrivilege("40"))
                      _buildApprovalSection(),
                      _buildStatisticsSection(),
                      _buildProgressSection(),
                    ],
                  ),
                ),
              ),
              const AIChatPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApprovalSection() {
    return GestureDetector(
      onTap: () {
        if (context.read<PrivilegesCubit>().checkPrivilege("40"))
          AppNavigator.go(
            PendingInvoicesPage(),
            name: AppRoutesNames.clientDashboard.inPendingInvoices,
          );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Waiting for approval',
                  style: TextStyle(
                    fontSize: 16.scaleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // AppText(
                //   '${_pendingApprovals.length} users',
                //   style: TextStyle(
                //     color: Colors.grey,
                //     fontSize: 14.scaleFontSize,
                //   ),
                // ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[300],
                          child: Icon(Icons.person, color: Colors.grey[600]),
                        ),
                        if (state.homeStatistics.data?.approveCount != null)
                          Positioned(
                            top: -5,
                            right: -5,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryMain,
                                shape: BoxShape.circle,
                              ),
                              child: AppText(
                                '+${state.homeStatistics.data?.approveCount.toString()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.scaleFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                )
              ],
            ),
            if (_isApprovalExpanded) ...[
              SizedBox(height: 16),
              _isLoadingApprovals
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _pendingApprovals.length,
                      itemBuilder: (context, index) {
                        final user = _pendingApprovals[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          leading: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey[300],
                            child: Icon(Icons.person, color: Colors.grey[600], size: 18),
                          ),
                          title: AppText(
                            user['name'] ?? 'Unknown User',
                            style: TextStyle(
                              fontSize: 14.scaleFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: AppText(
                            'Pending since ${user['date'] ?? 'N/A'}',
                            style: TextStyle(
                              fontSize: 12.scaleFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
            ],
            SizedBox(height: 8),
            // Center(
            //   child: Icon(
            //     _isApprovalExpanded ? Icons.expand_less : Icons.expand_more,
            //     color: Colors.grey,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return state.homeStatistics.when(
        success: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('ToDo :'),
                Divider(),
                Row(
                  children: [
                    Expanded(child: _buildStatItem('visit', data?.notDoneVisits, Icons.work)),
                    16.width,
                    Expanded(child: _buildStatItem('task', data?.tasks, Icons.task)),
                  ],
                ),
                16.height,
                AppText('Daily :'),
                Divider(),
                Row(
                  children: [
                    Expanded(child: _buildStatItem("Client", data?.dailyClients, Icons.work)),
                    16.width,
                    Expanded(child: _buildStatItem('Income', data?.dailySales, Icons.task)),
                  ],
                ),
                16.height,
                AppText('Monthly :'),
                Divider(),
                Row(
                  children: [
                    Expanded(child: _buildStatItem('No.Loss', data?.monthlyNoWithdraw, Icons.work)),
                    16.width,
                    Expanded(child: _buildStatItem('Loss', data?.monthlyWithdrawLosses, Icons.work)),
                    16.width,
                    Expanded(child: _buildStatItem('Income', data?.monthlySales, Icons.task)),
                  ],
                ),
                16.height,
                // Row(
                //   children: [
                //     Expanded(child: _buildStatItem('Income', data?.income, Icons.trending_up)),
                //     SizedBox(width: 16),
                //     Expanded(child: _buildStatItem('Expense', data?.expenses, Icons.trending_down)),
                //     SizedBox(width: 16),
                //     Expanded(child: _buildStatItem('Profit', data?.profit, Icons.account_balance)),
                //   ],
                // ),
              ],
            ),
          );
        },
        failure: (error, data) => AppErrorWidget(
          message: error,
          onPressed: () => _searchCubit.getHomeStatistics(),
        ),
      );
    });
  }

  Widget _buildStatItem(String title, dynamic value, IconData icon) {
    return Container(
      height: 135.scaleHeight,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.primaryMain),
          SizedBox(height: 8),
          AppText(
            textAlign: TextAlign.center,
            formatter.format(value),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          AppText(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildProgressBar(
                'Open Tasks',
                (state.homeStatistics.data?.openTasksProgress ?? 0).toDouble(),
                Colors.orange,
                state.homeStatistics.data?.openTasksLabel ?? '',
              ),
              SizedBox(height: 12),
              _buildProgressBar(
                'Open Ticket',
                (state.homeStatistics.data?.openTicketsProgress ?? 0).toDouble(),
                Colors.green,
                state.homeStatistics.data?.openTicketsLabel ?? '',
              ),
              SizedBox(
                height: 12,
              ),
              _buildProgressBar(
                'Open visit',
                (state.homeStatistics.data?.notDoneVisitsProgress ?? 0).toDouble(),
                Colors.green,
                state.homeStatistics.data?.notDoneVisitsLabel ?? '',
              ),
              75.height,
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressBar(String title, double value, Color color, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
