import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_fonts.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/invoiceModel.dart';
import '../../../view_model/invoice_vm.dart';
import 'dialog_product_invoice.dart';

class CardProductInvoice extends StatefulWidget {
  const CardProductInvoice({
    super.key,
    required this.itemProd,
    required this.idUser,
    required this.invoice,
    required this.idClient,
  });

  final ProductsInvoice itemProd;
  final String? idClient;
  final String? idUser;

  final InvoiceModel? invoice;

  @override
  _CardProductInvoiceState createState() => _CardProductInvoiceState();
}

class _CardProductInvoiceState extends State<CardProductInvoice> {
  late final InvoiceVm invoiceVm;
  bool isepmty = false;

  TextEditingController _taxuser = TextEditingController();

  TextEditingController _textprice = TextEditingController();

  TextEditingController _taxadmin = TextEditingController();
  TextEditingController _amount = TextEditingController();

  @override
  void initState() {
    invoiceVm = Provider.of<InvoiceVm>(context, listen: false);
    _taxuser.text = widget.itemProd.rateUser!;
    _textprice.text = widget.itemProd.price!;
    _taxadmin.text = widget.itemProd.rateAdmin!;
    _amount.text = widget.itemProd.amount!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Center(
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return DialogProductInvoice(
                itemProd: widget.itemProd,
                invoice: widget.invoice,
              );
            },
          ),
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
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //this column --> information
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                widget.itemProd.nameProduct,
                                fontFamily: AppFonts.fontFamily1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      AppText(
                                        ' السعر : ',
                                        fontFamily: AppFonts.fontFamily1,
                                        style: TextStyle(
                                            fontFamily: AppFonts.fontFamily1),
                                      ),
                                      AppText(
                                        widget.itemProd.price.toString(),
                                        fontFamily: AppFonts.fontFamily1,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      AppText(
                                        ' الكمية : ',
                                        fontFamily: AppFonts.fontFamily1,
                                      ),
                                      AppText(
                                        widget.itemProd.amount.toString(),
                                        fontFamily: AppFonts.fontFamily1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
