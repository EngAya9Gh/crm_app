import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/ActivityModel.dart';
import '../../../view_model/activity_vm.dart';
import 'add_activity.dart';

class activity_view extends StatefulWidget {
  activity_view({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<activity_view> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ActivityProvider>(context, listen: false)
          .getActivities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ActivityModel> _listlevel =
        Provider.of<ActivityProvider>(context, listen: true).activitiesList;
    return AppScaffold(
      appBar: CustomAppBar(title: 'النشاط'),
      floatingActionButton: FloatingActionButton(
        child: AppIcon(Icons.add, color: AppColors.white),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => addractivity(
                // type: widget.type,
                nameActv: '', idActivity: null,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
      ),
      //:Container(),
      body: _listlevel.length == 0
          ? Center(child: CircularProgressIndicator())
          : AppPaginatedList(
              items: _listlevel,
              itemBuilder: (BuildContext context, int index) =>
                  Builder(builder: (context) {
                return AppCardContainer(
                  onTap: () {
                    AppNavigator.push(addractivity(
                      nameActv: _listlevel[index].name_activity_type,
                      idActivity: _listlevel[index].id_activity_type,
                    ));
                  },
                  child: Center(
                    child: AppText(
                      _listlevel[index].name_activity_type,
                      fontSize: 18,
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
