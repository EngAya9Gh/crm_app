import 'package:crm_smart/ui/screen/home/ticket/ticket_all.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketadd.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketdetail.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketview.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';

class ticketclientview extends StatefulWidget {
  const ticketclientview({Key? key}) : super(key: key);

  @override
  _ticketclientviewState createState() => _ticketclientviewState();
}

class _ticketclientviewState extends State<ticketclientview> {

  late String typepayController;

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      await Provider.of<ticket_vm>(context, listen: false)
        .getticket();
      Provider.of<ticket_vm>(context,listen: false).changeticket(0);
      Provider.of<ticket_vm>(context,listen: false).
      gettypeticket_filter('0');
      Provider.of<typeclient>(context, listen: false).getreasons('ticket');

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تذاكر العميل',style: TextStyle(
            color: kWhiteColor,
            fontFamily: kfontfamily2),
      ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListView(
            children: [
              Provider.of<privilge_vm>(context,listen: true)
                  .checkprivlge('26')==true?   Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          kMainColor)),
                  onPressed: () async{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>
                            ticketAdd(
                              fk_client: null,
                            )));
                  },
                  child: Text(' فتح تذكرة دعم ')),
            ):Container() ,

              SizedBox(height: 2,),
              search_widget(
                'ticket',
                "المؤسسة ,العميل , رقم الهاتف....",''),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Consumer<ticket_vm>(
                    builder: (context, selectedProvider, child){
                      return  GroupButton(
                          controller: GroupButtonController(
                            selectedIndex:selectedProvider.selectedtypeticket,
                          ),
                          options: GroupButtonOptions(
                            selectedColor: kMainColor,
                              buttonWidth: 110,
                              borderRadius: BorderRadius.circular(10)),
                          buttons: ['جديدة','مستلمة','مغلقة'],
                          onSelected: (index,isselected){
                            print(index);
                            //setState(() {
                            typepayController=index.toString();
                            selectedProvider.changeticket(index);
                            getfilter();
                            //});
                          }
                      );
                    }
                ),
              ),
              SizedBox(height: 2,),
              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8,right: 8,
                      top:8.0,bottom: 80),
                  child:
                  Consumer<ticket_vm>(builder: (context, value, child) {
                    return
                      value.isloading==true?
                    Center(
                        child: CircularProgressIndicator()
                    ):
                      value.tickesearchlist.length==0?
                      Center(
                          child: Text(messageNoData)
                      ):Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: value.tickesearchlist.length,
                              itemBuilder: (context, index) {

                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child:
                                          Container(
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(0)
                                        ),
                                        boxShadow: <BoxShadow>[
                                        BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 8.0,
                                        color: Colors.black87.withOpacity(0.2),
                                        ),
                                        ],
                                        color:  Colors.white30,),
                                            child: Center(
                                              child: InkWell(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context)=>
                                                          ticketdetail(
                                                            ticketModel: value.tickesearchlist[index],) // support_view(type: 'only',)
                                                  ));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(color: kWhiteColor),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('#'+value.tickesearchlist[index].idTicket
                                                            ,style: TextStyle(color: kMainColor,
                                                                  fontFamily:kfontfamily2 ),
                                                            ),
                                                            Text('تاريخ فتح التذكرة  '+
                                                                value.tickesearchlist[index].dateOpen.toString()
                                                            ,style: TextStyle(color: kMainColor,
                                                                  fontFamily:kfontfamily2),
                                                            ),

                                                          ],
                                                        ),
                                                        Text(value.tickesearchlist[index].nameEnterprise.toString()
                                                        ,style: TextStyle( fontFamily:kfontfamily2,
                                                          fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        // buildcardExpansion(
                                        //     'تاريخ فتح التذكرة  '+
                                        //         value.tickesearchlist[index].dateOpen,
                                        //     value.tickesearchlist[index].nameEnterprise ,
                                        //     TicketView(
                                        //       ticketModel: value.tickesearchlist[index],
                                        //       //idinvoice: listinvoice[index].idInvoice,
                                        //
                                        //     ))
                                      )),
                                );
                              }),
                        ),
                      ],
                    );
                  }) ,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void getfilter() {
    Provider.of<ticket_vm>(context,listen: false).
    gettypeticket_filter(typepayController);

  }
}
