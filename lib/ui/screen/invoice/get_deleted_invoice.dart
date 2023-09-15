

//import 'package:flutter/cupertino.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/card_deleted.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
class deletedinvoice extends StatefulWidget {
  const deletedinvoice({Key? key}) : super(key: key);

  @override
  _deletedinvoiceState createState() => _deletedinvoiceState();
}

class _deletedinvoiceState extends State<deletedinvoice> {
  late TextEditingController _searchTextField;

  @override void initState() {
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    WidgetsBinding.instance.addPostFrameCallback((_){

      // Add Your Code here.
     Provider.of<invoice_vm>(context,listen: false).get_invoice_deleted();

    });
    super.initState();
  }
  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    context.read<invoice_vm>().onSearch_deleted(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {

    // List<InvoiceModel> _listdeletedinvoice
    // = context.watch<invoice_vm>().listdeletedinvoice;
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,title:Text( 'الفواتير المحذوفة ',
          style:
          TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),),
        ),
      body:
      Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _searchTextField,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: hintnamefilter,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عدد الفواتير',
                    style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                  ),
                  Consumer<invoice_vm>(builder: (context, value, _) {
                    final list = _searchTextField.text.isEmpty
                        ? value.listdeletedinvoice
                        : value.listdeletedFilterSearch;
                    return Text(
                      list.length.toString(),
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Consumer<invoice_vm>(
              builder: (context, value, child) {
                final list = _searchTextField.text.isEmpty
                    ? value.listdeletedinvoice
                    : value.listdeletedFilterSearch;

                return value.isloading == true
                    ? Center(child: CircularProgressIndicator())
                    : list.length == 0
                    ? Center(child: Text(_searchTextField.text.isEmpty ? messageNoData : "لا يوجد بيانات بحث..."))
                    : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.73,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child:
                                ListView.separated(
                                  padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
                                  itemCount: list.length,
                                  separatorBuilder: (BuildContext context, int index) => const Divider(height: 10,thickness: 1.5),
                                  itemBuilder: (BuildContext context, int index)=>
                                      Builder(builder:
                                          (context)=>
                                          card_deleted(
                                            card: list[index],
                                            //itemClient :  widget.itemClient,
                                            //scaffoldKey: _scaffoldKey,
                                            //indexinvoice: index,
                                          )) ,
                                  //     _listProd.map(
                                  //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
                                  // ).toList(),
                                ) ,
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              },
            ),
          ],

        ),
      ),


    );
  }
}
