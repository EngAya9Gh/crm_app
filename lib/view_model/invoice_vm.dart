import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import '../model/agent_distributor_model.dart';
import '../model/participatModel.dart';
import 'package:collection/collection.dart';

const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

enum SellerType { distributor, agent, collaborator }

enum SellerStatus { init, loading, loaded, failed }

class invoice_vm extends ChangeNotifier {
  String total = '0';

  InvoiceModel? currentInvoice;

  setCurrentInvoice(InvoiceModel invoice){
    currentInvoice = invoice;
  }

  void set_total(val) {
    total = val;
    notifyListeners();
  }

  bool isloading = false;
  UserModel? usercurrent;

  invoice_vm() {
    //get_invoicesbyRegoin("");
  }

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  bool isLoadingInvoicesClientParticipateLocal = false;
  bool isLoadingInvoicesClientLocal = false;
  List<InvoiceModel> listinvoiceClient = [];
  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listforme = [];
  List<DeletedinvoiceModel> listdeletedinvoice = [];
  List<ProductsInvoice> listproductinvoic = [];
  List<DeletedinvoiceModel> listdeleted = [];
  List<InvoiceModel> listinvoicebyregoin = [];
  List<InvoiceModel> listinvoices = [];
  List<InvoiceModel> listinvoicesMarketing = [];
  List<InvoiceModel> listinvoicesApproved = [];
  List<InvoiceModel> listInvoicesAccept = []; //مشتركين
  Future<void> searchProducts(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
      }
      listInvoicesAccept = _listInvoicesAccept;
    }
    //else listInvoicesAccept=userall;
    notifyListeners();
  }

  Future<void> searchwait(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else {
      if (privilgelist.firstWhere((element) => element.fkPrivileg == 2) == true)
        getinvoice_Local('مشترك', 'not approved', 'country');
      else {
        if (privilgelist.firstWhere((element) => element.fkPrivileg == 7) == true)
          getinvoice_Local('مشترك', 'not approved', 'regoin');
      }
    }
    //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  Future<void> searchwaitsupport(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      getinvoice_Local("مشترك", 'approved only', null);
    notifyListeners();
  }

  Future<void> searchwaitout(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      getinvoice_Local("منسحب", 'out', null);
    notifyListeners();
  }

  Future<void> searchwaitwithprev(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      getinvoice_Localwithprev();
    notifyListeners();
  }

  Future<void> searchmarketing(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listinvoicesMarketing.isNotEmpty) {
        listinvoicesMarketing.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0)) _listInvoicesAccept.add(element);
        });
        listinvoicesMarketing = _listInvoicesAccept;
      }
    } else
      getinvoice_marketing(); //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  void getinvoice_marketing() async {
    listinvoicesMarketing = [];
    isloading = true;
    notifyListeners();
    list_temp=  await  Invoice_Service().getinvoiceMarketing(usercurrent!.fkCountry.toString());
    // listinvoices.forEach((element) {
    //   // if (element.ismarketing == '1')
    //     //&& element.isApprove == "1")
    //     listinvoicesMarketing.add(element);
    // });
     listinvoicesMarketing=List.from(list_temp);
    isloading = false;
    notifyListeners();
  }

  void getfilterinvoice(String? regoin) {
    listInvoicesAccept = [];
    if (regoin != null) {
      if (regoin != '0') {
        listinvoices.forEach((element) {
          if (element.fk_regoin == regoin) listInvoicesAccept.add(element);
        });
      } else {
        //الكل لفلتر المنطقة
        listinvoices.forEach((element) {
          if (element.fk_country == usercurrent!.fkCountry) listInvoicesAccept.add(element);
        });
      }
    }
    notifyListeners();
  }

  Future<void> getfilterinvoicesclient(String? filter, String? regoin) async {
    List<InvoiceModel> _listInvoicesAccept = [];

    if (regoin == null) {
      print(filter);
      if (listforme.isNotEmpty) {
        if (filter == 'الكل') {
          _listInvoicesAccept = List.from(listforme);
          print('serch الكل');
        }
        if (filter == 'بالإنتظار')
          listforme.forEach((element) {
            print(element.isdoneinstall);
            if (element.isdoneinstall == null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');
            }
          });
        if (filter == 'تم التركيب')
          listforme.forEach((element) {
            if (element.isdoneinstall == '1') {
              _listInvoicesAccept.add(element);
              print('serch تم التركيب');
            }
          });
        if (filter == 'معلق')
          listforme.forEach((element) {
            if (element.isdoneinstall != '1' && element.ready_install == '0') {
              _listInvoicesAccept.add(element);
              print('serch lمعلق');
            }
          });
      }
    } else {
      if (listforme.isNotEmpty) {
        if (filter == 'الكل' || filter == null) {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.fk_regoin == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin الكل');
              }
            });
          } else {
            _listInvoicesAccept = List.from(listforme);
          }
        }
        if (filter == 'بالإنتظار') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall.toString() == null && element.fk_regoin == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin بالإنتظار');
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall.toString() == null) {
                _listInvoicesAccept.add(element);
                print('regoin بالإنتظار');
              }
            });
          }
        }
        if (filter == 'تم التركيب') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall == '1' && element.fk_regoin == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin تم التركيب');
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall == '1') {
                _listInvoicesAccept.add(element);
                print('regoin تم التركيب');
              }
            });
          }
        }
        if (filter == 'معلق') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall != '1' && element.ready_install == '0' && element.fk_regoin == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin معلق');
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall != '1' && element.ready_install == '0') {
                _listInvoicesAccept.add(element);
                print('معلق  ');
              }
            });
          }
        }
      }
    }
    listInvoicesAccept = List.from(_listInvoicesAccept);
    notifyListeners();
  }

  Future<void> getinvoice_waiting() async {
    isloading = true;
    notifyListeners();
    String? state = null;
    listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
        'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}&state=${state.toString()}',
        {'allmaincity': 'allmaincity'});
    isloading = false;
    notifyListeners();
  }

  void setisload() {
    isloadingdone = true;
    notifyListeners();
  }

  Future<void> getfilter_maincity(List<MainCityModel>? listparam, String? state) async {
    print(state);
    String type = '';
    List<int> listval = [];
    isloading = true;
    notifyListeners();
    int idexist = -1;
    print('allllllllllllllllllll');
    print(listparam?.length.toString());

    if (listparam!.isEmpty && state == 'الكل') {
      listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
          'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}', {'all': 'all'});
    } else {
      String params = '';
      // if (listparam.toString().isNotEmpty)
      if (listparam.length!=0)
      {
        idexist = listparam.indexWhere((element) => element.id_maincity == '0');
        if (idexist == -1) {
          for (int i = 0; i < listparam.length; i++)
            listval.add(int.parse(listparam[i].id_maincity));

          for (int i = 0; i < listval.length; i++) {
            params += '&maincity_fks[]=${listval[i]}';
            print(params);
          }
        }
        print(idexist);
        print(state);
        print('idexist');

        if (idexist != -1 && state == 'الكل')
          type = 'all';
        else {
          if (idexist == -1 && state == 'الكل') type = 'allstate';
          if (idexist == -1 && state != 'الكل') type = 'allmix';
          if (idexist != -1 && state != 'الكل') type = 'allmaincity';
        }
      } else {
        type = 'allmaincity';
      }
      if (state == 'بالإنتظار')
        state = null;
      else if (state == 'تم التركيب') state = '1';
      if (state == 'معلق') state = 'suspend';
      print('typpping ' + type);

      switch (type) {

        case 'allmaincity':
          listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
              'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}&state=${state.toString()}',
              {'allmaincity': 'allmaincity'});
          break;

        case 'allstate':
          print('21321321');
          // for(int i=0;i<listparam.length;i++)
          //   listval.add(int.parse( listparam[i].id_maincity));
          listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
              'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}$params',
              {'allstate': 'allstate'});
          break;
        case 'allmix':
          // for(int i=0;i<listparam.length;i++)
          //   listval.add(int.parse( listparam[i].id_maincity));
          listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
              'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}&state=${state.toString()}$params',
              {'allmix': 'allmix'});
          break;

        case 'all':
          listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
              'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}',
              {'all': 'all'});
          break;
      }
    }
    isloading = false;
    //listInvoicesAccept=//List.from(listinvoices);
    notifyListeners();
  }

  Future<void> getclienttype_filter(String? filter, String? regoin, String tyype) async {
    // listInvoicesAccept=[];
    if (tyype == 'only') await getinvoice_Local("مشترك", 'approved only', null);
    if (tyype == 'client') await getinvoice_Local("مشترك", 'approved client', null);
    if (tyype == 'not') await getinvoice_Local("مشترك", 'not approved', null);
    if (tyype == 'out') await getinvoice_Local("مستبعد", 'out', null);

    List<InvoiceModel> _listInvoicesAccept = [];
    if (regoin == null) {
      print(filter);
      if (listInvoicesAccept.isNotEmpty) {
        if (filter == 'الكل') {
          _listInvoicesAccept = listInvoicesAccept;
          print('serch الكل');
        }
        if (filter == 'بالإنتظار')
          listInvoicesAccept.forEach((element) {
            print(element.isdoneinstall);
            if (element.isdoneinstall == null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');
            }
          });
        if (filter == 'تم التركيب')
          listInvoicesAccept.forEach((element) {
            if (element.isdoneinstall == '1') {
              _listInvoicesAccept.add(element);
              print('serch تم التركيب');
            }
          });
      }
    } else {
      if (listInvoicesAccept.isNotEmpty) {
        if (filter == 'الكل') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin الكل');
              }
            });
          } else {
            _listInvoicesAccept = listInvoicesAccept;
          }
        }

        if (filter == 'بالإنتظار') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall.toString() == null && element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin بالإنتظار');
              }
            });
          } else {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall.toString() == null) {
                _listInvoicesAccept.add(element);
                print('regoin بالإنتظار');
              }
            });
          }
        }
        if (filter == 'تم التركيب') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall == '1' && element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin تم التركيب');
              }
            });
          } else {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall == '1') {
                _listInvoicesAccept.add(element);
                print('regoin تم التركيب');
              }
            });
          }
        }
      }
    }
    listInvoicesAccept = _listInvoicesAccept;
    notifyListeners();
  }
  List<InvoiceModel> list_temp= [];
  Future<void> getclienttype_marketing(String? filter, String? regoin, String tyype) async {
    // getinvoice_marketing();
    listinvoicesMarketing =List.from( list_temp);

    List<InvoiceModel> _listInvoicesAccept = [];
    if (regoin == null) {
      print(filter);
      if (listinvoicesMarketing.isNotEmpty) {
        if (filter == 'الكل') {
          _listInvoicesAccept =List.from( listinvoicesMarketing);
          print('serch الكل');
        }
        if (filter == 'بالإنتظار')
          listinvoicesMarketing.forEach((element) {
            print(element.isdoneinstall);
            if (element.isdoneinstall == null) {
              _listInvoicesAccept.add(element);
              print('serch بالانتظار');
            }
          });
        if (filter == 'تم التركيب')
          listinvoicesMarketing.forEach((element) {
            if (element.isdoneinstall == '1') {
              _listInvoicesAccept.add(element);
              print('serch تم التركيب');
            }
          });
        if (filter == 'معلق')
          listinvoicesMarketing.forEach((element) {
            if (element.isdoneinstall != '1' && element.ready_install == '0') {
              _listInvoicesAccept.add(element);
              print('serch lمعلق');
            }
          });
      }
    } else {
      if (listinvoicesMarketing.isNotEmpty) {
        if (filter == 'الكل')
          listinvoicesMarketing.forEach((element) {
            if (element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin الكل');
            }
          });

        if (filter == 'بالإنتظار')
          listinvoicesMarketing.forEach((element) {
            if (element.isdoneinstall.toString() == null && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin بالإنتظار');
            }
          });
        if (filter == 'تم التركيب')
          listinvoicesMarketing.forEach((element) {
            if (element.isdoneinstall == '1' && element.fk_regoin == regoin) {
              _listInvoicesAccept.add(element);
              print('regoin تم التركيب');
            }
          });
        if (filter == 'معلق') {
          if (regoin != '0') {
            listinvoicesMarketing.forEach((element) {
              if (element.isdoneinstall != '1' && element.ready_install == '0' && element.fk_regoin == regoin) {
                _listInvoicesAccept.add(element);
                print('regoin معلق');
              }
            });
          } else {
            listinvoicesMarketing.forEach((element) {
              if (element.isdoneinstall != '1' && element.ready_install == '0') {
                _listInvoicesAccept.add(element);
                print('معلق  ');
              }
            });
          }
        }
      }
    }
    listinvoicesMarketing =List.from(_listInvoicesAccept) ;
    notifyListeners();
  }

  Future<void> getfilterview(String? regoin, String tyype) async {
    listInvoicesAccept = [];
    notifyListeners();
    if (tyype == 'only') await getinvoice_Local("مشترك", 'approved only', null);
    if (tyype == 'client') await getinvoice_Local("مشترك", 'approved client', null);
    if (tyype == 'not') await getinvoice_Local("مشترك", 'not approved', null); //طلبات الموافقة الفلتر
    List<InvoiceModel> _listInvoicesAccept = [];
    if (regoin != '0')
      listInvoicesAccept.forEach((element) {
        if (element.fk_regoin == regoin) {
          _listInvoicesAccept.add(element);
          print('regoin الكل');
        }
      });
    else {
      listInvoicesAccept.forEach((element) {
        if (element.fk_country == usercurrent!.fkCountry) {
          _listInvoicesAccept.add(element);
          print('regoin الكل');
        }
      });
    }
    listInvoicesAccept = _listInvoicesAccept;
    notifyListeners();
  }

  Future<void> getinvoice_Localwithprev() async {
    // Stopwatch stopwatch = Stopwatch();
    // stopwatch.start();
    listInvoicesAccept = [];
    isloading = true;
    notifyListeners();
    await getinvoiceswithprev();
    listInvoicesAccept =
        listInvoicesAccept.where((element) => element.stateclient == 'مشترك' && element.isApprove == "1").toList();
    listforme = List.from(listInvoicesAccept);
    isloading = false;
    // stopwatch.stop();
    // stopwatch.elapsed.inSeconds;
    notifyListeners();
  }

  Future<void> getinvoice_Debt() async {
    List<InvoiceModel> list = [];
    listInvoicesAccept = [];
    isloading = true;
    notifyListeners();
    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == '94').isCheck == '1' ? true : false;
    if (res) {
      listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
      print('indddddd');
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == '93').isCheck == '1' ? true : false;
      if (res) {
        listinvoices = await Invoice_Service().getinvoicebyregoin(usercurrent!.fkRegoin!);
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == '92').isCheck == '1' ? true : false;
        if (res) {
          listinvoices = await Invoice_Service().getinvoicebyiduser(usercurrent!.idUser.toString());
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    listInvoicesAccept.forEach((element) {
      if (element.stateclient == 'مشترك' && element.isApprove == "1"&&
          (double.parse(element.total.toString()) -
          double.parse(element.amountPaid.toString()))>0) list.add(element);
    });
    listInvoicesAccept = list;
    listforme = List.from(list);
    isloading = false;
    // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
    notifyListeners();
  }

  // Future<void> getClientWaiting()async{
  //   // element.stateclient == searchfilter
  //   //     && element.isApprove == "1"
  //   listInvoicesAccept = await Invoice_Service()
  //       .getinvoicemaincity(
  //       'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}'
  //       ,{'all':'all'});
  //   notifyListeners();
  // }
  Future<void> getinvoice_Local(String searchfilter, String type, String? approvetype
      // , List<ClientModel> list
      ) async {
    List<InvoiceModel> list = [];
    isloading = true;
    listInvoicesAccept = [];

    notifyListeners();

    print('dcvcvvvvvvvvvvvvvvvvvvvvvvvvv');
    print(approvetype);
    if (approvetype == null) {
      print('dsklmckdsclks');
      await getinvoices();
      if (listinvoices.isNotEmpty) {
        if (type == 'approved only')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter && element.isApprove == "1") list.add(element);
          });
        if (type == 'approved client')
          listinvoices.forEach((element) {
            if (element.type_client == searchfilter && element.isApprove == "1") list.add(element);
          });
        if (type == 'not approved')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter && element.isApprove == null) list.add(element);
          });
        if (type == 'out')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter) list.add(element);
          });
        listInvoicesAccept = list;
      }
    } else {
      if (approvetype == 'country') await get_invoicesbyRegoin_accept_requst('c');

      if (approvetype == 'regoin') await get_invoicesbyRegoin_accept_requst('r');
      if (approvetype == 'finance') await get_invoicesbyRegoin_accept_requst('f');
    }

    isloading = false;
    // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
    notifyListeners();
  }

  void addlistproductinvoic(value) {
    listproductinvoic.add(value);
    notifyListeners();
  }

  void removelistproductinvoic(index) {
    listproductinvoic.removeAt(index);
    notifyListeners();
  }

  void updatelistproducetInvoice() {
    notifyListeners();
  }

  void addlistinvoicedeleted(value) {
    listdeletedinvoice.add(value);
    notifyListeners();
  }

  void removeinvoicedeleted(index) {
    listdeletedinvoice.removeAt(index);
    notifyListeners();
  }

  bool isapproved = false;

  Future<bool> setApproveclient_vm(Map<String, dynamic?> body, String? idInvoice) async {
    isapproved = true;
    notifyListeners();
    InvoiceModel? data = await Invoice_Service().setApproveClient(body, idInvoice!);
    int index = listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    int iindex = listInvoicesAccept.indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) {
      if (data != null) {
        listinvoices[index] = data;
      } else {
        listinvoices.removeAt(index);
      }
    }
    if (iindex != -1) listInvoicesAccept.removeAt(iindex);
    isapproved = false;
    notifyListeners();

    return true;
  }

  Future<bool> setApproveFclient_vm(Map<String, dynamic?> body, String? idInvoice) async {
    isapproved = true;
    notifyListeners();
    InvoiceModel? data = await Invoice_Service().setApproveFClient(body, idInvoice!);
    int index = listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    int iindex = listInvoicesAccept.indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) {
      if (data != null) {
        listinvoices[index] = data;
      } else {
        listinvoices.removeAt(index);
      }
    }
    if (iindex != -1) listInvoicesAccept.removeAt(iindex);
    isapproved = false;
    notifyListeners();

    return true;
  }

  Future<void> get_byIdClient(String fkclient) async {
    // InvoiceModel? inv;
    // bool res=true;
    //
    // inv= listinvoices.firstWhere((element) =>element.fkIdClient==fkclient
    //     ,orElse:null);
    // if(inv==null) inv=
    // listinvoices.add(inv!);
    // notifyListeners();
  }
  List<InvoiceModel> list = [];
  Future<void> get_invoiceclientlocal2(String? fk_client ) async {
    list = await Invoice_Service().getinvoicebyclient(fk_client!);
    notifyListeners();
  }
  Future<void> get_invoiceclientlocal(String? fk_client, String type) async {
    bool isParticipate = type == 'مشترك';

    try {
      if(isParticipate){
          listinvoiceClientSupport = [];
          isLoadingInvoicesClientParticipateLocal = true;
          notifyListeners();
      }else{
          listinvoiceClient = [];
          isLoadingInvoicesClientLocal = true;
          notifyListeners();
      }
      List<InvoiceModel> list = [];
      listinvoiceClient = [];
      notifyListeners();
      list = await Invoice_Service().getinvoicebyclient(fk_client!);
      if (list.isNotEmpty) {
        if (isParticipate) {
          listinvoiceClientSupport = [];
          list.forEach((element) {
            if (element.fkIdClient == fk_client && element.isApprove != null) listinvoiceClientSupport.add(element);
          });
        } else {
          listinvoiceClient = [];
          list.forEach((element) {
            if (element.fkIdClient == fk_client) listinvoiceClient.add(element);
          });
        }
      }

      print('length list invoice client ' + listinvoiceClient.length.toString());
      print('length list invoice client ' + listinvoiceClientSupport.length.toString());
      if(isParticipate){
        isLoadingInvoicesClientParticipateLocal = false;
      }else{
        isLoadingInvoicesClientLocal = false;
      }
      notifyListeners();
    } catch (e) {
      if(isParticipate){
        isLoadingInvoicesClientParticipateLocal = false;
      }else{
        isLoadingInvoicesClientLocal = false;
      }
      notifyListeners();
    }
}

  void setvaluepriv(privilgelistparam) {
    print('in set privilge client vm');
    privilgelist = privilgelistparam;
    notifyListeners();
  }

  List<PrivilgeModel> privilgelist = [];

  Future<void> getinvoices() async {
    listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<void> getinvoiceswithprev() async {
    // if(listClient.isEmpty)
    //main list
    bool res = privilgelist.firstWhere((element) => element.fkPrivileg == '1').isCheck == '1' ? true : false;
    if (res) {
      listinvoices = await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
      print('indddddd');
    } else {
      res = privilgelist.firstWhere((element) => element.fkPrivileg == '38').isCheck == '1' ? true : false;
      if (res) {
        listinvoices = await Invoice_Service().getinvoicebyregoin(usercurrent!.fkRegoin!);
      } else {
        res = privilgelist.firstWhere((element) => element.fkPrivileg == '6').isCheck == '1' ? true : false;
        if (res) {
          listinvoices = await Invoice_Service().getinvoicebyiduser(usercurrent!.idUser.toString());
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<void> get_invoicesbyIduser(List<InvoiceModel> list) async {
    listinvoicebyregoin = [];
    //cahe_data_source_invoice().clearCache();
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fkIdUser == usercurrent!.idUser) listinvoicebyregoin.add(element);
      });
    } else {
      listinvoices = await Invoice_Service().getinvoicebyiduser(usercurrent!.idUser!);
      listinvoices = listinvoicebyregoin;
    }

    notifyListeners();
  }

  InvoiceModel? get_byIdInvoice(String id_invoice) {
    InvoiceModel? inv;
    listinvoices.forEach((element) {
      if (element.idInvoice == id_invoice) inv = element;
    });
    if (inv == null) getinvoices();

    return inv; //InvoiceModel(products: []);
    // else{
    //   listinvoices = await Invoice_Service()
    //       .getinvoicebyiduser(usercurrent!.idUser!);
    //   listinvoices=listinvoicebyregoin;
    // }

    //notifyListeners();
  }

  //getinvoaicebyregoin_accept_requst
  Future<void> get_invoicesbyRegoin_accept_requst(String type) async {
    // if(type=='r')
    switch (type) {
      case 'r':
        listinvoicebyregoin =
            await Invoice_Service().getinvoaicebyregoin_accept_requst({'fk_regoin': usercurrent!.fkRegoin.toString()});
        break;

      // else
      case 'c':
        listinvoicebyregoin = await Invoice_Service()
            .getinvoaicebyregoin_accept_requst({'fk_country': usercurrent!.fkCountry.toString()});
        break;
      case 'f':
        listinvoicebyregoin = await Invoice_Service().getinvoaicebyregoin_accept_requst({'FApprove': 'f'});
    }

    listInvoicesAccept = List.from(listinvoicebyregoin);
    notifyListeners();
  }

  Future<void> get_invoicesbyRegoin(List<InvoiceModel> list) async {
    listinvoicebyregoin = [];
    //cahe_data_source_invoice().clearCache();
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fk_regoin == usercurrent!.fkRegoin) listinvoicebyregoin.add(element);
      });
    } else {
      listinvoicebyregoin = await Invoice_Service().getinvoicebyregoin(usercurrent!.fkRegoin!);
      listinvoices = listinvoicebyregoin;
    }
    // listinvoicesApproved=listinvoices;
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<String> add_invoiceclient_vm(Map<String, dynamic?> body, File? file, File? myfilelogo) async {
    String res = 'done';
    InvoiceModel data = await Invoice_Service().addInvoice(body, file, myfilelogo);
    //  if(data !=null){
    print('resssssssssssssss');
    listinvoices.insert(0, data);
    listinvoiceClient.insert(0, data);
    res = data.idInvoice.toString();
    print(res);
    // } else res='false';
    notifyListeners();
    return res;
  }

  Future<String> add_invoiceProduct_vm(Map<String, dynamic?>? body) async {
    print('$body');
    String res = await Invoice_Service().addInvoiceProduct(body!);

    if (res != "false") {
      body.addAll({
        'idInvoiceProduct': res,
      });
      //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> update_invoiceProduct_vm(Map<String, dynamic?>? body, String idInvoiceProduct) async {
    print('$body');
    bool res = await Invoice_Service().updateProductInvoice(body!, idInvoiceProduct);
    //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
    notifyListeners();

    return res;
  }

  Future<bool> update_invoiceclient_vm(
      Map<String, dynamic?> body, String? idInvoice, File? file, File? myfilelogo) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data = await Invoice_Service().updateInvoice(body, idInvoice!, file, myfilelogo);
    final index = listinvoiceClient.indexWhere((element) => element.idInvoice == idInvoice);
    // body.addAll({
    //   "id_invoice":idInvoice,
    //   "date_create":listinvoiceClient[index].dateCreate.toString(),
    //
    //   "products":listproductinvoic.map((e)=>e.toJson()).toList()
    // });
    if (index != -1) listinvoiceClient[index] = data; //InvoiceModel.fromJson(body);
    final index1 = listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = data;

    int index2 = listInvoicesAccept.indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = data;

    //InvoiceModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    isloadingdone = false;
    currentInvoice = data;
    notifyListeners();

    return true;
  }

  Future<String> delete_invoice(Map<String, String> body, String? id_invoice) async {
    int index = listinvoiceClient.indexWhere((element) => element.idInvoice == id_invoice);
    listinvoiceClient.removeAt(index);
    String res = await Invoice_Service().deleteInvoiceById(body);
    print("res in delete invoice " + res);
    //if(res=="done"){
    index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    listinvoices.removeAt(index);

    index = listInvoicesAccept.indexWhere((element) => element.idInvoice == id_invoice);
    listInvoicesAccept.removeAt(index);
    notifyListeners();
    //}
    return res;
  }

  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res = await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if (res == "done") {
      int index = listproductinvoic.indexWhere((element) => element.idInvoiceProduct == idInvoiceProduct);
      if (index != -1) listproductinvoic.removeAt(index);

      notifyListeners();
    }
    return res;
  }

  Future<void> setdate_vm(Map<String, dynamic?> body, String? id_invoice) async {
    isloadingdone = true;
    notifyListeners();
    int index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);

    int index1 = listinvoiceClientSupport.indexWhere((element) => element.idInvoice == id_invoice);
    InvoiceModel te = await Invoice_Service().setdate(body, id_invoice!);
    if (index != -1) listinvoices[index] = te;
    // print(index);
    listinvoiceClientSupport[index1] = te;

    // listinvoiceClientSupport
    // body.addAll(
    //     InvoiceModel.fromJson(listinvoices[index]));
    // listinvoices[index]= InvoiceModel.fromJson(body);
    // //listClient.removeAt(index);
    isloadingdone = false;
    notifyListeners();
  }

  Future<void> set_state_back(Map<String, dynamic?> body, String? id_invoice) async {
    isloading = true;
    notifyListeners();
    InvoiceModel data = await Invoice_Service().setstate(body, id_invoice!);
    int index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    listinvoices[index] = data;
    index = listinvoiceClient.indexWhere((element) => element.idInvoice == id_invoice);
    listinvoiceClient[index] = data;
    // listinvoiceClient
    // body.addAll(
    //     InvoiceModel.fromJson(listinvoices[index]));
    // listinvoices[index]= InvoiceModel.fromJson(body);
    // //listClient.removeAt(index);
    isloading = false;
    notifyListeners();
  }

  bool isloadingdone = false;

  Future<void> setdatedone_vm(Map<String, dynamic?> body, String? id_invoice) async {
    isloadingdone = true;
    notifyListeners();
    int index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    int index1 = listinvoiceClientSupport.indexWhere((element) => element.idInvoice == id_invoice);
    InvoiceModel inv = await Invoice_Service().setdatedone(body, id_invoice!);
    if (index != -1) listinvoices[index] = inv;
    if (index1 != -1) listinvoiceClientSupport[index1] = inv;
    isloadingdone = false;
    notifyListeners();
  }

  Future<void> set_ready_install(Map<String, dynamic?> body, String? id_invoice) async {
    isloadingdone = true;
    notifyListeners();
    int index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    int index1 = listinvoiceClientSupport.indexWhere((element) => element.idInvoice == id_invoice);
    InvoiceModel inv = await Invoice_Service().set_ready_install(body, id_invoice!);
    if (index != -1) listinvoices[index] = inv;
    if (index1 != -1) listinvoiceClientSupport[index1] = inv;
    isloadingdone = false;
    notifyListeners();
  }

  Future<void> get_invoice_deleted() async {
    if (listdeletedinvoice.isEmpty)
      listdeletedinvoice = await Invoice_Service().getinvoice_deleted(usercurrent!.fkRegoin.toString());
    notifyListeners();
  }

  void disposValue(index) {
    print("dispose " + index.toString());
    if (index != -1)
      listinvoiceClient.removeAt(index);
    else {
      listinvoiceClient = [];
    }
    listproductinvoic = [];
    notifyListeners();
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getAgentsAndDistributors();
      agentDistributorsState = agentDistributorsState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  PageState<List<ParticipateModel>> collaboratorsState = PageState();

  ParticipateModel? selectedCollaborator;
  AgentDistributorModel? selectedAgent;
  AgentDistributorModel? selectedDistributor;

  Future<void> getCollaborators() async {
    try {
      if (!collaboratorsState.isLoading) {
        collaboratorsState = collaboratorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getCollaborators();
      collaboratorsState = collaboratorsState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      collaboratorsState = collaboratorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  SellerType? selectedSellerType;
  SellerStatus sellerStatus = SellerStatus.init;

  Future<void> onChangeSellerType(SellerType sellerType, {InvoiceModel? invoice}) async {
    selectedSellerType = sellerType;
    notifyListeners();
    if (selectedSellerType != SellerType.collaborator) {
      if (agentDistributorsState.data != null) {
        if (invoice != null) {
          if (selectedSellerType == SellerType.agent) {
            selectedAgent =
                agentDistributorsState.data?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);
          } else {
            selectedDistributor =
                agentDistributorsState.data?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);
          }
          notifyListeners();
        }
        return;
      }

      sellerStatus = SellerStatus.loading;
      notifyListeners();

      final result = await getAgentsAndDistributors();
      if (agentDistributorsState.isSuccess) {
        sellerStatus = SellerStatus.loaded;

        if (invoice != null) {
          if (selectedSellerType == SellerType.agent) {
            selectedAgent =
                agentDistributorsState.data?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);
          } else {
            selectedDistributor =
                agentDistributorsState.data?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);
          }
          notifyListeners();
        }
      } else {
        sellerStatus = SellerStatus.failed;
      }
      notifyListeners();
      return;
    }

    if (collaboratorsState.data != null) {
      if (invoice != null) {
          selectedCollaborator =
              collaboratorsState.data?.firstWhereOrNull((element) => element.id_participate == invoice.participate_fk);
        notifyListeners();
      }
      return;
    }

    sellerStatus = SellerStatus.loading;
    notifyListeners();

    final result = await getCollaborators();
    if (collaboratorsState.isSuccess) {
      sellerStatus = SellerStatus.loaded;
      if (invoice != null) {
        selectedCollaborator =
            collaboratorsState.data?.firstWhereOrNull((element) => element.id_participate == invoice.participate_fk);
        notifyListeners();
      }
    } else {
      sellerStatus = SellerStatus.failed;
    }
    notifyListeners();

    return;
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgent(AgentDistributorModel agentDistributorModel) {
    if (selectedSellerType == SellerType.agent) {
      selectedAgent = agentDistributorModel;
    } else {
      selectedDistributor = agentDistributorModel;
    }
    notifyListeners();
  }

  initAdditionalInformation(InvoiceModel invoiceModel) {
    if( invoiceModel.type_seller == "3"){
      return;
    }

    final sellerType = SellerType.values[int.parse(invoiceModel.type_seller ?? '0')];
    onChangeSellerType(sellerType, invoice: invoiceModel);
  }

  resetAdditionalInformation() {
    selectedCollaborator = null;
    selectedAgent = null;
    selectedDistributor = null;
    selectedSellerType = null;
    agentDistributorsState = PageState();
    collaboratorsState = PageState();
  }
}
