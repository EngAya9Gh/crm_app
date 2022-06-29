import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/screen/client/transfer_client.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../labeltext.dart';
import 'dart:ui' as myui;
import 'package:intl/intl.dart';
class editclient extends StatefulWidget {
   editclient({required this.itemClient, required this.fkclient,required this.fkuser, Key? key}) : super(key: key);
   String fkclient,fkuser;
   ClientModel itemClient;
  @override
  _editclientState createState() => _editclientState();
}

class _editclientState extends State<editclient> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameEnterpriseController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController typejobController = TextEditingController();
  String? cityController =null;
  late CityModel citymodel=
  CityModel(
      id_city: widget.itemClient.city.toString(),
      name_city: widget.itemClient.name_city.toString(),
      fk_maincity: widget.itemClient.id_maincity.toString());
  final TextEditingController usernameclientController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController regoinController = TextEditingController();
  final TextEditingController offerpriceController = TextEditingController();
  final TextEditingController resaonController = TextEditingController();
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  late typeclient typeclient_provider;
  late final UserModel currentUser;
  late String? namemanage='';
  @override void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    typejobController.dispose();
    locationController.dispose();
    regoinController.dispose();
    offerpriceController.dispose();
    resaonController.dispose();
    valueBackController.dispose();
    descresaonController.dispose();
    usernameclientController.dispose();
    super.dispose();
  }
  @override
  void initState()  {

    currentUser=Provider.of<user_vm_provider>(context,listen: false)
        .currentUser;
    nameclientController.text=widget.itemClient.nameClient!.toString();
    nameEnterpriseController.text=widget.itemClient.nameEnterprise!.toString();
    mobileController.text=widget.itemClient.mobile!.toString();
    typejobController.text=widget.itemClient.typeJob!.toString();
    locationController.text=widget.itemClient.location!.toString();
    regoinController.text=widget.itemClient.name_regoin!.toString();
    usernameclientController.text=widget.itemClient.clientusername==null?'':
        widget.itemClient.clientusername.toString();
    //////////////////////////////////////////////////////////
    ////////////////////////////////////////
    //print( typeclient_provider.selectedValuemanag);
    offerpriceController.text=widget.itemClient.offer_price==null
        ||widget.itemClient.offer_price==""
        ?"":widget.itemClient.offer_price!;
    print(offerpriceController.text);
    // resaonController.text=widget.itemClient.reasonChange==null||widget.itemClient.reasonChange==""
    //     ? null:widget.itemClient.reasonChange!.toString();//

    // valueBackController.text=widget.itemClient.value_back==null||widget.itemClient.value_back==""
    //     ?"":widget.itemClient.value_back!.toString();

    // descresaonController.text=widget.itemClient.desc_reason==null||widget.itemClient.desc_reason==""
    //     ?"":widget.itemClient.desc_reason!.toString();

    WidgetsBinding.instance!.addPostFrameCallback((_)async{
     await Provider.of<maincity_vm>(context,listen: false).getcityAll();
      Provider.of<maincity_vm>(context,listen: false)
      .changevalue(widget.itemClient.city.toString());
      cityController=
          // Provider.of<maincity_vm>(context,listen: false).selectedValuemanag.toString();
      widget.itemClient.city!.toString();
      citymodel=CityModel(
         id_city: widget.itemClient.city.toString(),
         name_city: widget.itemClient.name_city.toString(),
         fk_maincity: widget.itemClient.id_maincity.toString());
      // Add Your Code here.
      bool ism=widget.itemClient.ismarketing=='1'?true:false;
      Provider.of<switch_provider>(
          context,
          listen: false).changeboolValue(ism);
      typeclient_provider=Provider.of<typeclient>(context,listen: false);
      typeclient_provider.type_of_client =
      // widget.itemClient.typeClient!="مشترك"&&widget.itemClient.typeClient!="منسحب"?
      widget.itemClient.typeClient=="تفاوض"||widget.itemClient.typeClient=="عرض سعر"
          || widget.itemClient.typeClient=="مستبعد" ?
      ['تفاوض','عرض سعر','مستبعد'] :[];
      print( widget.itemClient.typeClient);
      // widget.itemClient.typeClient=="مشترك"?
      // ['منسحب','مشترك']//'مستبعد'
      //     :
      // widget.itemClient.typeClient=="منسحب"?
      // ['مشترك','منسحب']
      //     :['تفاوض','عرض سعر','مستبعد'];
      // widget.itemClient.typeClient!="مشترك"&&widget.itemClient.typeClient!="منسحب"?
      widget.itemClient.typeClient=="تفاوض"||widget.itemClient.typeClient=="عرض سعر"||
      widget.itemClient.typeClient=="مستبعد"?

      typeclient_provider.selectedValuemanag=
          widget.itemClient.typeClient.toString():null;
      typeclient_provider.changevalue(typeclient_provider.selectedValuemanag);
      //typeclient_provider.getreasons('client');
      // typeclient_provider.selectedValuemanag=
      //     widget.itemClient.typeClient.toString();

      // typeclient_provider.selectedValueOut=typeclient_provider.selectedValuemanag=="منسحب"?
      // widget.itemClient.reasonChange==null?
      // null:widget.itemClient.reasonChange!.toString()
      //     :null;
      //
      // String val=typeclient_provider.selectedValuemanag=="منسحب"
      //     ?widget.itemClient.dateChangetype.toString()
      //     :formatter.format(DateTime.now());
      //_currentDate=DateTime.parse(val);
      // Provider.of<switch_provider>(
      //     context,
      //     listen: false).changeboolValue(false);
    });

    super.initState();
  }
@override
void didChangeDependencies() {
  // Future.delayed(Duration(milliseconds: 30)).then((_) async {
  //
  // });

    super.didChangeDependencies();
  }
    @override
  Widget build(BuildContext context) {
      typeclient_provider=Provider.of<typeclient>(context,listen: true);
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kWhiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
        IconButton(
        onPressed: () {
        if (_globalKey.currentState!.validate()) {
        _globalKey.currentState!.save();
        if(Provider.of<maincity_vm>(context,listen: false)
          .selectedValuemanag!=null) {
        Provider.of<LoadProvider>(context, listen: false)
            .changebooladdclient(true);
        String ismarket= Provider.of<switch_provider>(
            context,
            listen: false).isSwitched==true?'1':'0';

        print(ismarket);

        Map<String,dynamic> body={};
        if(typeclient_provider.selectedValuemanag == "عرض سعر")
        body={"date_price": formatter.format(DateTime.now()), };
       if( namemanage!=null)
         body.addAll({
           "date_changetype": //typeclient_provider.selectedValuemanag == "منسحب"?
            formatter.format(_currentDate)
         },//:"null",
          );
        body.addAll({
          'name_client': nameclientController.text,
          'name_enterprise': nameEnterpriseController.text,
          'type_job': typejobController.text,
          'city': cityController,
          'location': locationController.text.toString(),
          //"fk_regoin":currentUser.fkRegoin==null?"null" :currentUser.fkRegoin,
          //"date_create": ,
          "type_client": widget.itemClient.typeClient!="مشترك"
              &&widget.itemClient.typeClient!="منسحب"?
          typeclient_provider.selectedValuemanag:widget.itemClient.typeClient!,
          //"fk_user":widget.fkuser,
          // "date_transfer":,
          "mobile": mobileController.text,
          "clientusername":usernameclientController.text,
          "offer_price": offerpriceController.text,
          "reason_change":resaonController.text,
          // typeclient_provider.selectedValuemanag == "منسحب"
          //     ? typeclient_provider.selectedValueOut
          //     :
          "ismarketing":  ismarket,
          "user_do": Provider
              .of<user_vm_provider>(context, listen: false)
              .currentUser
              .idUser
              .toString(),
          // "desc_reason":  typeclient_provider.selectedValuemanag == "منسحب"
          //     ?descresaonController.text:"",
          //
          // "value_back": typeclient_provider.selectedValuemanag == "منسحب"
          //     ?valueBackController.text:"",
        });
        print('$body');
        Provider.of<client_vm>(context, listen: false)
            .updateclient_vm(body, widget.itemClient.idClients)
            .then((value) =>
            value != "false"
            ? clear(context)
            : error(context)
        );
      }}else{
          _scaffoldKey.currentState!.showSnackBar(
              SnackBar(content: Text('من فضلك حدد مدينة')));
        }
      }, icon: Icon(Icons.check,color: kWhiteColor)),
          ],
        ),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child:  Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: 10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Directionality(//container shadow
                  textDirection:myui.TextDirection.rtl ,
                  child: Column(
                    //textDirection: TextDirection.rtl,

                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RowEdit(name: label_cliententerprise, des: 'required'),

                      EditTextFormField(
                        obscureText: false,
                        hintText: label_cliententerprise,
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: nameEnterpriseController, //اسم المؤسسة
                        //label: label_client,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      RowEdit(name: label_clientname, des: 'required'),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: label_clientname,
                        obscureText: false,
                        controller: nameclientController,
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      RowEdit(name: label_client_typejob, des: 'Required') ,
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      EditTextFormField(
                        hintText: label_client_typejob,
                        obscureText: false,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: typejobController, //اسم المؤسسة
                        label: label_client_typejob,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      //admin

                      RowEdit(name: label_clientcity, des: 'Required'),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0,right: 8),
                      //   child: Consumer<maincity_vm>(
                      //       builder: (context, cart, child){
                      //         return DropdownButton(
                      //           isExpanded: true,
                      //           hint: Text(label_clientcity),
                      //           items: cart.listcity.map((city) {
                      //             return DropdownMenuItem(
                      //               child: Text(city.name_city), //label of item
                      //               value: city.id_city, //value of item
                      //             );
                      //           }).toList(),
                      //           value:cart.selectedValuemanag,
                      //           onChanged:(value) {
                      //             cityController.text=value.toString();
                      //             cart.changevalue(value.toString());
                      //           },
                      //         );}
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<maincity_vm>(
                          builder: (context, cart, child){
                            return  DropdownSearch<CityModel>(
                              mode: Mode.DIALOG,
                              label: "المدن",
                              validator: (val){

                                if(val==null)
                                  return 'من فضلك حدد اسم مدينة';
                              },
                              selectedItem: citymodel,
                              filterFn: (user, filter) => user!.getfilteruser(filter!),
                              items: cart.listcity,
                              itemAsString:
                                  ( u) => u!.userAsString(),
                              onChanged: (data) =>
                              cityController=data!.id_city,//print(data!.nameUser),
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "حدد مدينة",
                                contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 5),
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      ),
                      //manage
                      SizedBox(
                        height: 5,
                      ),
                      RowEdit(name: label_clientmobile, des: 'Required'),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: '+966000000000',
                        obscureText: false,
                        controller: mobileController,
                      ),
                      //RowEdit(name: 'Image', des: ''),
                      SizedBox(
                        height: 15,
                      ),

                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      RowEdit(name: label_clientlocation, des: ''),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?
                      Container():EditTextFormField(
                        hintText: 'location',
                        obscureText: false,
                        controller: locationController,
                      ),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('76')==true ?
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: label_usernameclient,
                        obscureText: false,
                        controller: usernameclientController,
                      ):Container(),
                      ////////////////////////////////////////////////
                      SizedBox(
                        height: 15,
                      ),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('37')==true ?
                      Center(
                        child: Consumer<switch_provider>(
                          builder: (context, isSwitched, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Switch(
                                    activeTrackColor:
                                    kMainColor.withAlpha(90),
                                    activeColor: kMainColor,
                                    value: isSwitched.isSwitched,
                                    onChanged: (value) {
                                      print(value);
                                      print(value.toString());

                                      //valtaxrate = value;
                                      isSwitched.changeboolValue(value);
                                    }),
                                Text(marketlabel),

                              ],
                            );
                          },
                        ),
                      ):Container(),
                      SizedBox(
                        height: 15,
                      ),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      widget.itemClient.typeClient!="مشترك"&&widget.itemClient.typeClient!="منسحب"?
                      RowEdit(name: label_clienttype, des: ""):Container(),
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      widget.itemClient.typeClient!="مشترك"&&widget.itemClient.typeClient!="منسحب"?

                      DropdownButton(
                      isExpanded: true,
                      //hint: Text("حدد حالة العميل"),
                      items: typeclient_provider.type_of_client.map((level_one) {
                            return DropdownMenuItem(

                              child: Text(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                      value:typeclient_provider.selectedValuemanag,
                      onChanged:(value) {
                        namemanage=value.toString();
                        typeclient_provider.changevalue(value.toString());
                        // if(value=="منسحب") {
                        //   showDialog<void>(
                        //       context: context,
                        //       builder: (context) => dialog);
                        // }
                      },
                    ):Container(),
                      SizedBox(height: 2,),

                      // Provider.of<privilge_vm>(context,listen: true)
                      //     .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                      //     .checkprivlge('28')==true ?
                      // typeclient_provider.selectedValuemanag=="منسحب"?
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //       backgroundColor: MaterialStateProperty.all(
                      //           kMainColor)),
                      //   onPressed: () {
                      //     showDialog<void>(
                      //         context: context,
                      //         builder: (context) => dialog);
                      //   },
                      //   child: Text('خيارات الإنسحاب'),
                      // ):
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      typeclient_provider.selectedValuemanag=="عرض سعر"?
                      EditTextFormField(
                        hintText: 'عرض سعر',
                        obscureText: false,
                        controller: offerpriceController,
                      ):
                      Provider.of<privilge_vm>(context,listen: true)
                          .checkprivlge('27')==true ?Container():
                      typeclient_provider.selectedValuemanag=="مستبعد"?
                      EditTextFormField(
                        hintText: 'سبب الاستبعاد',
                        obscureText: false,
                        controller: resaonController,
                      ):Container(),
                          //:Container(),
                      // Provider.of<privilge_vm>(context,listen: true)
                      //     .checkprivlge('27')==true||  Provider.of<privilge_vm>(context,listen: true)
                      //     .checkprivlge('28')==true ?
                      // typeclient_provider.selectedValuemanag=="عرض سعر"
                      //     || typeclient_provider.selectedValuemanag=="تفاوض"?
                      // Padding(
                      //   padding: const EdgeInsets.all(6.0),
                      //   child: Center(
                      //     child:   ElevatedButton(
                      //       style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(
                      //               kMainColor)),
                      //       onPressed: () {
                      //
                      //         Navigator.push(context,MaterialPageRoute(
                      //             builder: (context)=>transferClient(
                      //            name_enterprise:  widget.itemClient.nameEnterprise.toString(),
                      //              idclient:   widget.itemClient.idClients.toString(),
                      //             type: "client",),fullscreenDialog: true
                      //
                      //         ));
                      //       },
                      //       child: Text('تحويل العميل'),
                      //     ),
                      //   ),
                      // ):Text(""):Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }

  clear(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    Navigator.pop(context);
    // _scaffoldKey.currentState!.showSnackBar(
    //     SnackBar(content: Text("تم الحفظ"))
    // );
  }

  error(BuildContext context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text("حدث خطأ ما"))
    );

  }
  DateTime _currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');

  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {
    String output = formatter.format(currentDate);

    final DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2080));
    if (pickedDate != null )//&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;

      });
  }


}
