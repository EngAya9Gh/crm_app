import 'package:async/async.dart';
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../model/privilgemodel.dart';

class communication_vm extends ChangeNotifier {
  List<CommunicationModel> listCommunication = [];
  List<CommunicationModel> list_wrong_number = [];
  List<CommunicationModel> list_not_use = [];
  List<CommunicationModel> listCommunicationrepeat = [];
  List<CommunicationModel> listCommunicationInstall = [];
  List<CommunicationModel> listCommunicationWelcome = [];
  List<CommunicationModel> listCommunicationClient = [];
  List<CommunicationModel> listinstallnumber = [];
  List<CommunicationModel> listwelcomenumber = [];

  List<CommunicationModel> listCommunicationFilterSearch = [];
  List<CommunicationModel> listCommunicationrepeatTemp = [];

  void onSearch(String query) {
    final list = List.of(listCommunicationInstall);

    listCommunicationFilterSearch = list.where((element) {
      return element.nameEnterprise.toLowerCase().contains(query.toLowerCase()) ||
          (element.mobile?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (element.nameClient?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    notifyListeners();
  }

  void setvaluepriv(privilgelistparam) {
    print('in set privilge client vm');
    privilgelist = privilgelistparam;
    //todo Add parameter null to get all
    param = get_privilgelist();
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist = [];
  UserModel? usercurrent;
  String param = '';

  void setvalue(user) {
    usercurrent = user;
    // param=get_privilgelist();
    notifyListeners();
  }

  bool isloading = false;
  int selectedtypeinstall = 0;

  void changeinstall(int s) {
    selectedtypeinstall = s;
    notifyListeners();
  }

  Map<String, List<CommunicationModel>> careClientState = Map();
  bool isLoadingCareClient = false;

  void getCommunicationclient(String fk_client, String idCommunication) async {
    try {
      listCommunicationClient = [];
      isLoadingCareClient = true;
      notifyListeners();
      // if(listCommunication.isNotEmpty) {
      //   listCommunication.forEach((element) {
      //     if(element.fkClient==fk_client&&element.dateCommunication!=null)
      //       listCommunicationClient.add(element);
      //   });
      // }
      List<dynamic> data = [];
      data = await Api()
          .get(url: url + 'care/getCommunicationClient.php?fk_client=$fk_client&id_communication=$idCommunication');
      print(data);

      if (data.length.toString().isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          listCommunicationClient.add(CommunicationModel.fromJson(data[i]));
        }
      }
      final listWelcome = listCommunicationClient.where((element) => element.typeCommuncation == "ترحيب").toList();
      final listInstallation = listCommunicationClient.where((element) => element.typeCommuncation == "تركيب").toList();
      final listRepeat = listCommunicationClient.where((element) => element.typeCommuncation == "دوري").toList();

      CommunicationModel? communicationSelected =
          listWelcome.firstWhereOrNull((element) => element.idCommunication == idCommunication);

      if (communicationSelected != null) {
        listWelcome.removeWhere((element) => element.idCommunication == communicationSelected!.idCommunication);
        listWelcome.insert(0, communicationSelected);
      } else {
        communicationSelected =
            listInstallation.firstWhereOrNull((element) => element.idCommunication == idCommunication);

        if (communicationSelected != null) {
          listInstallation.removeWhere((element) => element.idCommunication == communicationSelected!.idCommunication);
          listInstallation.insert(0, communicationSelected);
        } else {
          communicationSelected = listRepeat.firstWhereOrNull((element) => element.idCommunication == idCommunication);
          if (communicationSelected != null) {
            listRepeat.removeWhere((element) => element.idCommunication == communicationSelected!.idCommunication);
            listRepeat.insert(0, communicationSelected);
          }
        }
      }
      careClientState['ترحيب'] = listWelcome;
      careClientState['تركيب'] = listInstallation;
      careClientState['دوري'] = listRepeat;

      careClientState.removeWhere((key, value) => value.isEmpty);

      isLoadingCareClient = false;
      notifyListeners();
    } catch (e) {
      isLoadingCareClient = false;
      notifyListeners();
    }
  }

  void isloadval(bool val) {
    isload = val;
    notifyListeners();
  }

  Future<void> get_wrong_using(String type) async {
    List<CommunicationModel> _list = [];
    // list_wrong_number=[];
    isloading = true;
    notifyListeners();
    List<dynamic> data = [];
    data = await Api()
        .get(url: url + 'reports/wrong_using.php?fk_country=${usercurrent!.fkCountry.toString()}&type=$type');

    for (int i = 0; i < data.length; i++) {
      _list.add(CommunicationModel.fromJson(data[i]));
    }
    if (type == 'use') {
      list_not_use = [];
      list_not_use = List.from(_list);
    } else {
      list_wrong_number = [];
      list_wrong_number = List.from(_list);
    }

    isloading = false;
    notifyListeners();
  }

  Future<void> getCommunicationclientrepeat(String fk_client) async {
    listCommunicationClient = [];
    List<CommunicationModel> list = [];
    isloading = true;
    notifyListeners();
    List<dynamic> data = [];
    data = await Api().get(url: url + 'care/view_communcation.php?fk_client=${fk_client}');
    print(data);
    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationClient.add(CommunicationModel.fromJson(data[i]));
      }
      if (listCommunicationClient.isNotEmpty) {
        listCommunicationClient.forEach((element) {
          if (element.fkClient == fk_client && element.dateCommunication != null && element.typeCommuncation == 'دوري'
              //&&element.fkUser==null
              ) list.add(element);
        });
      }
      listCommunicationClient = List.from(list);
      isloading = false;
      notifyListeners();
    }
  }

  List<CommunicationModel> listCommunicationWelcome_temp = [];

  void getcommtype_filter(String? filter, String? regoin, [String? myClientsParam]) async {
    listCommunicationWelcome = [];
    isloading = true;
    notifyListeners();
    if (listCommunicationWelcome_temp.isEmpty || myClientsParam != null)
      await getCommunicationWelcome(myClientsParam ?? '');
    listCommunicationWelcome = List.from(listCommunicationWelcome_temp);

    List<CommunicationModel> _listInvoicesAccept = [];
    if (regoin == null || regoin == '0') {
      print(filter);
      if (listCommunicationWelcome.isNotEmpty) {
        if (filter == 'الكل' || filter == null) {
          _listInvoicesAccept = List.from(listCommunicationWelcome);
          print('serch الكل');
        }
        if (filter == 'تم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if (element.dateCommunication != null) {
              _listInvoicesAccept.add(element);
              print('serch تم');
            }
          });
        if (filter == 'لم يتم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if (element.dateCommunication == null) {
              _listInvoicesAccept.add(element);
              print('serch لم يتم الترحيب');
            }
          });
      }
    } else {
      if (listCommunicationWelcome.isNotEmpty) {
        if (filter == 'الكل' || filter == null)
          listCommunicationWelcome.forEach((element) {
            if (element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');
            }
          });

        if (filter == 'تم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if (element.dateCommunication != null && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if (filter == 'لم يتم الترحيب')
          listCommunicationWelcome.forEach((element) {
            if (element.dateCommunication == null && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');
            }
          });
      }
    }
    listCommunicationWelcome = List.from(_listInvoicesAccept);
    isloading = false;
    notifyListeners();
  }

  List<CommunicationModel> listCommunicationInstall_temp = [];
  List<CommunicationModel> listCommunicationInstall2_temp = [];

  void getinstalltype_filter(String? filter, String? regoin, int typefilter, String? employeeId,
      [String? myClientsParam]) async {
    listCommunicationInstall = [];
    isloading = true;
    notifyListeners();

    if ((listCommunicationInstall_temp.isEmpty && typefilter == 1) || (myClientsParam != null && typefilter == 1))
      await getCommunicationInstall(typefilter, myClientsParam ?? '');
    if ((listCommunicationInstall2_temp.isEmpty && typefilter == 2) || (myClientsParam != null && typefilter == 2))
      await getCommunicationInstall(typefilter, myClientsParam ?? '');
    if (typefilter == 1) listCommunicationInstall = List.from(listCommunicationInstall_temp);
    if (typefilter == 2) listCommunicationInstall = List.from(listCommunicationInstall2_temp);

    List<CommunicationModel> _listInvoicesAccept = [];
    print('regoin');
    print(regoin);
    if (regoin == '0' || regoin == null) {
      if (listCommunicationInstall.isNotEmpty) {
        if (filter == 'الكل') {
          _listInvoicesAccept = List.from(listCommunicationInstall);
          print('serch الكل');
        }
        if (filter == 'تم التأكد من الجودة')
          listCommunicationInstall.forEach((element) {
            if (element.dateCommunication != null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');
            }
          });
        if (filter == 'انتظار الجودة')
          listCommunicationInstall.forEach((element) {
            if (element.dateCommunication == null) {
              _listInvoicesAccept.add(element);
              print('serch لم يتم التأكد ');
            }
          });
      }
    } else {
      if (listCommunicationInstall.isNotEmpty) {
        if (filter == 'الكل')
          listCommunicationInstall.forEach((element) {
            if (element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');
            }
          });

        if (filter == 'تم التأكد من الجودة')
          listCommunicationInstall.forEach((element) {
            if (element.dateCommunication != null && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if (filter == 'انتظار الجودة')
          listCommunicationInstall.forEach((element) {
            if (element.dateCommunication == null && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin لم يتم التأكد ');
            }
          });
      }
    }

    listCommunicationInstall = List.from(_listInvoicesAccept);
    if (employeeId != null) {
      listCommunicationInstall =
          listCommunicationInstall.where((element) => element.userinstall == employeeId).toList();
    }
    isloading = false;
    notifyListeners();
  }

  Future<void> searchwaitcare(String productName) async {
    List<CommunicationModel> _listInvoicesAccept = [];
    List<CommunicationModel> temp = List.from(listCommunicationrepeatTemp);
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listCommunicationrepeat.isNotEmpty) {
        listCommunicationrepeat.forEach((element) {
          if (element.nameEnterprise.toString().contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listCommunicationrepeat = List.from(_listInvoicesAccept);
      }
    } else
      listCommunicationrepeat = List.from(temp);
    notifyListeners();
  }

  //searchwelcome
  Future<void> searchwelcome(String productName, String? type, String myClientsParams) async {
    List<CommunicationModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName;
    final list = List.of(listCommunicationWelcome);
    switch (type) {
      case 'welcome':
        if (productName.isNotEmpty) {
          if (listCommunicationWelcome.isNotEmpty) {
            listCommunicationWelcome.forEach((element) {
              if (element.nameEnterprise.contains(searchKey, 0) ||
                  element.mobile.toString().contains(searchKey, 0) ||
                  element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
            });
            listCommunicationWelcome = _listInvoicesAccept;
          }
        } else
          getCommunicationWelcome(myClientsParams);
        break;

      // case 'install':
      //   if (productName.isNotEmpty) {
      //     if (listCommunicationInstall.isNotEmpty) {
      //       listCommunicationInstall.forEach((element) {
      //         if (element.nameEnterprise.contains(searchKey, 0) ||
      //             element.mobile.toString().contains(searchKey, 0) ||
      //             element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
      //       });
      //       listCommunicationInstall = _listInvoicesAccept;
      //     }
      //   } else
      //     getCommunicationInstall(0); //;
      //   break;
    }
    //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  void getCommunicationInstallednumber() {
    listinstallnumber = [];
    notifyListeners();

    if (listCommunicationInstall.isNotEmpty) {
      listCommunicationInstall.forEach((element) {
        if (element.fkUser == null) listinstallnumber.add(element);
      });
    }
    //notifyListeners();
  }

  void getCommunicationwelcomenumber() {
    listwelcomenumber = [];
    notifyListeners();

    if (listCommunicationWelcome.isNotEmpty) {
      listCommunicationWelcome.forEach((element) {
        if (element.fkUser == null) listwelcomenumber.add(element);
      });
    }
    notifyListeners();
  }

  String get_privilgelist() {
    // if(listClient.isEmpty)
    //main list
    String param = '';
    bool res = privilgelist?.firstWhere((element) => element.fkPrivileg == '123').isCheck == '1' ? true : false;
    if (res) {
      param = ''; //'''&fk_country'+usercurrent!.fkCountry.toString();
    } else {
      res = privilgelist?.firstWhere((element) => element.fkPrivileg == '122').isCheck == '1' ? true : false;
      if (res) {
        param = '&fk_regoin=' + usercurrent!.fkRegoin.toString();
      } else {
        res = privilgelist?.firstWhere((element) => element.fkPrivileg == '121').isCheck == '1' ? true : false;
        if (res) {
          param = '&fk_user=' + usercurrent!.idUser.toString();
        }
      }
    }
    return param;
  }

  Future<void> getCommunicationInstall(int type, String myClientsParams) async {
    listCommunicationInstall_temp = [];
    listCommunicationInstall2_temp = [];
    isloading = true;
    notifyListeners();
    print(type.toString());
    print('param');
    print(param);
    // String param= get_privilgelist();
    if (type == 2) {
      await getInstall2(myClientsParams);
      listCommunicationInstall = List.from(listCommunicationInstall2_temp);
    } else {
      await getInstall1(myClientsParams); //getCommunicationall('تركيب');
      listCommunicationInstall = List.from(listCommunicationInstall_temp);

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
    listCommunication = List.from(listCommunicationInstall);
    // getCommunicationInstallednumber();
    isloading = false;
    notifyListeners();
  }

  Future<void> getCommunicationWelcome(String myClientsParam) async {
    listCommunicationWelcome_temp = [];
    isloading = true;
    notifyListeners();
    await getCommunicationall1('ترحيب', myClientsParam);
    // if(listCommunication.isNotEmpty) {
    //   listCommunicationWelcome=[];
    //   listCommunication.forEach((element) {
    //     if(element.typeCommuncation=='ترحيب')//&&element.fkUser==null)
    //       listCommunicationWelcome.add(element);
    //   });
    // }
    // getCommunicationwelcomenumber();
    listCommunicationWelcome = List.from(listCommunicationWelcome_temp);
    listCommunication = List.from(listCommunicationWelcome_temp);
    isloading = false;
    notifyListeners();
  }

  bool isload = false;
  bool valuebutton = false;

  CancelableOperation<dynamic>? _cancelableFuture;

  Future<void> getCommunicationallrepeatpage(String country, String queryParams) async {
    listCommunicationrepeat = [];
    listCommunicationrepeatTemp = [];
    isload = true;
    notifyListeners();
    List<dynamic> data = [];

    _cancelableFuture?.cancel();

    _cancelableFuture = CancelableOperation.fromFuture(
        Api().get(url: url + 'care/getcomm_repeat.php?fk_country=$country${param + queryParams}'));

    data = await _cancelableFuture?.value;

    print(data);
    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationrepeat.add(CommunicationModel.fromJson(data[i]));
        listCommunicationrepeatTemp.add(CommunicationModel.fromJson(data[i]));
      }
    }
    isload = false;
    notifyListeners();
  }

  Future<void> getCommunicationallrepeatpage_done(String country, String param1) async {
    listCommunicationrepeat = [];
    listCommunicationrepeatTemp = [];
    isload = true;
    notifyListeners();
    List<dynamic> data = [];

    _cancelableFuture?.cancel();

    _cancelableFuture = CancelableOperation.fromFuture(
        Api().post(url: url + 'reports/report_care_rate.php?fk_country=$country$param1', body: {'type': 'datedays'}));

    data = await _cancelableFuture?.value;

    print(data);
    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationrepeat.add(CommunicationModel.fromJson(data[i]));
        listCommunicationrepeatTemp.add(CommunicationModel.fromJson(data[i]));
      }
    }
    // return listCommunication;
    isload = false;
    notifyListeners();
  }

  clear() {
    listCommunicationrepeat = [];
    listCommunicationrepeatTemp = [];
    notifyListeners();
  }

  Future<void> updatecarecommuncation(Map<String, dynamic?> body, String id_communication,
      {VoidCallback? onSuccess}) async {
    try {
      isload = true;
      notifyListeners();
      var result =
          await Api().post(url: url + 'care/updateCommunication.php?id_communication=$id_communication', body: body);
      //CommunicationModel data = CommunicationModel.fromJson(result[0]);
      if (listCommunicationrepeat.isNotEmpty) {
        int index = listCommunicationrepeat.indexWhere((element) => element.idCommunication == id_communication);
        if (index != -1) {
          listCommunicationrepeat.removeAt(index);
        }
        // listCommunicationrepeat[index] = data;
      }

      if (listCommunicationrepeatTemp.isNotEmpty) {
        int index = listCommunicationrepeatTemp.indexWhere((element) => element.idCommunication == id_communication);
        if (index != -1) {
          listCommunicationrepeatTemp.removeAt(index);
        }
        // listCommunicationrepeat[index] = data;
      }
      isload = false;
      final communication = CommunicationModel.fromJson(result[0]);
      var list = careClientState['دوري'] ?? [];
      list = list.map((e) => communication.idCommunication == e.idCommunication ? communication : e).toList();
      careClientState['دوري'] = list;
      notifyListeners();
      onSuccess?.call();
    } catch (e) {
      isload = false;
      notifyListeners();
    }
  }

  //addcommuncation
  Future<CommunicationModel> addcommmuncation(Map<String, dynamic?> body, String id_communication, int type,
      {VoidCallback? onSuccess}) async {
    print(id_communication);
    isload = true;
    notifyListeners();
    var result =
        await Api().post(url: url + 'care/updateCommunication.php?id_communication=$id_communication', body: body);
    CommunicationModel data = CommunicationModel.fromJson(result[0]);
    if (listCommunication.isNotEmpty) {
      int i = listCommunication.indexWhere((element) => element.idCommunication == id_communication);
      if (i != -1) {
        listCommunication[i] = data;
      }
    }

    int index;
    String value = data.typeCommuncation.toString();
    switch (value) {
      case 'تركيب':
        if (type == 1) {
          if (listCommunicationInstall_temp.isNotEmpty) {
            index = listCommunicationInstall_temp.indexWhere((element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationInstall_temp[index] = data;
          }

          if (listCommunicationInstall.isNotEmpty) {
            index = listCommunicationInstall.indexWhere((element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationInstall.removeAt(index);
          }
        }
        if (type == 2) {
          if (listCommunicationInstall2_temp.isNotEmpty) {
            index = listCommunicationInstall2_temp.indexWhere((element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationInstall2_temp[index] = data;
          }

          if (listCommunicationInstall.isNotEmpty) {
            index = listCommunicationInstall.indexWhere((element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationInstall.removeAt(index);
          }
          // listCommunicationInstall[index]= data;
        }
        var list = careClientState['تركيب'] ?? [];
        list = list.map((e) => data.idCommunication == e.idCommunication ? data : e).toList();
        careClientState['تركيب'] = list;
        // getCommunicationInstall(type);
        break;
      case 'ترحيب':
        if (listCommunicationWelcome_temp.isNotEmpty) {
          index = listCommunicationWelcome_temp.indexWhere((element) => element.idCommunication == id_communication);
          if (index != -1) listCommunicationWelcome_temp[index] = data;
        }

        if (listCommunicationWelcome.isNotEmpty) {
          index = listCommunicationWelcome.indexWhere((element) => element.idCommunication == id_communication);
          if (index != -1) listCommunicationWelcome.removeAt(index);
        }

        // listCommunicationWelcome[index] = data;
        // getCommunicationWelcome();

        var list = careClientState['ترحيب'] ?? [];
        list = list.map((e) => data.idCommunication == e.idCommunication ? data : e).toList();
        careClientState['ترحيب'] = list;
        break;
      case 'دوري':
        getCommunicationclientrepeat(data.fkClient);
        if (listCommunicationrepeat.isNotEmpty) {
          index = listCommunicationrepeat.indexWhere((element) => element.idCommunication == id_communication);
          if (index != -1) listCommunicationrepeat.removeAt(index);

          // listCommunicationrepeat[index] = data;
        }
        if (listCommunicationrepeatTemp.isNotEmpty) {
          index = listCommunicationrepeatTemp.indexWhere((element) => element.idCommunication == id_communication);
          if (index != -1) listCommunicationrepeatTemp.removeAt(index);

          // listCommunicationrepeat[index] = data;
        }

        var list = careClientState['دوري'] ?? [];
        list = list.map((e) => data.idCommunication == e.idCommunication ? data : e).toList();
        careClientState['دوري'] = list;
        // index= listCommunicationClient.indexWhere(
        //         (element) =>
        // element.idCommunication==id_communication);
        // listCommunicationClient[index]=data;
        // listCommunicationClient.insert(0, data);
        //notifyListeners();
        valuebutton = true;
        notifyListeners();
        break;
    }
    isload = false;
    notifyListeners();
    onSuccess?.call();
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

  CancelableOperation<dynamic>? _cancelableWelcomeFuture;

  Future<void> getCommunicationall1(String? type, String myClientsParam) async {
    List<dynamic> data = [];
    _cancelableWelcomeFuture?.cancel();
    _cancelableWelcomeFuture = CancelableOperation.fromFuture(Api().get(
        url: url + 'care/getCommunicationWelccom.php?fkcountry=${usercurrent!.fkCountry}&type=$type$myClientsParam'));

    data = await (_cancelableWelcomeFuture?.value);
    print(data);
    if (type == 'تركيب') {
      listCommunicationInstall_temp = [];

      if (data.length.toString().isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          listCommunicationInstall_temp.add(CommunicationModel.fromJson(data[i]));
        }
        notifyListeners();
      }
    } else {
      listCommunicationWelcome_temp = [];

      if (data.length.toString().isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          listCommunicationWelcome_temp.add(CommunicationModel.fromJson(data[i]));
        }
        notifyListeners();
      }
    }
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

  CancelableOperation<dynamic>? _cancelableCommunicationInstall2Future;

  Future<void> getInstall2(String myClientsParams) async {
    listCommunicationInstall2_temp = [];
    List<dynamic> data = [];

    _cancelableCommunicationInstall2Future?.cancel();
    _cancelableCommunicationInstall2Future = CancelableOperation.fromFuture(
        Api().get(url: url + 'care/get_install2.php?fk_country=${usercurrent!.fkCountry}$param$myClientsParams'));

    data = await _cancelableCommunicationInstall2Future?.value;

    print('data.length');
    print(data.length);
    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationInstall2_temp.add(CommunicationModel.fromJson(data[i]));
      }
      // notifyListeners();
    }
  }

  CancelableOperation<dynamic>? _cancelableCommunicationInstall1Future;

  Future<void> getInstall1(String myClientsParams) async {
    listCommunicationInstall_temp = [];
    List<dynamic> data = [];

    _cancelableCommunicationInstall1Future?.cancel();

    _cancelableCommunicationInstall1Future = CancelableOperation.fromFuture(
        Api().get(url: url + 'care/get_install_1.php?fk_country=${usercurrent!.fkCountry}$param$myClientsParams'));

    data = await _cancelableCommunicationInstall1Future?.value;
    print('data.length');
    print(data.length);
    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationInstall_temp.add(CommunicationModel.fromJson(data[i]));
      }
      // notifyListeners();
    }
  }
}
