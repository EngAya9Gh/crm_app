import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/features/clients_list/presentation/widgets/client_section.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabview.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class client_dashboard extends StatefulWidget {
   client_dashboard({required this.invoiceModel,required this.typeinvoice,  Key? key}) : super(key: key);
   InvoiceModel invoiceModel;
   String typeinvoice;

  @override
  State<StatefulWidget> createState() => _client_dashboard();
}
  class _client_dashboard extends State<client_dashboard> with TickerProviderStateMixin{
  // final controllerUsers = Get.find<AllUserVMController>();
    late UserModel current ;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    late ClientModel1? _clientModel=ClientModel1();
    Widget _switchcaseBody(int _selectedIndex){
      var _selectedView;
      switch(_selectedIndex){
        case 0:
          _selectedView=customtabview();
          break;
        case 1:
          _selectedView=Icon(
            Icons.camera,
            size: 150,
          );
          break;
        case 2:
          _selectedView=    Icon(
            Icons.chat,
            size: 150,
          );
          break;
      }
      return _selectedView;
    }
    PreferredSizeWidget _switchcaseAppBar(int _selectedIndex){
    var _selectedView;
    switch(_selectedIndex){
      case 0:
          _selectedView=AppBar( backgroundColor: Colors.white,
          elevation: 0,
          bottom: customtabBar(),);
        break;
      case 1:
        _selectedView=AppBar();
        break;
      case 2:
        _selectedView=AppBar();
        break;
    }
    return _selectedView;
  }


   late TabController _tabcontroller;

    @override
    void initState()  {
      _tabcontroller = TabController(length: 3, vsync: this);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Provider.of<ClientProvider>(context, listen: false)
            .get_byIdClient(widget.invoiceModel.fkIdClient.toString());

        _clientModel=Provider.of<ClientProvider>
            (context, listen: false).currentClientModel.data;
        // _clientModel =
        // await  Provider.of<client_vm>
        //   (context, listen: false)
        //     .get_byIdClient(widget.invoiceModel.fkIdClient.toString()
        // );
        // final list = Provider.of<client_vm>(context,listen: true).listClient;
        // if(list.any((element) =>
        // element.idClients==widget.invoiceModel.fkIdClient))
        //   _clientModel= list.firstWhereOrNull((element) =>
        //   element.idClients==widget.invoiceModel.fkIdClient) ??
        //       _clientModel;
        Provider.of<comment_vm>(context, listen: false)
            .getComment(widget.invoiceModel.fkIdClient.toString());
      });

      super.initState();
  }



  @override void dispose() {
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {

      // _clientModel=Provider.of<client_vm>(context,listen: true)
      //     .listClient.firstWhereOrNull((element) =>
      // element.idClients ==
      //     widget.invoiceModel.fkIdClient)!;



      current = Provider.of<UserProvider>(context).currentUser;
      int _tabBarIndex = 0;

      return DefaultTabController(
      length: 3,
      child:ModalProgressHUD(
        inAsyncCall: Provider.of<ClientProvider>(context, listen: false)
            .isloading,
        child: Scaffold(

          appBar: AppBar(
            backgroundColor: kMainColor,
            title:Text('ملف العميل',style: TextStyle(color: kWhiteColor),)
            ,centerTitle: true,
          bottom:    TabBar(
            labelPadding: const EdgeInsets.only(left: 10,right: 10,top: 2),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabcontroller,
            indicatorColor: kWhiteColor,
            indicatorWeight: 5,
            indicator: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(2),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            //isScrollable: true,
            tabs: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   //crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text('120',
              //       style: TextStyle(
              //       color: _tabBarIndex == 0 ? kMainColor : kUnActiveColor,
              //       fontSize: _tabBarIndex == 0 ? 10 : null,
              //           height:0.2,
              //           fontWeight: FontWeight.bold,
              //           //decoration: TextDecoration.underline,
              //           //decorationThickness: 2,
              //
              //           decorationStyle: TextDecorationStyle.double
              //     ),),
              //     //Icon(Icons.category,color: kMainColor,),
              //     SizedBox(width: 5,),
              //
              //   ],
              // ),
              Text(
                'البيانات',
                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: _tabBarIndex == 0 ?kMainColor : kUnActiveColor,
                //     fontSize: _tabBarIndex == 0 ? 20 : null,
                //     decorationStyle: TextDecorationStyle.double
                // ),
              ),
              Text(
                'الفاتورة ',
                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: _tabBarIndex == 1?kMainColor : kUnActiveColor,
                //     fontSize: _tabBarIndex == 1 ? 20 : null,
                //     decorationStyle: TextDecorationStyle.double
                // ),
              ),
              Text('التعليقات'),

            ],
          ),
          ),
          body:
          Provider.of<ClientProvider>(context, listen: true)
              .isloading==true?
          Container():
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(top:10,left: 10,right: 10),
             height: MediaQuery.of(context).size.height*0.9,
            child: TabBarView(
              controller: _tabcontroller,
              children: <Widget>[

                ClientSection(
                  idclient:widget.invoiceModel.fkIdClient.toString(),
                  invoice: widget.invoiceModel,
                  typeinvoice:widget.typeinvoice
                ),

                InvoiceView(
                  type:'approved',
                  invoice:
                  widget.invoiceModel,
                  //clientmodel: _clientModel,
                ),
                commentView(
                    client: _clientModel,),
              ],
            ),
          ),
         //  appBar: _switchcaseAppBar(0),

         // body:_switchcaseBody(0),
        //   floatingActionButton: FloatingActionButton(
        //     backgroundColor: kMainColor,
        // onPressed: (){
        //
        //   Navigator.push(context, CupertinoPageRoute(
        //       builder: (context)=>addClient()));
        //
        // },
        // tooltip: 'إضافة عميل',
        // child: Icon(Icons.add),
          //),
        ),
      ),
      );
    }
  }

