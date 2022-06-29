import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';

import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class CardProduct_invoice extends StatefulWidget {
  CardProduct_invoice({
    required this.itemProd,index,
    required this.iduser,
    required this.invoice,
    //required this.value_config,
    required this.idclient, Key? key}) : super(key: key);
  ProductsInvoice itemProd;
  String? idclient,iduser;
  InvoiceModel? invoice;

  @override
  _CardProduct_invoiceState createState() => _CardProduct_invoiceState();
}

class _CardProduct_invoiceState extends State<CardProduct_invoice> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
bool isepmty=false;
  // int index=0;
  TextEditingController _taxuser = TextEditingController();
  late String _taxuser_value;

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  late String _taxadmin_value;
  TextEditingController _amount= TextEditingController();
  late String _amount_value;
  @override void initState() {
    _taxuser.text=widget.itemProd.rateUser!;
    _textprice.text=widget.itemProd.price!;
    _taxadmin.text=widget.itemProd.rateAdmin!;
    _amount.text=widget.itemProd.amount!;
    super.initState();
  }
  void calculate(){
    setState(() {
      //isepmty=false;
      double totaltax=0;
      //if(listProduct.isNotEmpty){
        _textprice.text=widget.itemProd.priceProduct!;
        String? taxCountry=widget.itemProd.taxtotal;
        print(taxCountry);

        if(taxCountry!=null||taxCountry!='null')
        {
          double pricewithtax=double.parse(_textprice.text)* double.parse(taxCountry!)/100;
          print(pricewithtax);
          _textprice.text =(double.parse(_textprice.text) +pricewithtax).toString();
        }
        if(_taxadmin.text!=''&&_taxuser.text!='')
        {
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
        double pricewithouttax=double.parse(_textprice.text)* totaltax/100;
        _textprice.text =(double.parse(_textprice.text)-pricewithouttax).toString();
        print( _textprice.text);
        double totalprice=double.parse(_textprice.text)
            *double.parse( _amount.text.isEmpty?'1':_amount.text);
        //totalprice.floorToDouble();
        _textprice.text=totalprice.toString();
      }
    );
    }



  @override
  Widget build(BuildContext context) {
    double totaltax = 0;

    if (widget.itemProd.rateAdmin.toString() != '' &&
        widget.itemProd.rateUser.toString() != '')
  {

    totaltax= double.tryParse(widget.itemProd.rateAdmin.toString())!+
        double.parse(widget.itemProd.rateUser.toString());
  }else{
      if (widget.itemProd.rateAdmin.toString() != '')
      totaltax=double.tryParse(widget.itemProd.rateAdmin.toString())!;
      if (widget.itemProd.rateUser.toString() != '')
      totaltax=double.tryParse(widget.itemProd.rateUser.toString())!;
    }
    final _globalKey = GlobalKey<FormState>();
    Widget dialog =
    SimpleDialog(
      //elevation: 1,
      //backgroundColor: Colors.yellowAccent,
      // shape: StadiumBorder(
      //    side: BorderSide.none
      // ),
      titlePadding:const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0) ,
      insetPadding:  EdgeInsets.only(left: 10,right: 10,bottom: 10),
      contentPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      title: Center(child: Text('تعديل المنتج',style:TextStyle(fontFamily: kfontfamily2))),
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child:StatefulBuilder(

              builder: (BuildContext context, void Function(void Function()) setState) {
                return Form(
            key: _globalKey,
            child: Column(

              children: [

                RowEdit(name: 'الكمية', des: 'اجباري'),
                EditTextFormField(
                  vaild: (value) {
                    if (value!.isEmpty) {
                      return 'الحقل فارغ';
                    }
                  },
                  //read: false,
                  onChanged: (val) {
                    print(val);
                    if(val==null)_amount_value='1';
                    _amount_value=val;
                     setState(() { calculate();});
                  },
                  inputType: TextInputType.number,
                  label: 'الكمية',
                  // radius: 10,
                  inputformate: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller:_amount, hintText: 'الكمية',),
                //SizedBox(width: 10,),

                RowEdit(name: 'السعر', des: 'اجباري'),
                EditTextFormField(
                  vaild: (value) {
                    if (value!.isEmpty) {
                      return 'الحقل فارغ';
                    }
                  },
                  inputType: TextInputType.number,

                  //read: false,
                  controller: _textprice,
                  label: 'السعر',
                  hintText: Provider.of<user_vm_provider>(context, listen: true)
                      .currentUser.currency.toString(),
                  //radius: 10
                ),
                SizedBox(height: 5,),
                RowEdit(name: 'نسبة الخصم المتاحة للموظف', des: 'اختياري'),
                EditTextFormField(
                  //read: false,
                  onChanged: (val) {
                    _taxuser_value=val;
                    setState(() { calculate();});

                  },
                  inputType: TextInputType.number,

                  controller: _taxuser,
                  // label: 'نسبة الخصم المتاحة للموظف',
                  hintText: '%',
                  //radius: 10
                ),

                SizedBox(height: 3,),
                RowEdit(name: 'نسبة الخصم المتاحة للمشرف', des: 'اختياري'),
                EditTextFormField(
                  onChanged: (val) {
                    _taxadmin_value=val;
                    setState(() { calculate();});

                  },
                  inputType: TextInputType.number,

                  //read: false,
                  controller: _taxadmin,
                  // label: 'نسبة الخصم المتاحة للمشرف',
                  hintText: '%',
                  //radius: 10
                ),

          SizedBox(height: 5,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      kMainColor)),
              onPressed: () {
                //setState(() {
                //if(_textprice.text.isNotEmpty){
                if (_globalKey.currentState!
                    .validate()) {
                  _globalKey.currentState!.save();
                  isepmty=false;
                  widget.itemProd.rateUser= _taxuser.text;
                  widget.itemProd.price=_textprice.text;
                  widget.itemProd.rateAdmin=_taxadmin.text;
                  widget.itemProd.amount=_amount.text;
                  Navigator.of(context, rootNavigator: true)
                      .pop(false);}
                // }
                // else{
                //   setState(() {
                //     isepmty=true;
                //   });
                // _scaffoldKey.currentState!.showSnackBar(
                //     SnackBar(content: Text('من فضلك ادخل السعر')));
                // }
                // });
                // dismisses only the dialog and returns false
              },
              child: Text('تم'),
            ),
            //isepmty==true?Text('لا يمكن أن يكون السعر فارغ'):Container(),
SizedBox(width: 15,),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        kMainColor)),
                child: Text('حذف'),
                onPressed: ()   async {
                  if(widget.itemProd.idInvoiceProduct!=null)
                  {
                    // Provider.of<invoice_vm>(context,listen: false)
                    //     .listproductinvoic[index].isdeleted=true,
                    // Provider.of<invoice_vm>(context,listen: false)
                    //     .removelistproductinvoic(index);
                    double _total=0;
                   await Provider.of<invoice_vm>(
                        context, listen: false)
                        .deleteProductInInvoice(widget.itemProd.idInvoiceProduct);
                    List<ProductsInvoice>? pinv=
                        Provider.of<invoice_vm>(context,listen: false)
                            .listproductinvoic;

                    for(int i=0; i<pinv.length;i++){
                      _total=_total+double.parse(pinv[i].price.toString());
                    }
                    widget.invoice!.total=_total.toString();
                    print('_total.toString();');
                    print(_total.toString());
                    Provider.of<invoice_vm>(context,listen: false).set_total(_total.toString());
                    print(  widget.invoice!
                        .total);
                    widget.invoice!.products=pinv;
                    /////////////

//////////////////////////////////////////////////////////////
                    String? invoiceID=widget.invoice!.idInvoice;
                    Provider.of<invoice_vm>(
                        context, listen: false)
                        .update_invoiceclient_vm({
                      "name_enterprise":widget.invoice!.name_enterprise.toString(),
                      "name_client":widget.invoice!.nameClient.toString(),
                      "nameUser":widget.invoice!.nameUser,
                      //"renew_year": renewController.text,
                      //"type_pay": typepayController,
                      //"date_create": DateTime.now().toString(),
                      //"type_installation": typeinstallController,
                      //"amount_paid": amount_paidController.text,

                      //"fk_idClient": widget.itemClient.idClients,
                      //"fk_idUser": widget.itemClient.fkUser,
                      //"image_record":imageController.text,
                      "lastuserupdate":Provider.of<user_vm_provider>(
                          context,listen: false).currentUser.idUser.toString(),
                      "total": widget.invoice!.total.toString(),
                      //"notes": noteController.text,
                      "id_invoice":invoiceID,
                      'date_lastuserupdate':DateTime.now().toString(),
                      //"date_changetype":,
                    },invoiceID,null,null
                    );
                  }
                  else
                  {
                    int index=Provider.of<invoice_vm>(context,listen: false).listproductinvoic
                        .indexWhere((element) => element.idInvoiceProduct== widget.itemProd.idInvoiceProduct);
                    Provider.of<invoice_vm>(context,listen: false)
                        .removelistproductinvoic(index);

                  }
                  Navigator.of(context, rootNavigator: true)
                      .pop(false);
                }

              //onPressed: COPY,
            ),
          ],
        ),
                SizedBox(height: 5,)
              ],
            ),
          );}
        )
        )],
    );

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
        child: InkWell(
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            showDialog<void>(
                context: context,
                builder: (context) => dialog);

            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Client()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(1)),
            ),
            //height: 70,
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //this column --> information
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [

                                  Text(
                                    widget.itemProd.nameProduct.toString(),
                                    maxLines: 4,
                                    style:
                                    TextStyle(fontFamily: kfontfamily2),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                               Row(
                                 children: [
                                   Text(
                                     ' السعر : ',
                                     style:
                                     TextStyle(fontFamily: kfontfamily2),
                                   ),
                                   Text(
                                     widget.itemProd.price.toString(),
                                     style:
                                     TextStyle(fontFamily: kfontfamily2),
                                   ),
                                   SizedBox(width: 3,),
                                   Text(
                                     ' الكمية : ',
                                     style:
                                     TextStyle(fontFamily: kfontfamily2),
                                   ),
                                   Text(
                                     widget.itemProd.amount.toString(),
                                     style:
                                     TextStyle(fontFamily: kfontfamily2),
                                   ),

                                 ],
                               ),

                             ],
                           ),

                            ],
                          ),
                          //this Row --> for icon edit and delete

                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
          ),
      );

  }
}