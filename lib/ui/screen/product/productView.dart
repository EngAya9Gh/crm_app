
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/product_widget/cardProduct.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import 'addproduct.dart';

class ProductView extends StatefulWidget {
   ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isLoading=true;
 List<ProductModel> _listProd=[];
@override
void initState() {
   // String? id_country=Provider.of<user_vm_provider>
   //   (context,listen: false).currentUser!.fkCountry;
   //Provider.of<product_vm>(context,listen: false).listProduct=[];
   Provider.of<product_vm>(context,listen: false)
       .getproduct_vm();//.then((value) => _isLoading=false);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listProd = Provider.of<product_vm>(context, listen: true).listProduct;
    _isLoading = _listProd.isEmpty ? true : false;
    print(_listProd);
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton:
      Provider.of<privilge_vm>(context,listen: true)
          .checkprivlge('45')==true ? FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addProduct()));
        },
        tooltip: 'إضافة منتج',
        child: Icon(Icons.add),
      ):Container(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'المنتجات',
          style: TextStyle(color: kWhiteColor),
          textAlign: TextAlign.center,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<product_vm>(
          builder: (context, value, child) {
            return _isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : (value.listProduct.isEmpty
                ? Center(
              child: Text(
                'لا يوجد منتجات',
                style: TextStyle(fontSize: 22, color: kWhiteColor),
              ),
            )
                : Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.95,
                child: ListView.builder(
                  itemCount: _listProd.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Builder(
                          builder: (context) => CardProduct(
                              itemProd: _listProd[index],
                            )),
                  //     _listProd.map(
                  //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
                  // ).toList(),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}


