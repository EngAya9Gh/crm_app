

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/ActivityModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/config/theme/theme.dart';
import '../../../view_model/activity_vm.dart';
import 'add_activity.dart';
class activity_view extends StatefulWidget {
  activity_view({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<activity_view> {
  @override void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      await Provider.of<ActivityProvider>(context,listen: false).getActivities( );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ActivityModel> _listlevel= Provider.of<ActivityProvider>
      (context,listen: true).activitiesList;
    return Scaffold(
      appBar: AppBar(
        title: Text('النشاط',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      floatingActionButton:
      // Provider.of<privilge_vm>(context,listen: true)
      //     .checkprivlge('74')==true ?
      FloatingActionButton(
        child:Icon(Icons.add,color: AppColors.white),
        onPressed: (){
          Navigator.push(
            context,
            CupertinoPageRoute<void>(
              builder: (BuildContext context)
              => addractivity(
                // type: widget.type,
                nameActv: '', idActivity: null,),
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
                                    CupertinoPageRoute(
                                        builder: (context)=>addractivity(
                                           nameActv:_listlevel[index].name_activity_type,
                                           idActivity: _listlevel[index].id_activity_type,
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
                                        Text(_listlevel[index].name_activity_type,
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
