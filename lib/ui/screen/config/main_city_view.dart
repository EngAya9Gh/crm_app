import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/location/region_model.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../view_model/maincity_vm.dart';
import 'add_main_city.dart';
import 'cityview.dart';

class MainCityView extends StatefulWidget {
  const MainCityView({super.key});

  @override
  _MainCityViewState createState() => _MainCityViewState();
}

class _MainCityViewState extends State<MainCityView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<MainCityProvider>(context, listen: false).getmaincity();
    });
    super.initState();
  }

  List<RegionModel> _listlevel = [];

  @override
  Widget build(BuildContext context) {
    _listlevel =
        Provider.of<MainCityProvider>(context, listen: true).listmaincity;
    return AppScaffold(
      appBar: CustomAppBar(title: 'المناطق'),
      floatingActionButton:
          context.read<PrivilegesCubit>().checkPrivilege('78') == true
              ? FloatingActionButton(
                  child: AppIcon(Icons.add, color: AppColors.paperCard),
                  onPressed: () {
                    AppNavigator.go(
                      AddMainCity(
                        fkcountry: null,
                        idregoin: null,
                        nameregoin: null,
                      ),
                      isNew: false,
                    );
                  },
                  backgroundColor: AppColors.primaryMain,
                )
              : Container(),
      body: _listlevel.length == 0
          ? AppLoader()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: AppPaginatedList(
                items: _listlevel,
                itemBuilder: (BuildContext context, int index) {
                  return AppCardContainer(
                    onTap: () {
                      AppNavigator.go(
                        CityView(fkmain: _listlevel[index].id_maincity),
                        isNew: false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          _listlevel[index].namemaincity,
                          fontSize: 18,
                        ),
                        IconButton(
                          icon: AppIcon(
                            Icons.edit,
                            color: AppColors.primaryMain,
                          ),
                          onPressed: () {
                            AppNavigator.go(
                              AddMainCity(
                                fkcountry: _listlevel[index].fk_country,
                                idregoin: _listlevel[index].id_maincity,
                                nameregoin: _listlevel[index].namemaincity,
                              ),
                              isNew: false,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
