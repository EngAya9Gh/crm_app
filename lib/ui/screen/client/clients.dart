import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/care/comment_view.dart';
import 'package:crm_smart/ui/screen/client/clientView.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/add_invoice_product.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/ui/widgets/custom_widget/bottomnavigatorbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/tabview.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'addClient.dart';
import 'package:get/get.dart';

class client_dashboard extends StatefulWidget {
   client_dashboard({required this.invoiceModel, Key? key}) : super(key: key);
   InvoiceModel invoiceModel;


  @override
  State<StatefulWidget> createState() => _client_dashboard();
}
  class _client_dashboard extends State<client_dashboard> with TickerProviderStateMixin{
  // final controllerUsers = Get.find<AllUserVMController>();
    late UserModel current ;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    late ClientModel _clientModel;
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

    @override
    void initState()  {
      WidgetsBinding.instance!.addPostFrameCallback((_)async {
        Provider.of<comment_vm>(context, listen: false)
            .getComment(widget.invoiceModel.fkIdClient.toString());
      });
      //check level user
      // Provider.of<client_vm>(context, listen: false)
      //     .getclientByRegoin([]);//list empty that mean
      // //level user all client in country
      // // Provider.of<client_vm>(context, listen: false)
      // //     . getclient_vm();
      // // Provider.of<invoice_vm>(context, listen: false)
      // //     .get_invoicesbyRegoin([]);
      //
      // _invoiceModel= Provider.of<invoice_vm>(context, listen: false)
      //     .get_byIdInvoice(widget.itemapprove.fk_invoice.toString())!;
      //
      // _clientModel= Provider.of<client_vm>(context, listen: false)
      //     .get_byIdClient(widget.itemapprove.fkClient.toString()
      //);
      print("init tabbar");
      super.initState();
  }
  @override void dispose() {
    //Navigator.of(context,rootNavigator: true).pop();
    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
      _clientModel=Provider.of<client_vm>(context,listen: true)
      .listClient.firstWhere((element) =>
      element.idClients==widget.invoiceModel.fkIdClient);

      current = Provider.of<user_vm_provider>(context).currentUser;
      int _tabBarIndex = 0;
     TabController _tabcontroller=TabController(length: 3, vsync: this);
      return DefaultTabController(
      length: 3,
      child:Scaffold(

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
        body: Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.only(top:10,left: 15,right: 15),
           height: MediaQuery.of(context).size.height*0.9,
          child: TabBarView(
            controller: _tabcontroller,
            children: <Widget>[
              ClientView(idclient:widget.invoiceModel.fkIdClient.toString(),
                invoice: widget.invoiceModel,),
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
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context)=>addClient()));
      //
      // },
      // tooltip: 'إضافة عميل',
      // child: Icon(Icons.add),
        //),
      ),
      );
    }
  }

