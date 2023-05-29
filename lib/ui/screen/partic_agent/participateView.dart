

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/ActivityModel.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/participatModel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/reasonmodel.dart';
import 'package:crm_smart/ui/screen/partic_agent/participate_add.dart';
import 'package:crm_smart/ui/screen/privilges/privilge.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/activity_vm.dart';
import '../../../view_model/participate_vm.dart';

class participate_view extends StatefulWidget {
  participate_view({  Key? key}) : super(key: key);


  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<participate_view> {
  @override void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      await Provider.of<participate_vm>(context,listen: false)
          .get_participate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ParticipateModel> list_participate=
        Provider.of<participate_vm>(context,listen: true).list_paricipate;
    return Scaffold(
      appBar: AppBar(
        title: Text('المتعاونين',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
      // Provider.of<privilge_vm>(context,listen: true)
      //     .checkprivlge('74')==true ?
      FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context)
              => addParticipate(
              id_participate: null,
                name_participate: '',
                mobile_participate: '',
                namebank_participate: '',
                numberbank_participate: '',),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: kMainColor,),
      //:Container(),
      body:
      list_participate.length==0?
      Center(
          child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list_participate.length,
          itemBuilder: (BuildContext context, int index) =>
              Builder(
                  builder: (context) =>

                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context)=>addParticipate(
                                          name_participate:list_participate[index].name_participate,
                                          id_participate: list_participate[index].id_participate,
                                          mobile_participate:  list_participate[index].mobile_participate,
                                          namebank_participate: list_participate[index].namebank_participate,
                                          numberbank_participate: list_participate[index].numberbank_participate,
                                          // type: widget.type,
                                        )));
                              },
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
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all( Radius.circular(5)),),

                                    //color: kMainColor,
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                        child:
                                        Text(list_participate[index].name_participate,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: kfontfamily2),),),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
              ),
          //     _listProd.map(
          //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
          // ).toList(),
        ),
      ),
    );
  }
}
