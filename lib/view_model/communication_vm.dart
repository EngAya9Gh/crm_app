



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class communication_vm extends ChangeNotifier{

  List<CommunicationModel> listCommunication=[];
  List<CommunicationModel> list_wrong_number=[];
  List<CommunicationModel> list_not_use=[];
  List<CommunicationModel> listCommunicationrepeat=[];
  List<CommunicationModel> listCommunicationInstall=[];
  List<CommunicationModel> listCommunicationWelcome=[];
  List<CommunicationModel> listCommunicationClient=[];
  List<CommunicationModel> listinstallnumber=[];
  List<CommunicationModel> listwelcomenumber=[];
  UserModel? usercurrent;

  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }
  bool isloading=false;
  int selectedtypeinstall=0;

  void changeinstall(int s){
    selectedtypeinstall=s;
    notifyListeners();
  }
  void getCommunicationclient(String fk_client) {
    listCommunicationClient=[];
    notifyListeners();
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.fkClient==fk_client&&element.dateCommunication!=null)
          listCommunicationClient.add(element);
      });
    }
      notifyListeners();
  }
  void isloadval(bool val){
    isload=val;
    notifyListeners();
  }
  Future<void> get_wrong_using(String type) async {
     List<CommunicationModel> _list=[];
     // list_wrong_number=[];
    isloading=true;
    notifyListeners();
    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'reports/wrong_using.php?fk_country=${usercurrent!.fkCountry.toString()}&type=$type');

    for (int i = 0; i < data.length; i++) {
      _list
          .add(CommunicationModel.fromJson(data[i]));
    }
    if(type=='use') {
      list_not_use=[];
      list_not_use=List.from(_list);
    }else{
      list_wrong_number=[];
      list_wrong_number=List.from(_list);
    }

     isloading=false;
     notifyListeners();
  }
 Future<void> getCommunicationclientrepeat(String fk_client) async{
    listCommunicationClient=[];
    List<CommunicationModel> list=[];
    isloading=true;
    notifyListeners();
    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'care/view_communcation.php?fk_client=${fk_client}');
    print(data);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationClient
            .add(CommunicationModel.fromJson(data[i]));
      }
      if(listCommunicationClient.isNotEmpty){
        listCommunicationClient.forEach((element) {
          if(element.fkClient==fk_client
              &&element.dateCommunication!=null&&
              element.typeCommuncation=='دوري'
          //&&element.fkUser==null
          ) list.add(element);
        });

      }
      listCommunicationClient= List.from(list);
      isloading=false;
      notifyListeners();
  }}
  List<CommunicationModel> listCommunicationWelcome_temp=[];
  void getcommtype_filter(String? filter,String? regoin)async{
    listCommunicationWelcome=[];
    isloading=true;
    notifyListeners();
   if(listCommunicationWelcome_temp.isEmpty) await getCommunicationWelcome();
    listCommunicationWelcome =List.from(listCommunicationWelcome_temp) ;

    List<CommunicationModel> _listInvoicesAccept=[];
    if(regoin==null||regoin=='0') {
      print(filter);
      if(listCommunicationWelcome.isNotEmpty){
        if(filter=='الكل') {
          _listInvoicesAccept =List.from(listCommunicationWelcome) ;
          print('serch الكل');
        }
        if(filter=='تم الترحيب')
          listCommunicationWelcome.forEach((element) {

            if( element.dateCommunication!=null) {
              _listInvoicesAccept.add(element);
              print('serch تم');
            }
          });
        if(filter=='لم يتم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if( element.dateCommunication==null) {
              _listInvoicesAccept.add(element);
              print('serch لم يتم الترحيب');

            }
          });
      }}
    else{
      if(listCommunicationWelcome.isNotEmpty){
        if(filter=='الكل')
          listCommunicationWelcome.forEach((element) {
            if(element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');

            }
          });

        if(filter=='تم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if( element.dateCommunication!=null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='لم يتم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if( element.dateCommunication==null
                &&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');

            }
          });
      }
    }
    listCommunicationWelcome=List.from(_listInvoicesAccept) ;
    isloading=false;
    notifyListeners();
  }

  List<CommunicationModel> listCommunicationInstall_temp=[];
  List<CommunicationModel> listCommunicationInstall2_temp=[];
   void getinstalltype_filter(String? filter,String? regoin ,int typefilter)async{
     listCommunicationInstall=[];
     isloading=true;
     notifyListeners();

    if(listCommunicationInstall_temp.isEmpty&&typefilter==1)
      await getCommunicationInstall(typefilter);
    if(listCommunicationInstall2_temp.isEmpty&&typefilter==2)
      await getCommunicationInstall(typefilter);
    if(typefilter==1)
    listCommunicationInstall =List.from(listCommunicationInstall_temp) ;
     if(typefilter==2)
       listCommunicationInstall =List.from(listCommunicationInstall2_temp) ;

    List<CommunicationModel> _listInvoicesAccept=[];
    print('regoin');
    print(regoin);
    if(regoin=='0'||regoin==null) {

      if(listCommunicationInstall.isNotEmpty){
        if(filter=='الكل') {
          _listInvoicesAccept =List.from(listCommunicationInstall) ;
          print('serch الكل');
        }
        if(filter=='تم التأكد من الجودة')
          listCommunicationInstall.forEach((element) {

            if( element.dateCommunication!=null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');

            }
          });
        if(filter=='انتظار الجودة')
          listCommunicationInstall.forEach((element) {
            if( element.dateCommunication==null) {
              _listInvoicesAccept.add(element);
              print('serch لم يتم التأكد ');

            }
          });
      }}
    else{
      if(listCommunicationInstall.isNotEmpty){
        if(filter=='الكل')
          listCommunicationInstall.forEach((element) {
            if(element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');

            }
          });

        if(filter=='تم التأكد من الجودة')
          listCommunicationInstall.forEach((element) {
            if( element.dateCommunication!=null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='انتظار الجودة')
          listCommunicationInstall.forEach((element) {
            if( element.dateCommunication==null
                &&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin لم يتم التأكد ');

            }
          });
      }
    }

    listCommunicationInstall=List.from(_listInvoicesAccept) ;
    isloading=false;
    notifyListeners();
  }
  Future<void> searchwaitcare(String productName) async {
    List<CommunicationModel> _listInvoicesAccept=[];
    List<CommunicationModel> temp=List.from(listCommunicationrepeat);
    // code to convert the first character to uppercase
    String searchKey =productName;//
    if(productName.isNotEmpty){
      if(listCommunicationrepeat.isNotEmpty ){
        listCommunicationrepeat.forEach((element) {
          if(element.nameEnterprise.toString().contains(searchKey,0)
              || element.mobile.toString().contains(searchKey,0)
              || element.nameClient.toString().contains(searchKey,0)
          )
            _listInvoicesAccept.add(element);
        });
        listCommunicationrepeat=List.from(_listInvoicesAccept);
      }}
    else listCommunicationrepeat=List.from(temp);
    notifyListeners();
  }
  //searchwelcome
  Future<void> searchwelcome(String productName,String? type) async {
    List<CommunicationModel> _listInvoicesAccept=[];
    // code to convert the first character to uppercase
    String searchKey =productName;//
    switch(type){
      case 'welcome':
    if(productName.isNotEmpty){
      if(listCommunicationWelcome.isNotEmpty ){
        listCommunicationWelcome.forEach((element) {
          if(element.nameEnterprise.contains(searchKey,0)
              || element.mobile.toString().contains(searchKey,0)
              ||element.nameClient.toString().contains(searchKey,0)
          )
            _listInvoicesAccept.add(element);
        });
        listCommunicationWelcome=_listInvoicesAccept;
      }}
    else getCommunicationWelcome();
    break;

      case 'install':
        if(productName.isNotEmpty){
          if(listCommunicationInstall.isNotEmpty ){
            listCommunicationInstall.forEach((element) {
              if(element.nameEnterprise.contains(searchKey,0)
                  || element.mobile.toString().contains(searchKey,0)
                  ||element.nameClient.toString().contains(searchKey,0)
              )
                _listInvoicesAccept.add(element);
            });
            listCommunicationInstall=_listInvoicesAccept;
          }}
        else getCommunicationInstall(0);//;
        break;
    }
    //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }
  void getCommunicationInstallednumber() {

    listinstallnumber=[];
    notifyListeners();

    if(listCommunicationInstall.isNotEmpty){
    listCommunicationInstall.forEach((element) {
    if(element.fkUser==null)
      listinstallnumber.add(element) ;
    });
    }
      //notifyListeners();
  }
  void getCommunicationwelcomenumber() {

    listwelcomenumber=[];
    notifyListeners();

    if(listCommunicationWelcome.isNotEmpty){
      listCommunicationWelcome.forEach((element) {
    if(element.fkUser==null)
      listwelcomenumber.add(element) ;
    });}
     notifyListeners();
  }
 Future <void> getCommunicationInstall(int type) async{
   listCommunicationInstall_temp=[];
   listCommunicationInstall2_temp=[];
    isloading=true;
    notifyListeners();
    print(type.toString());
    if(type==2)
    {
      await getInstall2();
      listCommunicationInstall=List.from(listCommunicationInstall2_temp);

    }
   else {
     await getCommunicationall('تركيب');
     listCommunicationInstall=List.from(listCommunicationInstall_temp);

      // if(listCommunication.isNotEmpty) {
    //   if(type!=0)//0 is mean all install 1 or 2
    //   listCommunication.forEach((element) {
    //     if(element.typeCommuncation=='تركيب'  && element.type_install==type.toString())//&&element.fkUser==null)
    //       listCommunicationInstall.add(element);
    //   });
    //   else  listCommunication.forEach((element) {
    //     if(element.typeCommuncation=='تركيب'  )//&&element.fkUser==null)
    //       listCommunicationInstall.add(element);
    //   });
    // }
   }
   listCommunication=List.from(listCommunicationInstall_temp);
    // getCommunicationInstallednumber();
    isloading=false;
    notifyListeners();
  }
  Future<void> getCommunicationWelcome()async {
    listCommunicationWelcome_temp=[];
    isloading=true;
    notifyListeners();
     await getCommunicationall('ترحيب');
    // if(listCommunication.isNotEmpty) {
    //   listCommunicationWelcome=[];
    //   listCommunication.forEach((element) {
    //     if(element.typeCommuncation=='ترحيب')//&&element.fkUser==null)
    //       listCommunicationWelcome.add(element);
    //   });
    // }
    // getCommunicationwelcomenumber();
    listCommunicationWelcome=List.from(listCommunicationWelcome_temp);
    listCommunication=List.from(listCommunicationWelcome_temp);
    isloading=false;
    notifyListeners();
  }
  bool isload=false;
  bool valuebutton=false;

  Future<void> getCommunicationallrepeatpage(String country) async {
    listCommunicationrepeat=[];
    isload=true;
    notifyListeners();
    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'care/getcomm_repeat.php?fk_country=$country');
    print(data);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationrepeat.add(CommunicationModel.fromJson(data[i]));
      }
    }
    isload=false;
    notifyListeners();
  }

  Future<void> getCommunicationallrepeatpage_done(
      String country,String param)async {
    listCommunicationrepeat=[];
    isload=true;
    notifyListeners();
    List<dynamic> data=[];
    data= await Api()
        .post(
        url:url+ 'reports/report_care_rate.php?fk_country=$country$param'
    ,body: {'type':'datedays'});
    print(data);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationrepeat.add(CommunicationModel.fromJson(data[i]));
      }

    }
    // return listCommunication;
    isload=false;
    notifyListeners();
  }

  clear(){
    listCommunicationrepeat=[];
    notifyListeners();
  }

  Future<void> updatecarecommuncation(Map<String, dynamic?> body,String id_communication) async {
    isload=true;
    notifyListeners();
    var result=  await Api()
        .post(url:url+ 'care/updateCommunication.php?id_communication=$id_communication',
        body: body
    );
    //CommunicationModel data = CommunicationModel.fromJson(result[0]);
    if(listCommunicationrepeat.isNotEmpty) {
      int index = listCommunicationrepeat.indexWhere((element) =>
      element.idCommunication == id_communication);
      listCommunicationrepeat.removeAt(index);
      // listCommunicationrepeat[index] = data;
    }
    isload=false;
    notifyListeners();
  }

    //addcommuncation
  Future<CommunicationModel> addcommmuncation(
      Map<String, dynamic?> body,
      String id_communication,int type) async {
    print(id_communication);
    isload=true;
    notifyListeners();
  var result=  await Api()
        .post(url:url+ 'care/updateCommunication.php?id_communication=$id_communication',
  body: body
  );
  CommunicationModel data = CommunicationModel.fromJson(result[0]);
    int index= listCommunication.indexWhere((element) =>
    element.idCommunication==id_communication);

    listCommunication[index]=data;

    String value=listCommunication[index].typeCommuncation.toString();
    switch(value){
      case 'تركيب':
        if(type==1) {
        index = listCommunicationInstall_temp.indexWhere((element) =>
        element.idCommunication == id_communication);
        listCommunicationInstall_temp[index] = data;
        index = listCommunicationInstall.indexWhere((element) =>
        element.idCommunication == id_communication);
        listCommunicationInstall.removeAt(index);
        }
        if(type==2) {
        index = listCommunicationInstall2_temp.indexWhere((element) =>
        element.idCommunication == id_communication);
        listCommunicationInstall2_temp[index] = data;
        // listCommunicationInstall[index]= data;
        index = listCommunicationInstall.indexWhere((element) =>
        element.idCommunication == id_communication);
        listCommunicationInstall.removeAt(index);

        }
        // getCommunicationInstall(type);
        break;
      case 'ترحيب':
        index = listCommunicationWelcome_temp
            .indexWhere((element) =>
         element.idCommunication == id_communication);
        listCommunicationWelcome_temp[index] = data;


        index = listCommunicationWelcome
            .indexWhere((element) =>
         element.idCommunication == id_communication);

        listCommunicationWelcome.removeAt(index);
        // listCommunicationWelcome[index] = data;
        // getCommunicationWelcome();
        break;
        case 'دوري':
        getCommunicationclientrepeat(data.fkClient);
        if(listCommunicationrepeat.isNotEmpty) {
          index = listCommunicationrepeat.indexWhere((element) =>
          element.idCommunication == id_communication);
          listCommunicationrepeat.removeAt(index);

          // listCommunicationrepeat[index] = data;
        }
          // index= listCommunicationClient.indexWhere(
          //         (element) =>
          // element.idCommunication==id_communication);
          // listCommunicationClient[index]=data;
          // listCommunicationClient.insert(0, data);
          //notifyListeners();
        valuebutton=true;
        notifyListeners();
        break;
    }
    isload=false;
    notifyListeners();
    // if(listCommunication[index].typeCommuncation=='تركيب')
    // getCommunicationInstall();
    //
    // if(listCommunication[index].typeCommuncation=='ترحيب')
    //   getCommunicationWelcome();
    //
    // if(listCommunication[index].typeCommuncation=='دوري'){
    //  index= listCommunicationClient.indexWhere((element) =>
    // element.idCommunication==id_communication);
    // listCommunicationClient[index]=data;
    // notifyListeners();
    // }
    return data;
  }

  Future<void> getCommunicationall(String? type)async {

    List<dynamic> data=[];
    data= await Api()
        .get(url:url+ 'care/getCommunicationWelccom.php?fkcountry=${usercurrent!.fkCountry}&&type=$type');
    print(data);
   if(type=='تركيب')   {
     listCommunicationInstall_temp=[];

     if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationInstall_temp.add(CommunicationModel.fromJson(data[i]));
      }
      notifyListeners();
    }
    }else{
      listCommunicationWelcome_temp=[];

    if(data.length.toString().isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          listCommunicationWelcome_temp.add(CommunicationModel.fromJson(data[i]));
        }
        notifyListeners();
      }}
  }
  // Future<void> getCommunicationWelccom(String? type)async {
  //   listCommunication=[];
  //   // if(listComments.isEmpty){
  //   List<dynamic> data=[];
  //   data= await Api()
  //       .get(url:url+ 'care/getCommunicationWelccom.php?fkcountry=${usercurrent!.fkCountry}&&type=$type');
  //   print(data);
  //   if(data.length.toString().isNotEmpty) {
  //     for (int i = 0; i < data.length; i++) {
  //       listCommunication.add(CommunicationModel.fromJson(data[i]));
  //     }
  //     notifyListeners();
  //   }
  // }

  Future<void> getInstall2( )async {
    listCommunicationInstall2_temp=[];
    List<dynamic> data=[];

    data= await Api()
        .get(url:url+ 'care/get_install2.php?fk_country=${usercurrent!.fkCountry}');
    print('data.length');
    print(data.length);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationInstall2_temp.add(CommunicationModel.fromJson(data[i]));
      }
      // notifyListeners();
    }
  }


}