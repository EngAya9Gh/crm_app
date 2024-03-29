import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/selected_button_provider.dart';
import '../../../../view_model/lastcommentclient_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../IsmarketCheck_last.dart';
import '../profileclient.dart';

class getLastCommentClient extends StatefulWidget {
  const getLastCommentClient({Key? key}) : super(key: key);

  @override
  _getLastCommentClientState createState() => _getLastCommentClientState();
}

class _getLastCommentClientState extends State<getLastCommentClient> {
  String type = 'تفاوض';
  String? idUser = '';
  String isMarketingParams = '';
  bool isMarketing = false;
  late bool haveMarketingPrivilege;
  TextEditingController searchController = TextEditingController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //haveMarketingPrivilege = context.read<privilge_vm>().checkprivlge('155');

      context.read<UserProvider>().changevalueuser(null, true);
      Provider.of<lastcommentclient_vm>(context, listen: false)
          .setvaluepriv(getIt<PrivilegeCubit>(), false);
      // if(!haveMarketingPrivilege)
      Provider.of<lastcommentclient_vm>(context, listen: false)
          .getLastcommentClientModel();

      // scheduleMicrotask(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('آخر التعليقات'))),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ModalProgressHUD(
            inAsyncCall:
                Provider.of<lastcommentclient_vm>(context, listen: true).isload,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'عدد العملاء',
                        style: TextStyle(
                            fontFamily: kfontfamily2,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Provider.of<lastcommentclient_vm>(context, listen: true)
                            .list_LastcommentClientModel
                            .length
                            .toString(),
                        style: TextStyle(
                            fontFamily: kfontfamily2,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Consumer<selected_button_provider>(
                    builder: (context, selectedProvider, child) {
                  return GroupButton(
                      controller: GroupButtonController(
                        selectedIndex: selectedProvider.isbarsales,
                      ),
                      options: GroupButtonOptions(
                          buttonWidth: 75,
                          borderRadius: BorderRadius.circular(10)),
                      buttons: ['تفاوض', 'مشترك', 'مستبعد', 'عرض سعر'],
                      onSelected: (_, index, isselected) {
                        switch (index) {
                          case 0:
                            type = 'تفاوض';
                            break;

                          case 1:
                            type = 'مشترك';
                            break;

                          case 2:
                            type = 'مستبعد';
                            break;

                          case 3:
                            type = 'عرض سعر';
                            break;
                        }

                        selectedProvider.selectValuebarsales(index);
                        Provider.of<lastcommentclient_vm>(context,
                                listen: false)
                            .getData(type, idUser);
                      });
                }),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                  ),
                  child: Consumer<UserProvider>(
                    builder: (context, cart, child) {
                      return Row(
                        children: [
                          if (cart.selectedUser != null) ...{
                            IconButton(
                                onPressed: () {
                                  idUser = '';
                                  cart.changevalueuser(null);
                                  Provider.of<lastcommentclient_vm>(context,
                                          listen: false)
                                      .getData(type, idUser);
                                },
                                icon: Icon(Icons.highlight_off)),
                            SizedBox(width: 10),
                          },
                          Expanded(
                            child: DropdownSearch<UserModel>(
                              mode: Mode.DIALOG,
                              filterFn: (user, filter) =>
                                  user!.getfilteruser(filter!),
                              compareFn: (item, selectedItem) =>
                                  item?.idUser == selectedItem?.idUser,
                              items: cart.usersMarketingManagement,
                              itemAsString: (u) => u!.userAsString(),
                              onChanged: (data) {
                                idUser = data!.idUser;
                                cart.changevalueuser(data);
                                Provider.of<lastcommentclient_vm>(context,
                                        listen: false)
                                    .getData(type, idUser);
                              },
                              selectedItem: cart.selectedUser,
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                isCollapsed: true,
                                hintText: 'الموظف',
                                alignLabelWithHint: true,
                                fillColor: Colors.grey.withOpacity(0.2),
                                contentPadding: EdgeInsets.all(0),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                              ),
                              // InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                IsMarketingCheckbox_last(
                  onChange: (value) {
                    isMarketing = value;
                    Provider.of<lastcommentclient_vm>(context, listen: false)
                        .setvaluepriv(getIt<PrivilegeCubit>(), isMarketing);
                    Provider.of<lastcommentclient_vm>(context, listen: false)
                        .getLastcommentClientModel();
                    Provider.of<lastcommentclient_vm>(context, listen: false)
                        .getData(type, idUser);
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: "المؤسسة, العميل, الهاتف,....",
                          ),
                          onChanged: Provider.of<lastcommentclient_vm>(context,
                                  listen: false)
                              .onSearch,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Provider.of<lastcommentclient_vm>(context,
                                  listen: false)
                              .getLastcommentClientModel();
                        },
                        icon: Icon(Provider.of<lastcommentclient_vm>(context,
                                        listen: false)
                                    .order ==
                                'ASC'
                            ? Icons.account_tree_rounded
                            : Icons.account_tree_outlined))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: Provider.of<lastcommentclient_vm>(context,
                              listen: false)
                          .list_LastcommentClientModel
                          .length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                            child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 8.0,
                                        color: Colors.black87.withOpacity(0.2),
                                      ),
                                    ],
                                    color: Colors.white30,
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => ProfileClient(
                                                    tabIndex: 2,
                                                    client: Provider.of<
                                                                lastcommentclient_vm>(
                                                            context,
                                                            listen: false)
                                                        .list_LastcommentClientModel[
                                                            index]
                                                        .client_obj,
                                                    idClient: Provider.of<
                                                                lastcommentclient_vm>(
                                                            context,
                                                            listen: false)
                                                        .list_LastcommentClientModel[
                                                            index]
                                                        .client_obj
                                                        .idClients)));
                                        // Navigator.push(
                                        //     context,
                                        //     CupertinoPageRoute(
                                        //         builder: (context) =>
                                        //         lastcomment_page(
                                        //           LastcommentClient:
                                        //             Provider.of<lastcommentclient_vm>(context,listen: false)
                                        //             .list_LastcommentClientModel[index])
                                        //     ));
                                      },
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          //height: 70,//MediaQuery.of(context).size.height*0.15,
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Flex(
                                              direction: Axis.vertical,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Provider.of<lastcommentclient_vm>(
                                                                  context,
                                                                  listen: false)
                                                              .list_LastcommentClientModel[
                                                                  index]
                                                              .client_obj!
                                                              .name_regoin
                                                              .toString(),
                                                          style: TextStyle(
                                                              //fontWeight: FontWeight.bold,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  kfontfamily2,
                                                              color:
                                                                  kMainColor),
                                                        ),
                                                        Text(
                                                          int.parse(Provider.of<
                                                                              lastcommentclient_vm>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .list_LastcommentClientModel[
                                                                          index]
                                                                      .hoursLastComment
                                                                      .toString()) <
                                                                  0
                                                              ? 'لا يوجد اي تعليق'
                                                              : Provider.of<lastcommentclient_vm>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .list_LastcommentClientModel[
                                                                          index]
                                                                      .hoursLastComment
                                                                      .toString() +
                                                                  ' يوم ',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              //fontWeight: FontWeight.bold,
                                                              fontFamily:
                                                                  kfontfamily2,
                                                              color:
                                                                  kMainColor),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          Provider.of<lastcommentclient_vm>(
                                                                  context,
                                                                  listen: false)
                                                              .list_LastcommentClientModel[
                                                                  index]
                                                              .client_obj!
                                                              .nameEnterprise
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                kfontfamily2,
                                                          ),
                                                        ),
                                                        Text(
                                                          'مضى على آخر تعليق',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              //fontWeight: FontWeight.bold,
                                                              fontFamily:
                                                                  kfontfamily2,
                                                              color:
                                                                  kMainColor),
                                                        ),
                                                      ],
                                                    ),
                                                    // type=='wait'?
                                                    // Row(
                                                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    //   children: [
                                                    //     Text(
                                                    //       'تاريخ التواصل القادم',
                                                    //       style: TextStyle(
                                                    //         fontWeight: FontWeight.bold,
                                                    //         fontSize: 12,
                                                    //         fontFamily: kfontfamily2,
                                                    //       ),
                                                    //     ), Text(
                                                    //       listCommunication[index].dateNext.toString(),
                                                    //       style: TextStyle(
                                                    //         fontWeight: FontWeight.bold,
                                                    //         fontSize: 12,
                                                    //         fontFamily: kfontfamily2,
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ):Container(),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                // cardAccept(
                                //   itemClient: value.listClientAccept[index],
                                // ),
                                ));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
