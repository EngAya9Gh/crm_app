


import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class config_view extends StatefulWidget {
   config_view({Key? key}) : super(key: key);

  @override
  _config_viewState createState() => _config_viewState();
}

class _config_viewState extends State<config_view> {
  TextEditingController _controllertax=TextEditingController();

  TextEditingController _controllertarget=TextEditingController();

  TextEditingController _controllerdateinstall=TextEditingController();
  TextEditingController _controllerperiod_commincation3=TextEditingController();
  TextEditingController _controllerperiod_commincation1=TextEditingController();
  TextEditingController _controllerperiod_commincation2=TextEditingController();
  TextEditingController _controllerinstall=TextEditingController();
  TextEditingController _controllercomplete_install=TextEditingController();
  TextEditingController _controller_counter=TextEditingController();
  late ConfigModel taxrate;
  final _globalKey = GlobalKey<FormState>();
 double h=0,w=0;
  @override void initState() {


     WidgetsBinding.instance!.addPostFrameCallback((_){

     });

    print("build 3 add");
    // taxrate =
    //     _listconfg.firstWhere((element) => element.name_config == 'taxrate');
    super.initState();
  }
  @override void didChangeDependencies() {

    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      List<ConfigModel> _listconfg =
          Provider.of<config_vm>(context, listen: false).listofconfig;

      taxrate =
          _listconfg.firstWhere((element) => element.name_config == 'taxrate');
      _controllertax.text = taxrate.value_config.toString();

      _controllertarget.text =
          _listconfg
              .firstWhere((element) => element.name_config == 'target')
              .value_config;

      _controllerdateinstall.text =
          _listconfg
              .firstWhere((element) => element.name_config == 'dateinstall')
              .value_config;
      _controllerinstall.text =
          _listconfg
              .firstWhere((element) => element.name_config == 'ticket')
              .value_config;
      _controllercomplete_install.text =
          _listconfg
              .firstWhere((element) =>
          element.name_config == 'period_complete_install')
              .value_config;
      //////////////////////////////////////////////////////////////////////////////////////
      _controllerperiod_commincation1.text =
          _listconfg
              .firstWhere((element) =>
          element.name_config == 'period_commincation1')
              .value_config;

      _controllerperiod_commincation2.text =
          _listconfg
              .firstWhere((element) =>
          element.name_config == 'period_commincation2')
              .value_config;
      _controllerperiod_commincation3.text =
          _listconfg
              .firstWhere((element) =>
          element.name_config == 'period_commincation3')
              .value_config;
      _controller_counter.text =
          _listconfg
              .firstWhere((element) => element.name_config == 'counter')
              .value_config;
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    h=50;
    w=90;
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
              onPressed: (){
      if (_globalKey.currentState!.validate()) {
        _globalKey.currentState!.save();
                for(int i=0;i< Provider.of<config_vm>(context,listen: false)
                    .listofconfig.length;i++){
                  switch(Provider.of<config_vm>(context,listen: false)
                      .listofconfig[i].name_config){
                    case 'taxrate':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllertax.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      continue;
                      //break;
                    case 'target':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllertarget.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                    case 'dateinstall':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllerdateinstall.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'period_commincation3':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllerperiod_commincation3.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'period_commincation2':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllerperiod_commincation2.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'period_commincation1':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllerperiod_commincation1.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'ticket':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllerinstall.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'period_complete_install':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controllercomplete_install.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                      case 'counter':
                      Provider.of<config_vm>(context,listen: false)
                          .updateConfig_vm({'value_config':_controller_counter.text},
                          Provider.of<config_vm>(context,listen: false)
                              .listofconfig[i].id_config);
                      break;
                  }

                  //     .updatepriv_vm(
                  //     Provider.of<privilge_vm>(context,listen: false)
                  //         .privilgelist[i].fkPrivileg,
                  //     Provider.of<privilge_vm>(context,listen: false)
                  //         .privilgelist[i].isCheck);
                }
        Provider.of<config_vm>(context,listen: false).getAllConfig();
                Navigator.pop(context);
      }

              }, icon:Icon( Icons.check_rounded,color: kWhiteColor,)),
        ],
      ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0,right: 10,left: 10,bottom: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                 key: _globalKey,
                child: ContainerShadows(
                  margin: EdgeInsets.only(),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RowEdit(name: 'المبيعات', des: ''),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(' ضريبة الدولة    '),
                          // SizedBox(width: 5,),
                          Flexible(
                            child: CustomFormField(

                              read: false,
                              radius: 10,
                              // maxline: 3,
                              vaild: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a value ';
                                }
                              },
                              con: _controllertax,
                              label: "% ",
                              hintText: '%',
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 15,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //
                      //   children: [
                      //     Text('التاركيت         '),
                      //     Flexible(
                      //       child: CustomFormField(
                      //         read: false,
                      //         radius: 10,
                      //         //maxline: 3,
                      //         vaild: (value) {
                      //           if (value!.isEmpty) {
                      //             return 'Please enter a value ';
                      //           }
                      //         },
                      //         con: _controllertarget,
                      //         label: "تاركيت ",
                      //         hintText: '',
                      //       ),
                      //     ),
                      //     Text(' * 6 '),
                      //   ],
                      // ),
                      SizedBox(height: 15,),

                      RowEdit(name: '   الدعم الفني', des: ''),
                      Text('  فترة السماح لتحديد موعد التركيب للعميل'),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerdateinstall,
                        label: " ساعة",
                        hintText: 'ساعة',
                      ),

                      Text('فترة السماح لإتمام التركيب للعميل '),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllercomplete_install,
                        label: " ساعة",
                        hintText: 'ساعة',
                      ),

                      SizedBox(height: 15,),

                      RowEdit(name: 'العناية بالعملاء ', des: ''),
                      Text('فترة السماح للترحيب مع العميل'),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerperiod_commincation1,
                        label: "ساعة",
                        hintText: 'ساعة',
                      ),
                      Text('فترة السماح لجودة التركيب والتدريب'),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerperiod_commincation2,
                        label: "ساعة ",
                        hintText: 'ساعة',
                      ),
                      Text('فترة السماح للاتصال الدوري للعميل'),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerperiod_commincation3,
                        label: "يوم ",
                        hintText: 'يوم',
                      ),
                      Text('فترة السماح لاستلام التذكرة الجديدة '),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controllerinstall,
                        label: " يوم",
                        hintText: 'يوم',
                      ),
                      Text('فترة السماح للتحصيل من العميل'),
                      CustomFormField(
                        read: false,
                        radius: 10,
                        // maxline: 3,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a value ';
                          }
                        },
                        con: _controller_counter,
                        label: "يوم ",
                        hintText: 'يوم',
                      ),
//فترة السماح للتواصل الثالث "الاتصال الدوري" للعميل
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    );
  }
}
