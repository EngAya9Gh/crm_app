 import 'package:crm_smart/model/usertestmodel.dart';
import 'package:crm_smart/ui/screen/user/testusers_show.dart';
import 'package:crm_smart/ui/screen/user/usertest_add.dart';
import 'package:crm_smart/view_model/usertest_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class usertest_view extends StatefulWidget {
   const usertest_view({Key? key}) : super(key: key);

   @override
   _usertest_viewState createState() => _usertest_viewState();
 }

 class _usertest_viewState extends State<usertest_view> {
   List<UserTestModel> list_ticket=[];
   @override void initState() {
     WidgetsBinding.instance!.addPostFrameCallback((_)async{
      await Provider.of<usertest_vm>(context,listen: false).getusertest_vm();
     });
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     list_ticket=Provider.of<usertest_vm>(context,listen: true)
         .listProduct;
    print(list_ticket.length);
     return Scaffold(
       floatingActionButton:
       FloatingActionButton(
         backgroundColor: kMainColor,
         onPressed: () {
           Navigator.push(context,
               MaterialPageRoute(
               builder: (context)=> addusertest(idregoin: null, nameusertest: '',)));
         },
         tooltip: 'إضافة ',
         child: Icon(Icons.add),
       ),
       appBar: AppBar(title: Text('يوزرات تجريبية',style: TextStyle(color: kWhiteColor),),centerTitle: true,),
       body: SafeArea(
         child: ModalProgressHUD(
           
           inAsyncCall: Provider.of<usertest_vm>(context,listen: true)
               .isloading,
           child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child:
                  Container(
                    height: 90,
                    child: ListView.builder(
                    //  shrinkWrap: true,
                      itemCount: list_ticket.length,
                      itemBuilder: (BuildContext context, int index)=>
                          Builder(
                              builder: (context)=>
                                  Container(
                                    //height: 20,
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(),
                                      color:Colors.white,
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context)=>
                                                      testuser_show(
                                                        userTestModel:list_ticket[index],
                                                      )));

                                        },
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                    list_ticket[index].nameusertest.toString()
                                                ,style: TextStyle(fontFamily: kfontfamily2

                                                ,fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ) ,
                    ),
                  ),
                )
              ],
           ),
         ),
       ),
     );
   }
 }

