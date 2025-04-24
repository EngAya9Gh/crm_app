import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/reasonmodel.dart';
import '../../../view_model/typeclient.dart';
import 'add_reason.dart';

class ResoanView extends StatefulWidget {
  ResoanView({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _ResoanViewState createState() => _ResoanViewState();
}

class _ResoanViewState extends State<ResoanView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<ClientTypeProvider>(context, listen: false).getreasons(widget.type);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ReasonModel> _listlevel = Provider.of<ClientTypeProvider>(context, listen: true).type_of_out;
    return AppScaffold(
      appBar: CustomAppBar(
        title: widget.type == 'client' ? 'أسباب الانسحاب' : 'أنواع التذاكر',
      ),
      floatingActionButton: widget.type == 'client'
          ? context.read<PrivilegesCubit>().checkPrivilege('73') == true
              ? FloatingActionButton(
                  child: Icon(Icons.add, color: AppColors.white),
                  onPressed: () {
                    AppNavigator.go(
                      AddReason(
                        idReason: null,
                        nameReason: null,
                        type: widget.type,
                      ),
                      isNew: false,
                    );
                  },
                  backgroundColor: AppColors.primaryMain,
                )
              : Container()
          : context.read<PrivilegesCubit>().checkPrivilege('74') == true
              ? FloatingActionButton(
                  child: AppIcon(Icons.add, color: AppColors.white),
                  onPressed: () {
                    AppNavigator.go(
                      AddReason(
                        type: widget.type,
                        idReason: null,
                        nameReason: null,
                      ),
                      isNew: false,
                    );
                  },
                  backgroundColor: AppColors.primaryMain,
                )
              : Container(),
      body: _listlevel.length == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: AppPaginatedList(
                  items: _listlevel,
                  itemBuilder: (BuildContext context, int index) {
                    return AppCardContainer(
                      onTap: () {
                        AppNavigator.go(
                          AddReason(
                            nameReason: _listlevel[index].nameReason,
                            idReason: _listlevel[index].idReason,
                            type: widget.type,
                          ),
                          isNew: false,
                        );
                      },
                      child: context.read<PrivilegesCubit>().checkPrivilege('342')
                          ? Row(
                              children: [
                                Expanded(
                                  child: AppText(
                                    textAlign: TextAlign.start,
                                    _listlevel[index].nameReason,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.scaleIconsSize,
                                  width: 40.scaleIconsSize,
                                  child: Consumer<ClientTypeProvider>(
                                    builder: (context, value, child) => (value.isloading && value.deletedId == _listlevel[index].idReason)
                                        ? AppLoader()
                                        : IconButton(
                                            onPressed: () async {
                                              await value.delte_resoan(_listlevel[index].idReason!);
                                            },
                                            icon: Icon(
                                              Icons.delete_forever_outlined,
                                              color: AppColors.statusErrorActive,
                                            )),
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: AppText(
                                textAlign: TextAlign.start,
                                _listlevel[index].nameReason,
                                fontSize: 18,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
