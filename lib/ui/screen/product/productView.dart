import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/productmodel.dart';
import '../../../view_model/product_vm.dart';
import '../../widgets/product_widget/cardProduct.dart';
import '../search/search_container.dart';
import 'addproduct.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading = true;
  List<ProductModel> _listProd = [];

  @override
  void initState() {
    // String? id_country=Provider.of<user_vm_provider>
    //   (context,listen: false).currentUser!.fkCountry;
    //Provider.of<product_vm>(context,listen: false).listProduct=[];
    Provider.of<product_vm>(context, listen: false)
        .getproduct_vm(); //.then((value) => _isLoading=false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listProd = Provider.of<product_vm>(context, listen: true).listProduct;
    // _isLoading = _listProd.isEmpty ? true : false;

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: context.read<PrivilegesCubit>().checkPrivilege('45')
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => addProduct()));
              },
              tooltip: 'إضافة منتج',
              child: Icon(Icons.add, color: AppColors.white),
            )
          : Container(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'المنتجات',
          style: TextStyle(color: AppColors.kWhiteColor),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: search_widget('product', "اسم المنتج....", ''),
              ),
              Consumer<product_vm>(
                builder: (context, value, child) {
                  return value.isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (value.listProduct.isEmpty
                          ? Center(
                              child: Text(
                                'لا يوجد منتجات',
                                style: TextStyle(
                                    fontSize: 22, color: AppColors.kWhiteColor),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.95,
                                child: ListView.builder(
                                  itemCount: value.listProduct.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Builder(
                                          builder: (context) => CardProduct(
                                                itemProd:
                                                    value.listProduct[index],
                                              )),
                                  //     _listProd.map(
                                  //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
                                  // ).toList(),
                                ),
                              ),
                            ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
