import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/CardProduct_Invoice.dart';
import 'package:crm_smart/ui/widgets/product_widget/cardProduct.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/combox_widget/regoincombox.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class add_invoiceProduct extends StatefulWidget {
  add_invoiceProduct(
      {
        required this.invoice,
        // required this.indexinvoic,
    Key? key}) : super(key: key);
  InvoiceModel? invoice;
  // int indexinvoic;
  @override
  _add_invoiceProductState createState() => _add_invoiceProductState();
}

class _add_invoiceProductState extends State<add_invoiceProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ProductModel> listProduct = [];
  List<ProductsInvoice> listAdded = [];
  String? selectedvalue = null;
  TextEditingController _taxuser = TextEditingController();
  late String _taxuser_value;

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  late String _taxadmin_value;
  TextEditingController _amount= TextEditingController();
  late String _amount_value;
  late int index=0;
  String? taxCountry=null;
  @override
  void initState() {

    _taxuser.text='';_taxuser_value='';
    _taxadmin.text='';_taxadmin_value='';
    _textprice.text='';
    _amount.text='';_amount_value='1';
    // String? id_country =
    //     Provider.of<user_vm_provider>(context, listen: false).currentUser!.fkCountry;
    // Provider.of<product_vm>(context, listen: false)
    //     .getproduct_vm(id_country!);
    // taxCountry=listProduct[index].value_config;
    //.then((value) => _isLoading=false);
    // String? id_country =
    //     Provider
    //         .of<user_vm_provider>(context, listen: false)
    //         .currentUser!
    //         .fkCountry;

    WidgetsBinding.instance!.addPostFrameCallback((_){

    });
    super.initState();
  }
  @override void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    //
    // });
    super.didChangeDependencies();

  }
void calculate(){
    setState(() {
      double totaltax=0;
      if(listProduct.isNotEmpty){
        _textprice.text=listProduct[index].priceProduct;
        String? taxCountry=listProduct[index].value_config;
       print('tax'); print(taxCountry);
       print('price'); print(_textprice.text);
        if(taxCountry!=null)
        {
          double pricewithtax=double.parse(_textprice.text)* double.parse(taxCountry)/100;
          print(pricewithtax);
          _textprice.text =(double.parse(_textprice.text) +pricewithtax).toString();
        }
        if(_taxadmin.text!=''&&_taxuser.text!='') {
          totaltax = double.parse(_taxadmin.text)+double.parse( _taxuser.text);
          //_textprice.text=totaltax.toString();
        }
        else {
          print('inside else '+_taxadmin.text);
          print('inside else '+_taxuser.text);
          if(_taxadmin.text!='')
            totaltax=double.parse(_taxadmin.text);
          if(_taxuser.text!='')
            totaltax=double.parse( _taxuser.text);
        }
        double pricewithouttax=double.parse(_textprice.text)* totaltax/100; //حسم
        _textprice.text =(double.parse(_textprice.text)-pricewithouttax).toString();
        print(_textprice.text);
        double totalprice=double.parse(_textprice.text)
            *double.parse( _amount.text.isEmpty?'1':_amount.text);
        // totalprice.floorToDouble();
        _textprice.text=totalprice.toString();
        print(totalprice.toStringAsFixed(2));
      }

    }


    );

}
  @override
  Widget build(BuildContext context) {
    listProduct = Provider.of<product_vm>(context, listen: true)
        .listProduct;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(

         actions: [

          IconButton(
              onPressed: (){
            double _total=0;
             List<ProductsInvoice>? pinv=
                  Provider.of<invoice_vm>(context,listen: false)
                  .listproductinvoic;
            for(int i=0; i<pinv.length;i++){
              _total=_total+double.parse(pinv[i].price.toString());
            }
            widget.invoice!.total=_total.toStringAsFixed(2).toString();
            print('_total.toString();');
            print(_total.toString());
            Provider.of<invoice_vm>(context,listen: false).set_total(_total.toString());
            print(  widget.invoice!
                .total);
            widget.invoice!.products=pinv;

           // Provider.of<invoice_vm>(context,listen: false)
             //   .updatelistproducetInvoice();//to refresh total in list invoice

            Navigator.pop(context);

          }, icon:Icon( Icons.check_rounded,color: kWhiteColor,)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.white38,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all( Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Colors.black87.withOpacity(0.2),
                    ),
                  ],),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                    children: [
                      DropdownButton(
                        isExpanded: true,
                        hint: Text("اختر منتج"),
                        items: listProduct.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.nameProduct), //label of item
                            value: level_one.idProduct, //value of item
                          );
                        }).toList(),
                        value:
                        selectedvalue, //select_dataItem!.idCountry ,
                        onChanged: (value) {
                          setState(() {
                            selectedvalue = value.toString();
                            index=listProduct.indexWhere(
                                    (element) => element.idProduct==selectedvalue);
                            calculate();
                          });
                          //Provider.of<regoin_vm>(context,listen: false).changeVal(value.toString());
                        },
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Flexible(
                              child: Column(
                                children: [
                                  RowEdit(name: 'الكمية', des: ''),
                                  EditTextFormField(
                                    //read: false,
                                    onChanged: (val) {
                                      print(val);
                                      if(val==null)_amount_value='';
                                      _amount_value=val;
                                      calculate();
                                    },
                                    inputType: TextInputType.number,
                                    label: 'الكمية',
                                    // radius: 10,

                                    controller:_amount, hintText: 'الكمية',
                                    inputformate: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(width: 10,),
                          Flexible(
                              child: Column(
                                children: [
                                  RowEdit(name: 'السعر', des: ''),
                                  EditTextFormField(
                                    vaild: (value) {
                                      if (value.toString().trim().isEmpty) {
                                        return label_empty;
                                      }
                                      if(double.tryParse(value.toString()) == null)
                                        return 'من فضلك ادخل عدد';
                                      // else if(value.characters){
                                      //   return ;
                                      // }
                                    },
                                    //ontap: calculate,
                                    //read: false,
                                    controller: _textprice,
                                    label: 'السعر',
                                    hintText: Provider.of<user_vm_provider>(context, listen: true)
                                        .currentUser.currency.toString(),
                                    inputType: TextInputType.number,
                                   // inputformate: <TextInputFormatter>[
                                   //   FilteringTextInputFormatter.digitsOnly
                                   // ],
                                    //radius: 10
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: ' الخصم للموظف', des: 'اختياري'),
                                EditTextFormField(

                                  //read: false,
                                  onChanged: (val) {
                                    _taxuser_value=val;
                                    calculate();
                                  },
                                  inputType: TextInputType.number,

                                  controller: _taxuser,
                                  // label: 'نسبة الخصم المتاحة للموظف',
                                  hintText: '%',
                                  //radius: 10
                                ),
                                // Row(
                                //   children: [
                                //
                                //     SizedBox(width: 10,),
                                //     Text('%'),
                                //   ],
                                // ),

                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Column(
                              children: [
                                RowEdit(name: ' الخصم للمشرف', des: 'اختياري'),
                                EditTextFormField(
                                  onChanged: (val) {
                                    _taxadmin_value=val;
                                    calculate();
                                  },
                                  inputType: TextInputType.number,

                                  //read: false,
                                  controller: _taxadmin,
                                  // label: 'نسبة الخصم المتاحة للمشرف',
                                  hintText: '%',
                                  //radius: 10
                                ),
                                // Row(
                                //   children: [
                                //
                                //     SizedBox(width: 10,),
                                //     Text('%'),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                          //   //TextBox.fromLTRBD(20, 20, 20, 20,TextDirection.rtl),
                        ],
                      ),



                      SizedBox(height: 5,),
                      const MySeparator(color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                           // Text(' إضافة منتج للفاتورة ' ,style: TextStyle(fontFamily: kfontfamily2),),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kMainColor)),
                                onPressed: () {
                                  //iduser
                                  if(_textprice.text.isNotEmpty && selectedvalue!=null){
                                    final index=listProduct.indexWhere(
                                            (element) => element.idProduct==selectedvalue);
                                    ProductModel pm=listProduct[index];
                                    ProductsInvoice  pp=ProductsInvoice(
                                        idInvoiceProduct: "null",
                                        fkIdInvoice: widget.invoice!.idInvoice==null
                                            ? '0' :  widget.invoice!.idInvoice.toString(),
                                        fkclient:widget.invoice!.fkIdClient ,
                                        fkuser: widget.invoice!.fkIdUser,
                                        fkProduct:pm.idProduct,
                                        fkConfig: pm.fkConfig==null?"null": pm.fkConfig,
                                        fkCountry: pm.fkCountry,
                                        price: _textprice.text,
                                        amount: _amount.text.isEmpty?'1':_amount.text,
                                        rateAdmin: _taxadmin.text,
                                        rateUser: _taxuser.text,
                                        nameProduct: pm.nameProduct,
                                        type: listProduct[index].type,
                                        idProduct: listProduct[index].idProduct,
                                        //value: listProduct[index].idProduct,
                                        //idInvoiceProduct: "null",
                                        priceProduct: listProduct[index].priceProduct,
                                        taxtotal: listProduct[index].value_config==null?
                                        "null":listProduct[index].value_config
                                    );
                                    listAdded.add(pp);
                                    print(pp.nameProduct);
                                    Provider.of<invoice_vm>(context,listen: false)
                                        .addlistproductinvoic(pp);
                                  }
                                  else{
                                    _scaffoldKey.currentState!.showSnackBar(
                                        SnackBar(content: Text('من فضلك تأكد من عملية الإدخال')));
                                  }
                                 setState(() {
                                   _taxuser.text='';_taxuser_value='';
                                   _taxadmin.text='';_taxadmin_value='';
                                   _textprice.text='';
                                   _amount.text='';_amount_value='1';
                                   selectedvalue=null;
                                 });
                                },
                                child: Text('إضافة المنتج للفاتورة')),
                            Text(''),
                          ],
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: MediaQuery.of(context).size.height*0.75,
                        child: Consumer<invoice_vm>(
                          builder: (_, data, __) =>
                              Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: data.listproductinvoic.length,
                                      itemBuilder: (context, index) {
                                        return CardProduct_invoice(
                                          invoice: widget.invoice,
                                          itemProd: data.listproductinvoic[index],
                                          index: index,
                                          //value_config:  listProduct[index].value_config,
                                          iduser: widget.invoice!.fkIdUser,
                                          idclient:widget.invoice!.fkIdClient ,
                                        );
                                      },),
                                  ),
                                ],
                              ),
                        ),
                      ),
                    ],
                    ),

                  ],
                    ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
