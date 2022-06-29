

//import 'package:flutter/cupertino.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/card_deleted.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class deletedinvoice extends StatefulWidget {
  const deletedinvoice({Key? key}) : super(key: key);

  @override
  _deletedinvoiceState createState() => _deletedinvoiceState();
}

class _deletedinvoiceState extends State<deletedinvoice> {
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_){

      // Add Your Code here.
     Provider.of<invoice_vm>(context,listen: false).get_invoice_deleted();

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    List<DeletedinvoiceModel> _listdeletedinvoice
    = context.watch<invoice_vm>().listdeletedinvoice;
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,title:Text( 'الفواتير المحذوفة ',
          style:
          TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
        ),
      body:Padding(
        padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height *0.95,
          child: ListView.separated(
            itemCount: _listdeletedinvoice.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index)=>
                Builder(builder:
                    (context)=>
                        card_deleted(
                      card: _listdeletedinvoice[index],
                      //itemClient :  widget.itemClient,
                      //scaffoldKey: _scaffoldKey,
                      //indexinvoice: index,
                        )) ,
            //     _listProd.map(
            //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
            // ).toList(),
          ),
        ),
      ) ,

    );
  }
}
