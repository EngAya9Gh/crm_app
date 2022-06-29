

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/regoin_model.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/privilges/addmanage.dart';
import 'package:crm_smart/ui/screen/privilges/privilge.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_regoin.dart';
import 'addcity.dart';
import 'addmaincity.dart';

class cityview extends StatefulWidget {
  cityview({required this.fkmain, Key? key}) : super(key: key);
  String fkmain;
  @override
  _cityviewState createState() => _cityviewState();
}

 class _cityviewState extends State<cityview> {

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
     await Provider.of<maincity_vm>
        (context,listen: false)
          .getcity(widget.fkmain);
    });
    super.initState();
  }
  List<CityModel> _listlevel=[];
  @override
  Widget build(BuildContext context) {

    _listlevel= Provider.of<maincity_vm>
      (context,listen: true).listcity;
    return Scaffold(
      appBar: AppBar(
        title: Text('المدن',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
      Provider.of<privilge_vm>(context,listen: true)
          .checkprivlge('79')==true ?
      FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context)
              => addcity(
                fkmain: widget.fkmain,
                idregoin: null,
                nameregoin: null,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: kMainColor,):Container(),
      body:
      _listlevel.length==0?
      Center(
          child: Text('')):
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
                                        builder: (context)=>addcity(
                                          fkmain: widget.fkmain,
                                          nameregoin:
                                          _listlevel[index].name_city,
                                          idregoin:
                                          _listlevel[index].id_city,
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
                                    child: Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Center(
                                        child:
                                        Text(_listlevel[index].name_city,
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
