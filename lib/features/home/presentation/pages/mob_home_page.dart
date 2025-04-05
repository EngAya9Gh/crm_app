import 'package:crm_smart/core/common/extensions/num_extensions.dart';
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
  List<dynamic> _pendingApprovals = [];
  bool _isLoadingApprovals = false;
  late final PendingApprovalsRepository _approvalsRepository;

  @override
  void initState() {
    super.initState();
    _searchCubit = context.read<SearchCubit>();
    // Inicializar el repositorio
    final ApiServices apiServices = context.read<ApiServices>();
    _approvalsRepository = PendingApprovalsRepositoryImpl(apiServices);

    context.read<NotificationsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        // context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        // Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        // Provider.of<RegionProvider>(context, listen: false).getRegions(),
        // Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        // Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
      _fetchPendingApprovals();
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

  // Aprobar un usuario
  Future<void> _approveUser(String userId) async {
    setState(() {
      _isLoadingApprovals = true;
    });

    try {
      final success = await _approvalsRepository.approveUser(userId);

      if (success && mounted) {
        // Recargar la lista después de la aprobación
        _fetchPendingApprovals();
      } else if (mounted) {
        setState(() {
          _isLoadingApprovals = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al aprobar usuario')),
        );
      }
    } catch (e) {
      print('Error approving user: $e');
      if (mounted) {
        setState(() {
          _isLoadingApprovals = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al aprobar usuario')),
        );
      }
    }
  }

  // Rechazar un usuario
  Future<void> _rejectUser(String userId) async {
    setState(() {
      _isLoadingApprovals = true;
    });

    try {
      final success = await _approvalsRepository.rejectUser(userId);

      if (success && mounted) {
        // Recargar la lista después del rechazo
        _fetchPendingApprovals();
      } else if (mounted) {
        setState(() {
          _isLoadingApprovals = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al rechazar usuario')),
        );
      }
    } catch (e) {
      print('Error rejecting user: $e');
      if (mounted) {
        setState(() {
          _isLoadingApprovals = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al rechazar usuario')),
        );
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
        setState(() {
          _isApprovalExpanded = !_isApprovalExpanded;
        });
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
                AppText(
                  '${_pendingApprovals.length} users',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.scaleFontSize,
                  ),
                ),
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check_circle,
                                    color: Colors.green),
                                onPressed: () => _approveUser(user['id']),
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel, color: Colors.red),
                                onPressed: () => _rejectUser(user['id']),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
            SizedBox(height: 8),
            Center(
              child: Icon(
                _isApprovalExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildStatItem('Projects', '1', Icons.work)),
              SizedBox(width: 16),
              Expanded(child: _buildStatItem('Clients', '2', Icons.people)),
              SizedBox(width: 16),
              Expanded(child: _buildStatItem('Task', '13', Icons.task)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                  child: _buildStatItem('Income', '00', Icons.trending_up)),
              SizedBox(width: 16),
              Expanded(
                  child: _buildStatItem('Expense', '00', Icons.trending_down)),
              SizedBox(width: 16),
              Expanded(
                  child: _buildStatItem('Profit', '00', Icons.account_balance)),
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
            Provider.of<UserProvider>(context, listen: true)
                .currentUser
                .noOfOpenTasks!
                .dg, // 0.66, // 2/3
            Colors.orange,
            '2/3',
          ),
          SizedBox(height: 12),
          _buildProgressBar(
            'Days Left',
            0.15, // Approximate for -166/29
            Colors.green,
            '-166/29',
          ),
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
