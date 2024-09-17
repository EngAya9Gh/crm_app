import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/location/city_model.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../view_model/maincity_vm.dart';
import 'add_city.dart';

class CityView extends StatefulWidget {
  CityView({required this.fkmain, Key? key}) : super(key: key);
  String fkmain;

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<MainCityProvider>(context, listen: false)
          .getcity(widget.fkmain);
    });
    super.initState();
  }

  List<CityModel> _listlevel = [];

  @override
  Widget build(BuildContext context) {
    _listlevel = Provider.of<MainCityProvider>(context, listen: true).listcity;
    return AppScaffold(
      appBar: CustomAppBar(title: 'المدن'),
      floatingActionButton:
          context.read<PrivilegesCubit>().checkPrivilege('79') == true
              ? FloatingActionButton(
                  child: AppIcon(Icons.add, color: AppColors.white),
                  onPressed: () {
                    AppNavigator.go(
                      AddCity(
                        fkmain: widget.fkmain,
                        idregoin: null,
                        nameregoin: null,
                      ),
                      isNew: false,
                    );
                  },
                  backgroundColor: AppColors.primaryColor,
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
                        AddCity(
                          fkmain: widget.fkmain,
                          nameregoin: _listlevel[index].cityName,
                          idregoin: _listlevel[index].cityId,
                        ),
                        isNew: false,
                      );
                    },
                    child: Center(
                      child: AppText(
                        _listlevel[index].cityName,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
