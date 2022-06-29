



import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class communication_vm extends ChangeNotifier{

  List<CommunicationModel> listCommunication=[];
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
        if(element.fkClient==fk_client&&element.fkUser!=null)
          listCommunicationClient.add(element);
      });
    }
      notifyListeners();
  }
  void getCommunicationclientrepeat(String fk_client) {
    listCommunicationClient=[];
    notifyListeners();
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.fkClient==fk_client && element.typeCommuncation=='دوري'
            //&&element.fkUser==null
        )
          listCommunicationClient.add(element);
      });
    }
      notifyListeners();
  }
  void getcommtype_filter(String? filter,String? regoin,String tyype)async{
    // listInvoicesAccept=[];
    await getCommunicationWelcome();
    List<CommunicationModel> _listInvoicesAccept=[];
    if(regoin==null){
      print(filter);
      if(listCommunicationWelcome.isNotEmpty){
        if(filter=='الكل') {
          _listInvoicesAccept = listCommunicationWelcome;
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
    listCommunicationWelcome= _listInvoicesAccept;
    notifyListeners();
  }
  void getinstalltype_filter(String? filter,String? regoin,String tyype)async{
    // listInvoicesAccept=[];
    await getCommunicationInstall();
    List<CommunicationModel> _listInvoicesAccept=[];
    if(regoin==null){
      print(filter);
      if(listCommunicationInstall.isNotEmpty){
        if(filter=='الكل') {
          _listInvoicesAccept = listCommunicationInstall;
          print('serch الكل');
        }
        if(filter=='تم التأكد من جودة التركيب')
          listCommunicationInstall.forEach((element) {

            if( element.dateCommunication!=null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');

            }
          });
        if(filter=='لم يتم التأكد من جودة التركيب')
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

        if(filter=='تم التأكد من جودة التركيب')
          listCommunicationInstall.forEach((element) {
            if( element.dateCommunication!=null
                && element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if(filter=='لم يتم التأكد من جودة التركيب')
          listCommunicationInstall.forEach((element) {
            if( element.dateCommunication==null
                &&element.fk_regoin==regoin) {
              _listInvoicesAccept.add(element);
              print('regoin لم يتم التأكد ');

            }
          });
      }
    }
    listCommunicationInstall= _listInvoicesAccept;
    isloading=false;
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
              || element.mobile!.contains(searchKey,0)
              ||element.nameClient!.contains(searchKey,0)
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
                  || element.mobile!.contains(searchKey,0)
                  ||element.nameClient!.contains(searchKey,0)
              )
                _listInvoicesAccept.add(element);
            });
            listCommunicationInstall=_listInvoicesAccept;
          }}
        else getCommunicationInstall();
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
 Future <void> getCommunicationInstall() async{
    listCommunicationInstall=[];
    isloading=true;
    notifyListeners();
    await getCommunicationall('dateinvoice');
    if(listCommunication.isNotEmpty){
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='تركيب')//&&element.fkUser==null)
          listCommunicationInstall.add(element);
      });
    }
    getCommunicationInstallednumber();
    isloading=false;
    notifyListeners();
  }
  Future<void> getCommunicationWelcome()async {
    listCommunicationWelcome=[];
    isloading=true;
    notifyListeners();
     await getCommunicationall('dateinvoice');
    if(listCommunication.isNotEmpty) {
      listCommunicationWelcome=[];
      listCommunication.forEach((element) {
        if(element.typeCommuncation=='ترحيب')//&&element.fkUser==null)
          listCommunicationWelcome.add(element);
      });
    }
    getCommunicationwelcomenumber();
    isloading=false;
    notifyListeners();
  }
  //addcommuncation
  bool isload=false;
  Future<CommunicationModel> addcommuncation(Map<String, dynamic?> body,String id_communication) async {
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
        getCommunicationInstall();
        break;
      case 'ترحيب':
        getCommunicationWelcome();
        break;
        case 'دوري':
          index= listCommunicationClient.indexWhere((element) =>
          element.idCommunication==id_communication);
          listCommunicationClient[index]=data;
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
    listCommunication=[];
    // if(listComments.isEmpty){
    List<dynamic> data=[];

    data= await Api()
        .get(url:url+ 'care/viewcommunicationAll.php?fkcountry=${usercurrent!.fkCountry}&&type=$type');
    print(data);
    if(data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunication.add(CommunicationModel.fromJson(data[i]));
      }
      notifyListeners();
    }
  }
}