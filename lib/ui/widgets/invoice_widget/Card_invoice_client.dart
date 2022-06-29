import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/screen/product/editproduct.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../constants.dart';

class CardInvoiceClient extends StatefulWidget {
  CardInvoiceClient(
      {
        //required this.itemClient,
        required this.itemProd,
        //required this.indexinvoice,
        Key? key})
      : super(key: key);
  InvoiceModel itemProd;
 // ClientModel itemClient;
  // int indexinvoice;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _CardInvoiceClientState createState() => _CardInvoiceClientState();
}

class _CardInvoiceClientState extends State<CardInvoiceClient> {
  late UserModel _currentUser;

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {

    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _currentUser =
    Provider.of<user_vm_provider>(context, listen: true)
        .currentUser;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>
                    InvoiceView(
                  //clientmodel: widget.itemClient,
                  invoice:widget.itemProd ,
                )));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.itemProd.name_regoin.toString(),
                          style: TextStyle(
                              fontFamily: kfontfamily2,
                              color: kMainColor,
                              fontSize: 12),
                        ),
                        Text(
                          widget.itemProd.dateCreate.toString(),
                          style: TextStyle(
                              fontFamily: kfontfamily2,
                              color: kMainColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      widget.itemProd.name_enterprise.toString(),
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'الإجمالي',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.itemProd.total.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              ' ' + _currentUser.currency.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'المتبقي',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              (double.parse(widget.itemProd.total.toString()) -
                                  double.parse(widget.itemProd.amountPaid
                                      .toString()))
                                  .toStringAsFixed(2).toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              ' ' + _currentUser.currency.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'المدفوع',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                                (widget.itemProd.amountPaid
                                      .toString()),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              ' ' + _currentUser.currency.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'التجديد السنوي',
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.itemProd.renewYear.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              ' ' + _currentUser.currency.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Row(

                    //   children: [
                    //     new IconButton(
                    //       icon: Icon(
                    //         Icons.edit,
                    //         color: kMainColor,
                    //       ),
                    //       onPressed: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => addinvoice(
                    //                       //edit invoice
                    //                       itemClient: widget.itemClient,
                    //                       // iduser: widget.itemProd.fkIdUser,
                    //                       // idClient: widget.itemProd.fkIdClient,
                    //                       invoice: widget.itemProd,
                    //                       // indexinvoice: widget.indexinvoice)
                    //                     )));
                    //       },
                    //       //onPressed: BOOKMARK,
                    //     ),

                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
        //  ),
      ),
    );
  }
}