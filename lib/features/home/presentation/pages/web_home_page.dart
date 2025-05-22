import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/home/domain/models/favorite_screen_model.dart';
import 'package:crm_smart/features/home/domain/repositories/available_screens_repository.dart';
import 'package:crm_smart/features/home/domain/repositories/favorite_screens_repository.dart';
import 'package:crm_smart/features/home/domain/repositories/pending_approvals_repository.dart';
import 'package:crm_smart/features/home/presentation/manager/favorite_screens_cubit.dart';
import 'package:crm_smart/features/home/presentation/pages/web_custom_drawer.dart';
import 'package:crm_smart/features/home/presentation/widgets/favorite_screens_section.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:crm_smart/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:crm_smart/features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:crm_smart/ui/widgets/custom_widget/home_app_bar.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart' as typform;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/common/models/search_client_model.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/common/widgets/app_card_container.dart';
import '../../../../core/common/widgets/app_copyrights_widget.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/app_loader.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../ui/screen/user/userview.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../ai_chat/presentation/pages/ai_chat_page.dart';
import '../../../notifications/presentation/pages/notifications_page.dart';
import '../../../versions/presentation/pages/versions_page.dart';
import '../manager/search_cubit.dart';
import '../manager/web_home_page_cubit.dart';

var formatter = intl.NumberFormat("#,##0.00", "ar_SA");
var formatterWithOutFraction = intl.NumberFormat("#,###", "ar_SA");

class WebHomePage extends StatefulWidget {
  WebHomePage({this.child, super.key});

  final Widget? child;

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  late final WebHomePageCubit _webHomePageCubit;
  late final SearchCubit _searchCubit;
  final TextEditingController _searchController = TextEditingController();
  bool _isApprovalExpanded = false;
  List<dynamic> _pendingApprovals = [1, 2, 3];
  bool _isLoadingApprovals = false;
  late final PendingApprovalsRepository _approvalsRepository;

  // Favorite screens management
  late FavoriteScreensCubit _favoriteScreensCubit;
  bool _isFavoriteScreensInitialized = false;

  @override
  void initState() {
    super.initState();
    _webHomePageCubit = context.read<WebHomePageCubit>();
    _searchCubit = context.read<SearchCubit>();
    _initializeFavoriteScreens();

    context.read<NotificationsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        _searchCubit.getHomeStatistics(),
        Provider.of<comment_vm>(context, listen: false).getCommentMentions(),
      ]);
    });
  }

  /// Initializes the favorite screens feature properly
  Future<void> _initializeFavoriteScreens() async {
    try {
      // Get SharedPreferences instance
      final prefs = await SharedPreferences.getInstance();

      // Create repositories
      final favoriteRepo = FavoriteScreensRepositoryImpl(prefs);
      final availableRepo = AvailableScreensRepositoryImpl();

      // Get privileges cubit from context
      final privilegesCubit = context.read<PrivilegesCubit>();

      // Create FavoriteScreensCubit with proper dependencies
      _favoriteScreensCubit = FavoriteScreensCubit(
        favoriteRepo,
        availableRepo,
        privilegesCubit,
      );

      // Load data
      await _favoriteScreensCubit.loadFavoriteScreens();

      // Update UI if widget is still mounted
      if (mounted) {
        setState(() {
          _isFavoriteScreensInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing favorite screens: $e');
      // Handle errors gracefully
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء تحميل الواجهات المفضلة')),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _searchCubit),
        if (_isFavoriteScreensInitialized)
          BlocProvider.value(value: _favoriteScreensCubit),
      ],
      child: AppScaffold(
        body: Stack(
          children: [
            Row(
              children: [
                // Sidebar con el diseño de CustomDrawer pero navegación web
                WebCustomDrawer(),
                // Contenido principal adaptado de MobHomePage
                Expanded(
                  child: widget.child == null ? _buildBody() : widget.child!,
                ),
              ],
            ),
            const AIChatPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  color: AppColors.background,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Cabecera con notificaciones y perfil
                        _buildHeaderSection(),

                        // Barra de búsqueda adaptada de MobHomePage
                        _buildSearchSection(),

                        // Sección de pantallas favoritas
                        if (_isFavoriteScreensInitialized)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: FavoriteScreensSection(),
                          ),

                        // Estado de carga si no está inicializado
                        if (!_isFavoriteScreensInitialized)
                          _buildLoadingFavoriteScreens(),

                        // Sección de aprobaciones pendientes
                        _buildApprovalSection(),

                        // Sección de estadísticas
                        _buildStatisticsSection(),

                        // Sección de progreso
                        _buildProgressSection(),

                        // Espacio adicional al final
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          AppCopyrightsWidget(),
          10.height,
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    final _notificationsCubit = context.read<NotificationsCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: AppCardContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigator.go(
                  VersionsPage(),
                  name: AppRoutesNames.generalRoutes.versions,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.browser_updated_outlined,
                  size: (25.0).scaleFontSize,
                  color: AppColors.black,
                ),
              ),
            ),
            12.horizontal,
            GestureDetector(
              onTap: () {
                AppNavigator.go(
                  NotificationsPage(),
                  name: AppRoutesNames.generalRoutes.notifications,
                );
                _notificationsCubit.markNotificationsAsRead();
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications,
                      size: (25.0).scaleFontSize,
                      color: AppColors.black,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Consumer<UserProvider>(
                      builder: (context, value, child) {
                        return (value.currentUser.notificationNotRead ?? 0) == 0
                            ? SizedBox.shrink()
                            : Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.statusErrorActive,
                                ),
                                width: (22.0).scaleWidth,
                                height: (22.0).scaleWidth,
                                child: Center(
                                    child: AppText(
                                  (value.currentUser.notificationNotRead ?? 0) >
                                          99
                                      ? '99'
                                      : (value.currentUser
                                                  .notificationNotRead ??
                                              0)
                                          .toString(),
                                  color: Colors.white,
                                  fontSize: (14.0).scaleFontSize,
                                )),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
            12.horizontal,
            if ((Provider.of<UserProvider>(context, listen: true)
                        .currentUser
                        .noOfMentions ??
                    0) !=
                0)
              Stack(clipBehavior: Clip.none, children: [
                Consumer<comment_vm>(
                  builder: (context, value, child) => PopupMenuButton(
                    offset: Offset(0, 10),
                    constraints: BoxConstraints(
                        minWidth: 420.scaleWidth,
                        maxWidth: 520.scaleWidth,
                        maxHeight: 600.scaleHeight),
                    position: PopupMenuPosition.under,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Transform.translate(
                      offset: Offset(0, 2),
                      child: Icon(
                        Icons.comment,
                        size: (25.0).scaleFontSize,
                      ),
                    ),
                    onOpened: () => value.getCommentMentions(),
                    onSelected: (value) => {},
                    itemBuilder: (context) => List.generate(
                        value.isLoading ? 3 : value.commentMention.length,
                        (index) => PopupMenuItem(
                            enabled: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ClientProfile(
                                            tabIndex: 2,
                                            idClient: value
                                                .commentMention[index].fkClient,
                                            commentId: value
                                                .commentMention[index]
                                                .idComment,
                                          )));
                            },
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Cardcomment(
                                commentmodel: value.commentMention[index],
                              ),
                            ))),
                  ),
                ),
                Positioned(
                    right: -9,
                    top: -9,
                    child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        width: (22.0).scaleWidth,
                        height: (22.0).scaleWidth,
                        child: Center(
                          child: AppText(
                            "${Provider.of<UserProvider>(context, listen: true).currentUser.noOfMentions}",
                            color: Colors.white,
                            fontSize: (14.0).scaleFontSize,
                          ),
                        ))),
              ]),
            12.horizontal,
            InkWell(
              onTap: () {
                AppNavigator.go(
                  UserScreen(
                    ismyprofile: 'yes',
                    user: Provider.of<UserProvider>(context, listen: false)
                        .currentUser,
                  ),
                  isNew: false,
                );
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primaryMain,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: AppCachedNetworkImage(
                    width: 500,
                    height: 500,
                    fit: BoxFit.fill,
                    imageUrl: AppConstants.currentUser.img_image,
                  ),
                ),
              ),
            ),
            7.horizontal,
            AppText(AppConstants.currentUser.nameUser),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryMain,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
        ],
      ),
    );
  }

  Widget _buildLoadingFavoriteScreens() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'الواجهات المفضلة',
            style: TextStyle(
              fontSize: 18.scaleFontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryMain,
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryMain,
                  ),
                ),
                SizedBox(height: 8),
                AppText(
                  'جاري تحميل الواجهات المفضلة...',
                  style: TextStyle(
                    fontSize: 14.scaleFontSize,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
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
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                      color: AppColors.primaryMain),
                ),
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
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.primaryMain,
                                shape: BoxShape.circle,
                              ),
                              child: AppText(
                                '${state.homeStatistics.data?.approveCount.toString()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.scaleFontSize,
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Daily :',
                ),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem(
                            "Client", data?.dailyClients, Icons.people)),
                    16.width,
                    Expanded(
                        child: _buildStatItem(
                            'Income',
                            formatter.format(data?.dailySales),
                            Icons.account_balance)),
                  ],
                ),
                12.height,
                AppText('Monthly :'),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem(
                            'Income',
                            formatter.format(data?.monthlySales),
                            Icons.trending_up)),
                    16.width,
                    Expanded(
                        child: _buildStatItem(
                            'Loss',
                            formatter.format(data?.monthlyWithdrawLosses),
                            Icons.trending_down)),
                    16.width,
                    Expanded(
                        child: _buildStatItem('No.Loss',
                            data?.monthlyNoWithdraw, Icons.people_outline)),
                  ],
                ),
                12.height,
                AppText('Customer care :'),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem(
                            'Waiting for periodic communication',
                            formatterWithOutFraction
                                .format(data?.waitingFrequent),
                            Icons.repeat)),
                    16.width,
                    Expanded(
                        child: _buildStatItem(
                            'Waiting for the first quality',
                            formatterWithOutFraction
                                .format(data?.waitingInstall1),
                            Icons.high_quality)),
                  ],
                ),
                5.height,
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem(
                            'Waiting for the second quality',
                            formatterWithOutFraction
                                .format(data?.waitingInstall2),
                            Icons.high_quality_outlined)),
                    16.width,
                    Expanded(
                        child: _buildStatItem(
                            'Waiting for welcome',
                            formatterWithOutFraction
                                .format(data?.waitingWelcome),
                            Icons.waving_hand)),
                  ],
                ),
                12.height,
                AppText('ToDo '),
                Row(
                  children: [
                    Expanded(
                        child: _buildStatItem(
                            'visit', data?.notDoneVisits, Icons.work)),
                    16.width,
                    Expanded(
                        child: _buildStatItem('task', data?.tasks, Icons.task)),
                  ],
                ),
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
    final displayValue = value ?? 0;
    return Container(
      height: 120.scaleHeight,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.primaryMain),
          SizedBox(height: 4),
          Flexible(
            child: AppText(
              displayValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.scaleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 2),
          Flexible(
            child: AppText(
              title,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                (state.homeStatistics.data?.openTicketsProgress ?? 0)
                    .toDouble(),
                Colors.green,
                state.homeStatistics.data?.openTicketsLabel ?? '',
              ),
              SizedBox(
                height: 12,
              ),
              _buildProgressBar(
                'Open visit',
                (state.homeStatistics.data?.notDoneVisitsProgress ?? 0)
                    .toDouble(),
                Colors.green,
                state.homeStatistics.data?.notDoneVisitsLabel ?? '',
              ),
            ],
          ),
        );
      },
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

  List<SectionModel> _filterAllowedSections(List<SectionModel> subSections) {
    return subSections.where((e) {
      return context.read<PrivilegesCubit>().checkPrivilege(e.privilegeId);
    }).toList();
  }
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.width,
    required this.onTap,
  });

  final String text;
  final double? width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 56.scaleHeight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.fillColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppText(
          text,
          fontWeight: FontWeight.w600,
          fontFamily: AppFonts.fontFamily2,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
