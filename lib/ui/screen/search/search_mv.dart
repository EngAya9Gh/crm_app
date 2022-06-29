
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardClient.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardclientAccept.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientCardNew.dart';
import 'package:crm_smart/ui/widgets/user_widget/carduserbuild.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crm_smart/function_global.dart';
class productSearchView extends StatelessWidget {

  String pattern;
  List<dynamic> list;
  productSearchView(this.pattern,this.list, {Key? key}) : super(key: key);
  Future<List<dynamic>> searchProducts(
      String productName
      ,List<dynamic> list) async {
    List<dynamic> clientlistsearch=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    // productName[0].toUpperCase() +
     //   productName.substring(1);
    print('search');
    print(searchKey);
    if(list is List<ClientModel> ){
      list.forEach((element) {
        if(element.nameEnterprise!.contains(searchKey,0)
            || element.nameClient!.contains(searchKey,0)
            || element.mobile!.contains(searchKey,0) )
            clientlistsearch.add(element);
      });
    // if(clientlistsearch.isEmpty){
    //   list.forEach((element) {
    //     if(element.nameClient!.contains(searchKey,0))
    //       clientlistsearch.add(element);
    //   });
    // }
    //   if(clientlistsearch.isEmpty){
    //     list.forEach((element) {
    //       if(element.mobile!.contains(searchKey,0))
    //         clientlistsearch.add(element);
    //     });
    //   }
    }
    if(list is List<UserModel>)
      list.forEach((element) {
        print(element.nameUser);
        print(searchKey);
        print('iside search');
        if(element.nameUser!.contains(searchKey,0))
          clientlistsearch.add(element);
      });
    if(list is List<InvoiceModel>)
      list.forEach((element) {
        if(element.name_enterprise!.contains(searchKey,0))
          clientlistsearch.add(element);
      });

    return clientlistsearch;
  }
  //String get pattern => null;
 Widget _widgetCard(dynamic val){
   //ClientModel
   //UserModel
   //InvoiceModel
   //ProductsInvoice
   if(val is ClientModel )
  return cardClientnew(
     itemClient:
     val,//_listProductFilter.data![index],
    iduser: '',
  );
 if(val is UserModel)
   return buildCardUsers(
   usermodell: val,
   );
 if(val is InvoiceModel)
   return cardClientAccept(
     iteminvoice: val,
   );
return Text('');

 }
  @override
  Widget build(BuildContext context) {
    //List<productModel> _listProductFilter= Provider.of<ProductProvider>(context).products;
    return Scaffold(

        appBar: AppBar(

        ),
        body:
        FutureBuilder(
          //initialData: Provider.of<ProductProvider>(context).products,
          future: searchProducts(pattern,list),
          builder: (BuildContext context,
              AsyncSnapshot<List<dynamic>> _listProductFilter)  {
            if (_listProductFilter.hasData == true) {
              //print("${pattern}");
              return  Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:_listProductFilter.data!.length,
                      itemBuilder: (context, index) {
                        //print("i will print ${_ListProduct.data!.docs[index]}");
                        return
                          _widgetCard(_listProductFilter.data![index]);
                      }));
            }
            else return Text("j");
          },
        )
    );
  }
}