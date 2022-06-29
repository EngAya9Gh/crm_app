

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
import 'addmaincity.dart';
import 'cityview.dart';

class maincityview extends StatefulWidget {
  const maincityview({Key? key}) : super(key: key);

  @override
  _maincityviewState createState() => _maincityviewState();
}

class _maincityviewState extends State<maincityview> {

  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{
      Provider.of<maincity_vm>
        (context,listen: false).getmaincity();
          //.getcity('config/getcity.php?fk_maincity');
    });
    super.initState();
  }
  List<MainCityModel> _listlevel=[];
  @override
  Widget build(BuildContext context) {
    _listlevel= Provider.of<maincity_vm>
      (context,listen: true).listmaincity;
    return Scaffold(
      appBar: AppBar(
        title: Text('المناطق',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
      Provider.of<privilge_vm>(context,listen: true)
          .checkprivlge('78')==true ?
      FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context)
              => addmaincity(
                fkcountry: null,
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
                                        builder: (context)=>
                                            cityview(
                                          fkmain: _listlevel[index].id_maincity,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Center(
                                                child:
                                                Text(_listlevel[index].namemaincity,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: kfontfamily2),),),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                             IconButton(
                                              icon: Icon(Icons.edit, color: kMainColor,),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                    builder: (BuildContext context)
                                                    => addmaincity(
                                                      fkcountry: _listlevel[index].fk_country,
                                                      idregoin: _listlevel[index].id_maincity,
                                                      nameregoin: _listlevel[index].namemaincity,
                                                    ),
                                                    fullscreenDialog: true,
                                                  ),
                                                );
                                            },
                                              //onPressed: BOOKMARK,
                                            ),
                                          ],
                                        ),
                                      ],
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
