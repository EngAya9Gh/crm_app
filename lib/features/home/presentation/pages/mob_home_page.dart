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

class MobHomePage extends StatefulWidget {
  MobHomePage({Key? key}) : super(key: key);

  @override
  _MobHomePageState createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final SearchCubit _searchCubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchCubit = context.read<SearchCubit>();
    context.read<NotificationsCubit>()..init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        // context.read<NotificationsCubit>().getUnreadNotificationsCount(),
        // Provider.of<UserProvider>(context, listen: false).getAllUsers(),
        // Provider.of<RegionProvider>(context, listen: false).getRegions(),
        // Provider.of<product_vm>(context, listen: false).getproduct_vm(),
        // Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket'),
      ]);
    });
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
          body: Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                        // Text(
                        //   'Welcome Back',
                        //   style: TextStyle(
                        //     fontSize: 24,
                        //     color: AppColors.white70,
                        //   ),
                        // ),
                        // Text(
                        //   'SMART CRM',
                        //   style: TextStyle(
                        //     fontSize: 28,
                        //     fontWeight: FontWeight.bold,
                        //     color: AppColors.white,
                        //   ),
                        // ),
                        // SizedBox(height: 20),
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
                              hintText: 'ابحث عن اسم المؤسسة, رقم الجوال...',
                              hintStyle: TextStyle(
                                fontSize: 14,
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
                          itemBuilder: (context, suggestion) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListTile(
                              title: Text(suggestion.nameEnterprise ?? ''),
                              subtitle: Text(suggestion.phone ?? ''),
                            ),
                          ),
                          debounceDuration: Duration(milliseconds: 300),
                          hideOnSelect: true,
                          hideOnUnfocus: true,
                          showOnFocus: true,
                          hideKeyboardOnDrag: true,
                          hideWithKeyboard: false,
                          retainOnLoading: false,
                          hideOnLoading: false,
                          hideOnEmpty: false,
                          onSelected: (suggestion) {
                            print(
                                'Selected: ${suggestion.idClients}'); // Debug print
                            _searchController.text = suggestion.name ?? '';
                            // TODO: Navigate to client details
                            AppNavigator.go(
                              ClientProfile(idClient: suggestion.idClients),
                              name: AppRoutesNames.clientProfile.inClientsList,
                              pathParameters: {
                                'idClient': suggestion.idClients.toString()
                              },
                            );
                          },
                          suggestionsCallback: (pattern) async {
                            print('Searching for: $pattern'); // Debug print
                            if (pattern.isEmpty) return [];
                            final results =
                                await _searchCubit.searchClients(pattern);
                            print('Results: ${results.length}'); // Debug print
                            return results;
                          },
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Transform.translate(
                      offset: Offset(0, -55),
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(15),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.3,
                        children: [
                          _buildCard('All Leads', '185'),
                          _buildCard('Fresh Leads', '25'),
                          _buildCard('Cold Calls', '1'),
                          _buildCard('No Answer\npotential', '0'),
                          _buildCard('Follow up', '67'),
                          _buildCard('No Answer', '4'),
                          _buildCard('Not interested', '1'),
                          _buildCard('Follow up To\nMeeting', '2'),
                          _buildCard('Meeting', '30'),
                          _buildCard('Follow up After\nMeeting', '2'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 6),
            AppText(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
