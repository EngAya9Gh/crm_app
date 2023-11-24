import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/custom_widget/RowWidget.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_expansion.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../function_global.dart';
import '../../../model/clientmodel.dart';
import '../../../model/usermodel.dart';
import '../../../provider/selected_button_provider.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import 'cardcommAlltype.dart';
import 'install_add.dart';

class View_installedClient extends StatefulWidget {
  const View_installedClient({Key? key}) : super(key: key);

  @override
  _View_installedClientState createState() => _View_installedClientState();
}

class _View_installedClientState extends State<View_installedClient> {
  // List<CommunicationModel> listCommunicationinstall = [];
  // bool isload = false;
  String? regoin;
  String? typeclientvalue = 'الكل';
  int type = 1;
  late TextEditingController _searchTextField;
  String? employeeId;
  bool isMyClients = false;
  late UserModel user;
  late String userId;

  @override
  void initState() {
    user = context.read<UserProvider>().currentUser;
    userId = user.idUser!;
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false).changelisttype_install_iso('الكل');
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<selected_button_provider>(context, listen: false).selectValuebarsales(0);
      context.read<UserProvider>().changevalueuser(null, true);
      await Provider.of<communication_vm>(context, listen: false)
          .getCommunicationInstall(1, '');
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    context.read<communication_vm>().onSearch(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'جودة التركيب والتدريب',
            style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // privilge.checkprivlge('1') == true ? //regoin
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Consumer<RegionProvider>(
                        builder: (context, cart, child) {
                          return DropdownButton(
                            isExpanded: true,
                            hint: Text("الفرع"),
                            items: cart.listRegionFilter.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.regionName),
                                //label of item
                                value: level_one.regionId, //value of item
                              );
                            }).toList(),
                            value: cart.selectedRegionId,
                            onChanged: (value) {
                              //  setState(() {
                              cart.changeVal(value.toString());
                              regoin = value.toString();
                              filtershow();
                            },
                          );
                          //);
                        },
                      ),
                    ),
                  ), // : Container(),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientTypeProvider>(builder: (context, cart, child) {
                        return DropdownButton(
                          isExpanded: true,
                          hint: Text('الحالة'),
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_install_iso.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                          value: cart.selectedinstall_iso,
                          onChanged: (value) {
                            //namemanage=value.toString();
                            cart.changelisttype_install_iso(value.toString());
                            typeclientvalue = value.toString();



                            filtershow();
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Consumer<UserProvider>(
                  builder: (context, user, child) {
                    return Row(
                      children: [
                        if (user.selectedUser != null) ...{
                          IconButton(
                            onPressed: () {
                              employeeId = null;
                              context.read<UserProvider>().changevalueuser(null);
                              filtershow();
                            },
                            icon: Icon(Icons.highlight_off),
                          ),
                          SizedBox(width: 10),
                        },
                        Expanded(
                          child: DropdownSearch<UserModel>(
                            mode: Mode.DIALOG,
                            filterFn: (user, filter) => user!.getfilteruser(filter!),
                            compareFn: (item, selectedItem) => item?.idUser == selectedItem?.idUser,
                            showSelectedItems: true,
                            items: user.usersSupportManagement,
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) {
                              context.read<UserProvider>().changevalueuser(data);
                              employeeId = data?.idUser;
                              filtershow();
                            },
                            selectedItem: user.selectedUser,
                            showSearchBox: true,
                            dropdownSearchDecoration: InputDecoration(
                              isCollapsed: true,
                              hintText: 'الموظف',
                              alignLabelWithHint: true,
                              fillColor: Colors.grey.withOpacity(0.2),
                              contentPadding: EdgeInsets.all(0),
                              border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                            ),
                            // InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              SwitchListTile(
                value: isMyClients,
                onChanged: (value) {
                  setState(() => isMyClients = value);
                  String myClientsParam = '';
                  if (isMyClients) {
                    myClientsParam = '&fk_user=$userId';
                  }
                  filtershow(myClientsParam);
                },
                title: Text("عملائي"),
              ),
              Consumer<selected_button_provider>(builder: (context, selectedProvider, child) {
                return GroupButton(
                    controller: GroupButtonController(
                      selectedIndex: selectedProvider.isbarsales,
                    ),
                    options: GroupButtonOptions(buttonWidth: 90, borderRadius: BorderRadius.circular(10)),
                    buttons: [' التواصل الأول ', 'التواصل الثاني'],
                    onSelected: (_, index, isselected) {

                      switch (index) {
                        case 0:
                          type = 1; //1
                          break;
                        case 1:
                          type = 2; //2
                          break;
                      }

                      selectedProvider.selectValuebarsales(index);
                      String myClientsParam = '';
                      if (isMyClients) {
                        myClientsParam = '&fk_user=$userId';
                      }
                      filtershow(myClientsParam);
                      filtershow(myClientsParam);
                    });
              }),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    )),
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchTextField,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: hintnamefilter,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'عدد العملاء',
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                    ),
                    Consumer<communication_vm>(builder: (context, value, _) {
                      final list = _searchTextField.text.isEmpty
                          ? value.listCommunicationInstall
                          : value.listCommunicationFilterSearch;
                      return Text(
                        list.length.toString(),
                        style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<communication_vm>(
                builder: (context, value, child) {
                  final list = _searchTextField.text.isEmpty
                      ? value.listCommunicationInstall
                      : value.listCommunicationFilterSearch;

                  return value.isloading == true
                      ? Center(child: CircularProgressIndicator())
                      : list.length == 0
                          ? Center(child: Text(_searchTextField.text.isEmpty ? messageNoData : "لا يوجد بيانات بحث..."))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Container(
                                height: MediaQuery.of(context).size.height * 0.52,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: list.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(2),
                                                  child: cardcommalltype(
                                                    itemcom: list[index],
                                                    tabCareIndex: 1,
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            );
                },
              ),
            ],
          ),
        ));
  }

  void filtershow([String? myClientsParam]) {
    Provider.of<communication_vm>(context, listen: false)
        .getinstalltype_filter(typeclientvalue, regoin, type, employeeId, myClientsParam);
  }
}
