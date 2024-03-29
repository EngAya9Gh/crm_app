import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/ui/screen/config/add_company.dart';
import 'package:crm_smart/ui/screen/config/update_company.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../core/config/theme/theme.dart';
import '../../../features/company/presentation/pages/comment_company_page.dart';
import '../../../model/companyModel.dart';
class company_view extends StatefulWidget {
  company_view({required this.type, Key? key}) : super(key: key);
  String type;

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<company_view> {
  @override void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      await Provider.of<CompanyProvider>(context,listen: false).getcompany( );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CompanyModel> _listlevel= Provider.of<CompanyProvider>
      (context,listen: true).list_company;
    return Scaffold(
      appBar: AppBar(
        title: Text('الشركات ',style: TextStyle(color: kWhiteColor),),

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
              => addcompany(
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
                      Slidable(
                        key: ValueKey(_listlevel[index].id_Company.toString()),

                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.35,
                          children: [
                            SlidableAction(
                              onPressed: (actionContext) async {
                                Navigator.push(context,
                                    CupertinoPageRoute(
                                        builder: (context)=>updatecompany(
                                          idCompany: _listlevel[index].id_Company.toString(),
                                          nameCompany: _listlevel[index].name_company.toString(),
                                          path_logo: _listlevel[index].path_logo,
                                          // type: widget.type,
                                        )));

                              },
                              backgroundColor: context.colorScheme.primaryContainer,
                              foregroundColor: Colors.white,
                              icon: Icons.edit_rounded,
                              label: 'تعديل',
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      CupertinoPageRoute(
                                          builder: (context)=>comment_company(
                                            idCompany: _listlevel[index].id_Company.toString(),
                                            nameCompany: _listlevel[index].name_company.toString(),

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
                                          Text(_listlevel[index].name_company.toString(),
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
