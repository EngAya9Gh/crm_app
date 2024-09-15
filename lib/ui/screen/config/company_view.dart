import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../core/common/extensions/build_context.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_paginated_list.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/sales/company/presentation/pages/comment_company_page.dart';
import '../../../model/companyModel.dart';
import '../../../view_model/company_vm.dart';
import 'add_company.dart';
import 'update_company.dart';

class company_view extends StatefulWidget {
  company_view({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<company_view> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<CompanyProvider>(context, listen: false).getcompany();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CompanyModel> _listlevel =
        Provider.of<CompanyProvider>(context, listen: true).list_company;
    return AppScaffold(
      appBar: CustomAppBar(title: 'الشركات '),
      floatingActionButton: FloatingActionButton(
        child: AppIcon(Icons.add),
        onPressed: () => AppNavigator.go(AddCompany(), isNew: false),
        backgroundColor: AppColors.primaryColor,
      ),
      //:Container(),
      body: _listlevel.length == 0
          ? AppLoader()
          : AppPaginatedList(
              items: _listlevel,
              itemBuilder: (BuildContext context, int index) => Builder(
                  builder: (context) => Slidable(
                        key: ValueKey(_listlevel[index].id_Company.toString()),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.35,
                          children: [
                            SlidableAction(
                              onPressed: (actionContext) async {
                                AppNavigator.go(
                                  updatecompany(
                                    idCompany:
                                        _listlevel[index].id_Company.toString(),
                                    nameCompany: _listlevel[index]
                                        .name_company
                                        .toString(),
                                    path_logo: _listlevel[index].path_logo,
                                  ),
                                  isNew: false,
                                );
                              },
                              backgroundColor:
                                  context.colorScheme.primaryContainer,
                              foregroundColor: Colors.white,
                              icon: Icons.edit_rounded,
                              label: 'تعديل',
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  AppNavigator.go(
                                    comment_company(
                                      idCompany: _listlevel[index].id_Company,
                                      nameCompany: _listlevel[index]
                                          .name_company
                                          .toString(),
                                    ),
                                    isNew: false,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 8.0,
                                        color: Colors.black87.withOpacity(0.2),
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),

                                      //color: AppColors.kMainColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Center(
                                          child: AppText(
                                            _listlevel[index].name_company,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
    );
  }
}
