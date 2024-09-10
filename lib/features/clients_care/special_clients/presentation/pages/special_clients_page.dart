import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:text_scroll/text_scroll.dart';

import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/distinctive_client.dart';
import '../manager/special_clients_bloc.dart';
import '../widgets/filter_special_clients_sheet.dart';

class SpecialClientsPage extends StatefulWidget {
  const SpecialClientsPage({super.key});

  @override
  State<SpecialClientsPage> createState() => _SpecialClientsPageState();
}

class _SpecialClientsPageState extends State<SpecialClientsPage> {
  late SpecialClientsBloc _bloc;
  late final MainCityProvider _mainCityProvider;
  late final fkCountry;
  late final userId;
  bool isMyClients = false;

  @override
  void initState() {
    _bloc = context.read<SpecialClientsBloc>()..init();
    final currentUser = context.read<UserProvider>().currentUser;
    fkCountry = currentUser.fkCountry;
    userId = currentUser.idUser;
    _mainCityProvider = context.read<MainCityProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _mainCityProvider.getcityAll();
      _bloc.add(GetSpecialClientsEvent());
    });

    super.initState();
  }

  void onSearch() {
    _bloc.add(SearchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'قائمة العملاء المميزين'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<SpecialClientsBloc, SpecialClientsState>(
          builder: (context, state) {
            return state.communicationListState.when(
              init: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (data) => Column(
                children: [
                  10.height,
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchWidget(
                          searchController:
                              _bloc.pageVariables.searchController,
                          onChanged: (value) {
                            _bloc.add(SearchEvent());
                          },
                        ),
                      ),
                      CustomFilterIcon(
                        onTap: () async {
                          final value = await AppBottomSheet.show(
                            context: context,
                            child: FilterSpecialClientsSheet(),
                          );
                          if (value != true) {
                            _bloc.returnToPreviousState();
                          }
                        },
                      ),
                      8.width,
                    ],
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("عدد العملاء"),
                        AppText(data.length.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async =>
                          _bloc.add(GetSpecialClientsEvent()),
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            communicationWidget(
                          state.communicationListState.data[index],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount: state.communicationListState.data.length,
                      ),
                    ),
                  ),
                ],
              ),
              empty: () => Text("Empty communications"),
              error: (exception) => Text("Exception"),
            );
          },
        ),
      ),
    );
  }

  Widget communicationWidget(DistinctiveClient communication) {
    return InkWell(
      onTap: () {
        AppNavigator.go(
          ClientProfile(
            idClient: communication.fkClient,
            tabIndex: 3,
            tabCareIndex: 2,
          ),
          name: AppRoutesNames.clientProfile.clientProfileInCareSpecialClients,
          pathParameters: {'idClient': communication.fkClient.toString()},
          extra: {
            'tabIndex': 3,
            'tabCareIndex': 2,
          },
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          " اسم الشركة: ",
                          // style: TextStyle(fontFamily: AppFonts.fontFamily2),
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: AppFonts.fontFamily2),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: TextScroll(
                            communication.nameEnterprise ?? "",
                            mode: TextScrollMode.endless,
                            velocity: Velocity(pixelsPerSecond: Offset(30, 0)),
                            delayBefore: Duration(milliseconds: 2000),
                            pauseBetween: Duration(milliseconds: 1000),
                            style: TextStyle(fontFamily: AppFonts.fontFamily2),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    communication.nameRegoin ?? '',
                    style: TextStyle(
                        color: Colors.black, fontFamily: AppFonts.fontFamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 15),
                  Text(
                    intl.DateFormat("yyyy MMM dd hh:mm a", "ar")
                        .format(communication.dateCreate ?? DateTime.now()),
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: AppFonts.fontFamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
