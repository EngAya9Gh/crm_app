import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_paginated_list.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../../../core/common/widgets/custom_error_widget.dart';
import '../../../core/common/widgets/custom_search_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../view_model/product_vm.dart';
import '../../widgets/product_widget/cardProduct.dart';
import 'addproduct.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Provider.of<product_vm>(context, listen: false).getproduct_vm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      floatingActionButton: context.read<PrivilegesCubit>().checkPrivilege('45')
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryMain,
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => addProduct()));
              },
              tooltip: 'إضافة منتج',
              child: AppIcon(Icons.add),
            )
          : SizedBox.shrink(),
      appBar: CustomAppBar(title: 'المنتجات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CustomSearchWidget(
                searchController: TextEditingController(),
                onChanged: (value) {
                  Provider.of<product_vm>(context, listen: false)
                      .searchProducts(value);
                },
              ),
              10.height,
              Consumer<product_vm>(
                builder: (context, value, child) {
                  if (value.isloading) {
                    return AppLoader();
                  }
                  if (value.listProduct.isEmpty) {
                    AppErrorWidget(message: 'لا يوجد منتجات');
                  }
                  return Expanded(
                    child: AppPaginatedList(
                      items: value.listProduct,
                      itemBuilder: (context, index) => CardProduct(
                        itemProd: value.listProduct[index],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
