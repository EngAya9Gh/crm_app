import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
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
    return AppCardContainer(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return DialogProductInvoice(
            itemProd: widget.itemProd,
            invoice: widget.invoice,
          );
        },
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(widget.itemProd.nameProduct,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(' السعر : ',),
                AppText(widget.itemProd.price.toString(),),
                4.width,
                AppText(' الكمية : ', ),
                AppText(widget.itemProd.amount.toString(),
                ),
              ],
            ),
          ],
        ),
      ]
      ),
    );
  }
}
