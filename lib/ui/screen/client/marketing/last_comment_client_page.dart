import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/model/lastCommentClientModel.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/selected_button_provider.dart';
import '../../../../view_model/lastcommentclient_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../IsmarketCheck_last.dart';
import '../profileclient.dart';

class LastCommentClientPage extends StatefulWidget {
  const LastCommentClientPage({Key? key}) : super(key: key);

  @override
  _LastCommentClientPageState createState() => _LastCommentClientPageState();
}

class _LastCommentClientPageState extends State<LastCommentClientPage> {
  String type = 'تفاوض';
  String? idUser = '';
  String isMarketingParams = '';
  bool isMarketing = false;
  late bool haveMarketingPrivilege;
  TextEditingController searchController = TextEditingController();
  late final lastcommentclient_vm readLastCommentVm;

  @override
  initState() {
    super.initState();
    readLastCommentVm =
        Provider.of<lastcommentclient_vm>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<UserProvider>().changevalueuser(null, true);
      readLastCommentVm.setvaluepriv(getIt<PrivilegeCubit>(), false);
      readLastCommentVm.getLastcommentClientModel();
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
                        readLastCommentVm.getData(type, idUser);
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
                                  readLastCommentVm.getData(type, idUser);
                                },
                                icon: Icon(Icons.highlight_off)),
                            SizedBox(width: 10),
                          },
                          Expanded(
                            child: CustomSearchableDropDown<UserModel>(
                              hint: 'الموظف',
                              items: cart.usersMarketingManagement,
                              itemAsString: (u) => u!.userAsString(),
                              selectedItem: cart.selectedUser,
                              onChanged: (data) {
                                idUser = data!.idUser;
                                cart.changevalueuser(data);
                                readLastCommentVm.getData(type, idUser);
                              },
                              filterFn: (user, filter) =>
                                  user.getfilteruser(filter),
                              compareFn: (item, selectedItem) =>
                                  item.idUser == selectedItem.idUser,
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
                    readLastCommentVm.setvaluepriv(
                        getIt<PrivilegeCubit>(), isMarketing);
                    readLastCommentVm.getLastcommentClientModel();
                    readLastCommentVm.getData(type, idUser);
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
                          onChanged: readLastCommentVm.onSearch,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          readLastCommentVm.getLastcommentClientModel();
                        },
                        icon: Icon(readLastCommentVm.order == 'ASC'
                            ? Icons.account_tree_rounded
                            : Icons.account_tree_outlined))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        readLastCommentVm.list_LastcommentClientModel.length,
                    itemBuilder: (context, index) {
                      final LastCommentClientModel currentItem =
                          readLastCommentVm.list_LastcommentClientModel[index];
                      return Container(
                        padding: const EdgeInsets.all(2),
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
                              AppNavigator.push(ProfileClient(
                                tabIndex: 2,
                                client: currentItem.client_obj,
                                idClient: currentItem.client_obj.idClients,
                              ));
                            },
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                //height: 70,//MediaQuery.of(context).size.height*0.15,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Flex(
                                    direction: Axis.vertical,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                currentItem
                                                    .client_obj.name_regoin
                                                    .toString(),
                                                style: _buildTextStyle(),
                                              ),
                                              Text(
                                                currentItem
                                                    .client_obj.nameEnterprise
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  fontFamily: kfontfamily2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                int.parse(currentItem
                                                            .hoursLastComment
                                                            .toString()) <
                                                        0
                                                    ? 'لا يوجد اي تعليق'
                                                    : currentItem
                                                            .hoursLastComment
                                                            .toString() +
                                                        ' يوم ',
                                                style: _buildTextStyle(),
                                              ),
                                              Text(
                                                'مضى على آخر تعليق',
                                                style: _buildTextStyle(),
                                              ),
                                              if (currentItem.ageClient != null)
                                                Text(
                                                  'عمر التفاوض ' +
                                                      currentItem.ageClient!,
                                                  style: _buildTextStyle(),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(fontSize: 12, fontFamily: kfontfamily2, color: kMainColor);
  }
}
