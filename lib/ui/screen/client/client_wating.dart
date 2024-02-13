import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardwaiting.dart';
import 'package:crm_smart/ui/widgets/invoice_widget/Card_invoice_client.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../model/usermodel.dart';

class ClientWaiting extends StatefulWidget {
  ClientWaiting({required this.type_card, Key? key}) : super(key: key);
  String type_card;

  @override
  _ClientWaitingState createState() => _ClientWaitingState();
}

class _ClientWaitingState extends State<ClientWaiting> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel1 itemClient;
  late List<MainCityModel> selecteditemmaincity = [];
  late UserModel user;

  @override
  void initState() {
    user = context.read<UserProvider>().currentUser;
    context.read<MainCityProvider>().filterMainCityByCurrentUserMainCityList(user);
    selecteditemmaincity = context.read<MainCityProvider>().selecteditemmaincity;
    context.read<MainCityProvider>().getCitiesFromMainCitiesIds();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<invoice_vm>(context, listen: false).listInvoicesAccept = [];
      Provider.of<ClientTypeProvider>(context, listen: false).changelisttype_install('الكل');
      typeclientvalue = 'الكل';
      // Provider.of<ClientProvider>(context, listen: false).getallclientAccept();
      Provider.of<invoice_vm>(context, listen: false).filterInvoices(listSelectedMainCity: selecteditemmaincity, state: typeclientvalue);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: context.theme.elevatedButtonTheme.style!.copyWith(
              minimumSize: MaterialStatePropertyAll(Size(50, 35.h)),
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: context.theme.textButtonTheme.style!.copyWith(
              minimumSize: MaterialStatePropertyAll(Size(50, 35.h)),
            )
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'فواتير العملاء',
            style: TextStyle(color: kWhiteColor),
          ),
          centerTitle: true,
        ),
        body:SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // privilge.checkprivlge('1') == true ? //regoin
                        // region
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Consumer<MainCityProvider>(
                              builder: (context, cart, child) {
                                return DropdownSearch<MainCityModel>.multiSelection(
                                  mode: Mode.DIALOG,
                                  compareFn: (item, selectedItem) => item?.id_maincity == selectedItem?.id_maincity,
                                  items: cart.listCurrentUserMainCityFilter,
                                  showSelectedItems: true,
                                  selectedItems: cart.selecteditemmaincity,
                                  itemAsString: (u) => u!.userAsString(),
                                  onChanged: (data) {
                                    selecteditemmaincity = data;
                                    cart.changeitemlist(data);
                                    filtershow();
                                  },
                                  showSearchBox: true,
                                  dropdownSearchDecoration: InputDecoration(
                                    isCollapsed: true,
                                    hintText: 'المنطقة',
                                    alignLabelWithHint: true,
                                    fillColor: Colors.grey.withOpacity(0.2),
                                    contentPadding: EdgeInsets.all(0),
                                    border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // state
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 8),
                            child: Consumer<ClientTypeProvider>(builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text('الحالة'),
                                items: cart.listtype_install.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one),
                                    value: level_one,
                                  );
                                }).toList(),
                                value: cart.selectedlisttype_install,
                                onChanged: (value) {
                                  cart.changelisttype_install(value.toString());
                                  typeclientvalue = value.toString();
                                  filtershow();
                                },
                              );
                            }),
                          ),
                        ), //الحالة
                      ],
                    ),
                    SizedBox(height: 10),
                    // filtered cities
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Consumer<MainCityProvider>(
                        builder: (context, cart, child) {
                          return DropdownSearch<CityModel>.multiSelection(
                            mode: Mode.DIALOG,
                            compareFn: (item, selectedItem) => item?.id_city == selectedItem?.id_city,
                            items: cart.filteredCitiesList,
                            // showSelectedItems: true,
                            selectedItems: cart.filteredCitiesList,
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) {
                              context.read<MainCityProvider>().selectedCities = data;
                              filtershow();
                            },
                            showSearchBox: true,
                            dropdownSearchDecoration: InputDecoration(
                              isCollapsed: true,
                              hintText: 'المنطقة',
                              alignLabelWithHint: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              contentPadding: EdgeInsets.all(0),
                              border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                            ),
                          );
                        },
                      ),
                    ),
                    search_widget('waitsupport', hintnamefilter, ''),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'عدد الفواتير',
                            style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Provider.of<invoice_vm>(context, listen: true).listInvoicesAccept.length.toString(),
                            style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.73,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<invoice_vm>(builder: (context, value, child) {
                          return value.isloading == true
                              ? Center(child: CircularProgressIndicator())
                              : value.listInvoicesAccept.length == 0
                              ? Center(child: Text(messageNoData))
                              : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.listInvoicesAccept.length,
                                    itemBuilder: (context, index) {
                                      // itemClient=Provider.of<client_vm>(context,listen: false)
                                      //     .listClient.firstWhere(
                                      //         (element) => element.idClients==value.listInvoicesAccept[index].fkIdClient);
                                      return SingleChildScrollView(
                                        child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: widget.type_card == 'support'
                                                ? cardWaiting(
                                              iteminvoice: value.listInvoicesAccept[index],
                                            )
                                                : CardInvoiceClient(
                                              type: 'profile',
                                              invoice: value.listInvoicesAccept[index],
                                              //itemClient :  itemClient,
                                            )),
                                      );
                                    }),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void filtershow() {

    //    Provider.of<invoice_vm>(context,listen: false)
    //       .getfilterinvoice(regoin);
    // Provider.of<client_vm>(context,listen: false)
    //     .getfilterview(regoin);
    //  String filter='';
    //  switch(typeclientvalue){
    //    case '0':
    //      filter='الكل';
    //      break;
    //    case '1':
    //      filter='بالإنتظار';
    //      break;
    //    case '2':
    //      filter='تم التركيب';
    //      break;
    //  }
    if(selecteditemmaincity.isEmpty){
      selecteditemmaincity = user.maincitylist_user?.map((e) => e.asMainCity).toList() ?? [];
    }

    final List<CityModel> cities = context.read<MainCityProvider>().selectedCities;
      context.read<invoice_vm>().filterInvoices(listSelectedMainCity: selecteditemmaincity, state: typeclientvalue, selectedCities: cities);
    // Provider.of<invoice_vm>(context, listen: false).getfilter_maincity(selecteditemmaincity, typeclientvalue);

    //.getclienttype_filter(typeclientvalue,regoin,'only');

    // }
  }
}
