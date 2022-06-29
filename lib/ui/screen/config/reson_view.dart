

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/levelmodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/reasonmodel.dart';
import 'package:crm_smart/ui/screen/privilges/privilge.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addreson.dart';
class resoan_view extends StatefulWidget {
  resoan_view({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<resoan_view> {
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{

     await Provider.of<typeclient>
      (context,listen: false).getreasons(widget.type);});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ReasonModel> _listlevel= Provider.of<typeclient>
      (context,listen: true).type_of_out;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type=='client'?
        'أسباب الانسحاب':'أنواع التذاكر',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
          widget.type=='client'?
      Provider.of<privilge_vm>(context,listen: true)
          .checkprivlge('73')==true ?
      FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context)
              => addresaon(
                idReason: null,
                nameReason: null,
                type: widget.type,),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: kMainColor,):Container():
          Provider.of<privilge_vm>(context,listen: true)
              .checkprivlge('74')==true ? FloatingActionButton(
            child:Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                  => addresaon(
                    type: widget.type,
                    idReason: null,
                    nameReason: null,),
                  fullscreenDialog: true,
                ),
              );
            },
            backgroundColor: kMainColor,):Container(),
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
                                        builder: (context)=>addresaon(
                                          nameReason:_listlevel[index].nameReason,
                                          idReason: _listlevel[index].idReason,
                                          type: widget.type,
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
                                        Text(_listlevel[index].nameReason,
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
