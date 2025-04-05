import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/home/data/repositories/pending_approvals_repository_impl.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart' as typform;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../../../features/notifications/presentation/manager/notifications_cubit.dart';
import '../../../../core/common/extensions/build_context.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../ui/widgets/custom_widget/customDrawer.dart';
import '../../../../ui/widgets/custom_widget/home_app_bar.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../widgets/adaptive_body.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../manager/search_cubit.dart';
import '../../../../core/common/models/search_client_model.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/config/navigator/app_routes_names.dart';
import '../../../../ui/screen/client/client_profile.dart';
import '../../../../features/ai_chat/presentation/pages/ai_chat_page.dart';
import '../../../../core/services/api/api_services.dart';
import 'package:get_it/get_it.dart';

/// Modelo para estadísticas de la página de inicio
class HomeStatisticsModel {
  final int projects;
  final int clients;
  final int tasks;
  final double income;
  final double expenses;
  final double profit;
  final double openTasksProgress;
  final double openTicketsProgress;
  final String openTasksLabel;
  final String openTicketsLabel;

  HomeStatisticsModel({
    this.projects = 0,
    this.clients = 0,
    this.tasks = 0,
    this.income = 0.0,
    this.expenses = 0.0,
    this.profit = 0.0,
    this.openTasksProgress = 0.5,
    this.openTicketsProgress = 0.15,
    this.openTasksLabel = '0/0',
    this.openTicketsLabel = '0/0',
  });

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) {
    return HomeStatisticsModel(
      projects: json['projects'] ?? 0,
      clients: json['clients'] ?? 0,
      tasks: json['tasks'] ?? 0,
      income: double.tryParse('${json['income']}') ?? 0.0,
      expenses: double.tryParse('${json['expenses']}') ?? 0.0,
      profit: double.tryParse('${json['profit']}') ?? 0.0,
      openTasksProgress:
          double.tryParse('${json['open_tasks_progress']}') ?? 0.5,
      openTicketsProgress:
          double.tryParse('${json['open_tickets_progress']}') ?? 0.15,
      openTasksLabel: json['open_tasks_label'] ?? '0/0',
      openTicketsLabel: json['open_tickets_label'] ?? '0/0',
    );
  }

  factory HomeStatisticsModel.mock() {
    return HomeStatisticsModel(
      projects: 12,
      clients: 45,
      tasks: 23,
      income: 25000,
      expenses: 15000,
      profit: 10000,
      openTasksProgress: 0.66,
      openTicketsProgress: 0.15,
      openTasksLabel: '2/3',
      openTicketsLabel: '-166/29',
    );
  }
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
  HomeStatisticsModel _statistics = HomeStatisticsModel.mock();
  bool _isLoadingStatistics = true;
  late ApiServices _apiServices;

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
        // context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        // Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        // Provider.of<RegionProvider>(context, listen: false).getRegions(),
        // Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        // Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
      //_fetchPendingApprovals();
    });

    // Inicializar API y cargar estadísticas
    _apiServices = GetIt.instance<ApiServices>();
    _fetchHomeStatistics();
    // _fetchPendingApprovals();
  }

  // Método para obtener estadísticas
  Future<void> _fetchHomeStatistics() async {
    setState(() {
      _isLoadingStatistics = true;
    });

    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: EndPoints.statistics);
      setState(() {
        _statistics = HomeStatisticsModel.fromJson(response['data']);
        _isLoadingStatistics = false;
      });
    } catch (e) {
      print('Error fetching home statistics: $e');
      setState(() {
        _statistics = HomeStatisticsModel.mock();
        _isLoadingStatistics = false;
      });
    }
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

  // // Aprobar un usuario
  // Future<void> _approveUser(String userId) async {
  //   setState(() {
  //     _isLoadingApprovals = true;
  //   });

  //   try {
  //     final success = await _approvalsRepository.approveUser(userId);

  //     if (success && mounted) {
  //       // Recargar la lista después de la aprobación
  //       _fetchPendingApprovals();
  //     } else if (mounted) {
  //       setState(() {
  //         _isLoadingApprovals = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error al aprobar usuario')),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error approving user: $e');
  //     if (mounted) {
  //       setState(() {
  //         _isLoadingApprovals = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error al aprobar usuario')),
  //       );
  //     }
  //   }
  // }

  // // Rechazar un usuario
  // Future<void> _rejectUser(String userId) async {
  //   setState(() {
  //     _isLoadingApprovals = true;
  //   });

  //   try {
  //     final success = await _approvalsRepository.rejectUser(userId);

  //     if (success && mounted) {
  //       // Recargar la lista después del rechazo
  //       _fetchPendingApprovals();
  //     } else if (mounted) {
  //       setState(() {
  //         _isLoadingApprovals = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error al rechazar usuario')),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error rejecting user: $e');
  //     if (mounted) {
  //       setState(() {
  //         _isLoadingApprovals = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error al rechazar usuario')),
  //       );
  //     }
  //   }
  // }

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 45),
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
                              builder: (context, controller, focusNode) =>
                                  TextField(
                                controller: controller,
                                focusNode: focusNode,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  hintTextDirection: TextDirection.rtl,
                                  hintText:
                                      'ابحث عن اسم المؤسسة, رقم الجوال...',
                                  hintStyle: TextStyle(
                                    fontSize: 12.scaleFontSize,
                                    color: Colors.grey.shade500,
                                  ),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10).r,
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                              decorationBuilder: (context, child) => Material(
                                type: MaterialType.card,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: child,
                              ),
                              itemBuilder: (context, suggestion) =>
                                  Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  title:
                                      AppText(suggestion.nameEnterprise ?? ''),
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
                                _searchController.text = suggestion.name ?? '';

                                AppNavigator.go(
                                  ClientProfile(
                                    idClient: suggestion.idClients,
                                    tabIndex: 0,
                                  ),
                                  name: AppRoutesNames
                                      .clientProfile.inClientsList,
                                  pathParameters: {
                                    'idClient': suggestion.idClients.toString()
                                  },
                                );
                              },
                              suggestionsCallback: (pattern) async {
                                if (pattern.isEmpty) return [];
                                final results =
                                    await _searchCubit.searchClients(pattern);
                                return results;
                              },
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                    if (_pendingApprovals.length > 1)
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
                            '+${_pendingApprovals.length - 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.scaleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
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
                            child: Icon(Icons.person,
                                color: Colors.grey[600], size: 18),
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
    return _isLoadingStatistics
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem('Projects',
                            _statistics.projects.toString(), Icons.work)),
                    SizedBox(width: 16),
                    Expanded(
                        child: _buildStatItem('Clients',
                            _statistics.clients.toString(), Icons.people)),
                    SizedBox(width: 16),
                    Expanded(
                        child: _buildStatItem(
                            'Task', _statistics.tasks.toString(), Icons.task)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem('Income',
                            _statistics.income.toString(), Icons.trending_up)),
                    SizedBox(width: 16),
                    Expanded(
                        child: _buildStatItem(
                            'Expense',
                            _statistics.expenses.toString(),
                            Icons.trending_down)),
                    SizedBox(width: 16),
                    Expanded(
                        child: _buildStatItem(
                            'Profit',
                            _statistics.profit.toString(),
                            Icons.account_balance)),
                  ],
                ),
              ],
            ),
          );
  }

  Widget _buildStatItem(String title, String value, IconData icon) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.primaryMain),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
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
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildProgressBar(
            'Open Tasks',
            _statistics.openTasksProgress,
            Colors.orange,
            _statistics.openTasksLabel,
          ),
          SizedBox(height: 12),
          _buildProgressBar(
            'Open Ticket',
            _statistics.openTicketsProgress,
            Colors.green,
            _statistics.openTicketsLabel,
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }

  Widget _buildProgressBar(
      String title, double value, Color color, String label) {
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
