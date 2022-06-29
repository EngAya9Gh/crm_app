

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/privilges/addmanage.dart';
import 'package:crm_smart/ui/screen/privilges/privilge.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_regoin.dart';

class regoinview extends StatefulWidget {
  const regoinview({Key? key}) : super(key: key);

  @override
  _regoinviewState createState() => _regoinviewState();
}

class _regoinviewState extends State<regoinview> {
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      Provider.of<regoin_vm>
      (context,listen: false).getregoin();});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<RegoinModel> _listlevel= Provider.of<regoin_vm>
      (context,listen: true).listregoin;
    return Scaffold(
      appBar: AppBar(
        title: Text('الفروع',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
      // Provider.of<privilge_vm>(context,listen: true)
      //     .checkprivlge('64')==true ?
      FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context)
              => addregoin(
                fk_country: null,
                idregoin: null,
                nameregoin: null,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: kMainColor,),
            //:Container(),
      body:
      _listlevel.length==0?
      Center(
          child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _listlevel.length,
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
                                        builder: (context)=>addregoin(
                                          fk_country: _listlevel[index].fk_country,
                                          nameregoin:
                                          _listlevel[index].name_regoin,
                                          idregoin: _listlevel[index].id_regoin,
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
                                        Text(_listlevel[index].name_regoin,
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
