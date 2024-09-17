import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/managmodel.dart';
import '../../../provider/manage_provider.dart';
import '../privilges/addmanage.dart';

class ManageView extends StatefulWidget {
  const ManageView({super.key});

  @override
  State<ManageView> createState() => _ManageViewState();
}

class _ManageViewState extends State<ManageView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<manage_provider>(context, listen: false).getManages();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ManageModel> _listlevel =
        Provider.of<manage_provider>(context, listen: true).listtext;
    return AppScaffold(
      appBar: CustomAppBar(title: 'الإدارات'),
      floatingActionButton:
          context.read<PrivilegesCubit>().checkPrivilege('64') == true
              ? FloatingActionButton(
                  child: AppIcon(Icons.add, color: AppColors.white),
                  onPressed: () {
                    AppNavigator.go(
                      AddManagement(
                        fk_country: null,
                        idmange: null,
                        name_mange: null,
                      ),
                      isNew: false,
                    );
                  },
                  backgroundColor: AppColors.primaryColor,
                )
              : SizedBox.shrink(),
      body: _listlevel.length == 0
          ? AppLoader()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _listlevel.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.all(5),
                  child: AppCardContainer(
                    onTap: () {
                      AppNavigator.go(
                        AddManagement(
                          fk_country: _listlevel[index].fk_country,
                          name_mange: _listlevel[index].name_mange,
                          idmange: _listlevel[index].idMange,
                        ),
                        isNew: false,
                      );
                    },
                    child: Center(
                      child: AppText(
                        _listlevel[index].name_mange,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
