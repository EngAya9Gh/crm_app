import 'package:crm_smart/core/common/models/client_model.dart' as cl;
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/client_widget/cardAllclient.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/common/models/client_model.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../features/sales/clients/clients_list/presentation/pages/client_add_edit_page.dart';
import '../../../../model/ActivityModel.dart';

class clientmarketing extends StatefulWidget {
  clientmarketing({super.key});

  @override
  _clientmarketingState createState() => _clientmarketingState();
}

class _clientmarketingState extends State<clientmarketing> {
  String? iduser;
  String? regoin;
  String? activity = '';
  String? typeclientvalue;
  UserModel? user;
  int isSelectedtypeinstall = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<UserProvider>(context, listen: false).changevalueuser(null);
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changevaluefilter(null);
      await Provider.of<ClientProvider>(context, listen: false)
          .getclientMarketing(getIt<PrivilegeCubit>());
      await Provider.of<ActivityProvider>(context, listen: false)
          .getActivities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'قائمة عملاء التسويق الإلكتروني ',
            style: TextStyle(
                color: AppColors.kWhiteColor, fontFamily: AppFonts.fontFamily2),
          ),
        ),
        floatingActionButton:
            context.read<PrivilegeCubit>().checkPrivilege('47') == true
                ? FloatingActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () async {
                      final cl.ClientModel? clientModel = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ClientAddEditPage(),
                          ));

                      if (clientModel != null) {
                        final client = ClientModel(
                          NameReason_reject: clientModel.NameReason_reject,
                          date_price: clientModel.date_price,
                          date_changetype: clientModel.date_changetype,
                          offer_price: clientModel.offer_price,
                          location: clientModel.location,
                          email: clientModel.email,
                          typeClient: clientModel.typeClient,
                          isApprove: clientModel.isApprove,
                          fkUser: clientModel.fkUser,
                          fkcountry: clientModel.fkcountry,
                          activityTypeFk: clientModel.activityTypeFk,
                          activity_type_title: clientModel.activity_type_title,
                          address_client: clientModel.address_client,
                          amountPaid: clientModel.amountPaid,
                          city: clientModel.city,
                          dateCreate: clientModel.dateCreate,
                          dateTransfer: clientModel.dateTransfer,
                          date_visit_Client: clientModel.date_visit_Client,
                          fkRejectClient: clientModel.fkRejectClient,
                          descActivController: clientModel.descActivController,
                          fkRegoin: clientModel.fkRegoin,
                          fkClientSource: clientModel.fkClientSource,
                          idClients: clientModel.idClients,
                          fkusertrasfer: clientModel.fkusertrasfer,
                          ismarketing: clientModel.ismarketing,
                          idMainCity: clientModel.idMainCity,
                          mobile: clientModel.mobile,
                          mobileuser: clientModel.mobileuser,
                          nameAdduser: clientModel.nameAdduser,
                          name_city: clientModel.name_city,
                          nameClient: clientModel.nameClient,
                          NameClient_recomand: clientModel.NameClient_recomand,
                          nameCountry: clientModel.nameCountry,
                          nameEnterprise: clientModel.nameEnterprise,
                          namemaincity: clientModel.namemaincity,
                          nameRegion: clientModel.nameRegion,
                          nameUser: clientModel.nameUser,
                          nameuserdoning: clientModel.nameuserdoning,
                          nameusertransfer: clientModel.nameusertransfer,
                          phone: clientModel.phone,
                          presystem: clientModel.presystem,
                          presystemtitle: clientModel.presystemtitle,
                          reasonChange: clientModel.reasonChange,
                          nameTransferTo: clientModel.nameTransferTo,
                          transferTo: clientModel.transferTo,
                          size_activity: clientModel.size_activity,
                          sourcclient: clientModel.sourcclient,
                          tag: clientModel.tag,
                          total: clientModel.total,
                          total_paid: clientModel.total_paid,
                          typeJob: clientModel.typeJob,
                          userAdd: clientModel.userAdd,
                          user_do: clientModel.user_do,
                        );

                        context
                            .read<ClientProvider>()
                            .onUpdateListsMarketing(client);
                      }
                    },
                    tooltip: 'إضافة عميل',
                    child: Icon(Icons.add, color: AppColors.white),
                    heroTag: 'add clients',
                  )
                : Container(),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 2),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        context.read<PrivilegeCubit>().checkPrivilege('8') ==
                                true
                            ? //regoin
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Consumer<RegionProvider>(
                                    builder: (context, cart, child) {
                                      return DropdownButton(
                                        isExpanded: true,
                                        hint: Text("الفرع"),
                                        items: cart.listRegionFilter
                                            .map((level_one) {
                                          return DropdownMenuItem(
                                            child: Text(level_one
                                                .branchName), //label of item
                                            value: level_one
                                                .branchId, //value of item
                                          );
                                        }).toList(),
                                        value: cart.selectedRegionId,
                                        onChanged: (value) {
                                          //  setState(() {
                                          cart.changeVal(value.toString());
                                          regoin = value.toString();
                                          filterShow();
                                        },
                                      );
                                      //);
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        // (   privilge.checkprivlge('16')==true
                        //     && privilge.checkprivlge('8')!=true
                        //     && privilge.checkprivlge('15')!=true )?
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 8),
                            child: Consumer<ClientTypeProvider>(
                                builder: (context, cart, child) {
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text('الحالة'),
                                items: cart.typeOfClientFilter.map((level_one) {
                                  return DropdownMenuItem(
                                    child: Text(level_one), //label of item
                                    value: level_one, //value of item
                                  );
                                }).toList(),
                                value: cart.selectedValufilter,
                                onChanged: (value) {
                                  cart.changevaluefilter(value.toString());
                                  typeclientvalue = value.toString();
                                  filterShow();
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),

                    //SizedBox(height: 2,),
                    context.read<PrivilegeCubit>().checkPrivilege('15') ==
                                true ||
                            context
                                    .read<PrivilegeCubit>()
                                    .checkPrivilege('8') ==
                                true
                        ? //user
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
                                            iduser = null;
                                            cart.changevalueuser(null);
                                            filterShow();
                                          },
                                          icon: Icon(Icons.highlight_off)),
                                      SizedBox(width: 10),
                                    },
                                    Expanded(
                                      child:
                                          CustomSearchableDropDown<UserModel>(
                                        hint: 'الموظف',
                                        items: cart.usersMarketingManagement,
                                        itemAsString: (u) => u!.userAsString(),
                                        filterFn: (user, filter) {
                                          return user.getfilteruser(filter);
                                        },
                                        compareFn: (item, selectedItem) =>
                                            item.idUser == selectedItem.idUser,
                                        onChanged: (data) {
                                          iduser = data!.idUser;
                                          cart.changevalueuser(data);
                                          filterShow();
                                        },
                                        selectedItem: cart.selectedUser,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 2,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8,
                      ),
                      child: Consumer<ActivityProvider>(
                        builder: (context, cart, child) {
                          return Row(
                            children: [
                              if (cart.selectedActivity != null) ...{
                                IconButton(
                                    onPressed: () {
                                      activity = '';
                                      cart.onChangeSelectedActivity(null);
                                      filterShow();
                                    },
                                    icon: Icon(Icons.highlight_off)),
                                SizedBox(width: 10),
                              },
                              Expanded(
                                child: CustomSearchableDropDown<ActivityModel>(
                                  hint: 'النشاط',
                                  items: cart.activitiesList,
                                  itemAsString: (u) => u!.userAsString(),
                                  filterFn: (user, filter) {
                                    return user.getFilterActivityType(filter);
                                  },
                                  onChanged: (data) {
                                    cart.onChangeSelectedActivity(data);
                                    activity =
                                        data?.id_activity_type.toString();
                                    filterShow();
                                  },
                                  selectedItem: cart.selectedActivity,
                                ),

                                // DropdownSearch<ActivityModel>(
                                //   mode: Mode.DIALOG,
                                //   filterFn: (user, filter) =>
                                //       user!.getFilterActivityType(filter!),
                                //   compareFn: (item, selectedItem) =>
                                //       item?.id_activity_type ==
                                //       selectedItem?.id_activity_type,
                                //   items: cart.activitiesList,
                                //   itemAsString: (u) => u!.userAsString(),
                                //   onChanged: (data) {
                                //     // iduser = data!.id_activity_type;
                                //     cart.onChangeSelectedActivity(data);
                                //     activity =
                                //         data?.id_activity_type.toString();
                                //     filtershow();
                                //   },
                                //   selectedItem: cart.selectedActivity,
                                //   showSearchBox: true,
                                //   dropdownSearchDecoration: InputDecoration(
                                //     isCollapsed: true,
                                //     hintText: 'النشاط',
                                //     alignLabelWithHint: true,
                                //     fillColor: Colors.grey.withOpacity(0.2),
                                //     contentPadding: EdgeInsets.all(0),
                                //     border: UnderlineInputBorder(
                                //         borderSide: const BorderSide(
                                //             color: Colors.grey)),
                                //   ),
                                //   // InputDecoration(border: InputBorder.none),
                                // ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),

                    search_widget('clientmarketing', hintnamefilter, ''),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'عدد العملاء',
                            style: TextStyle(
                                fontFamily: AppFonts.fontFamily2,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Provider.of<ClientProvider>(context, listen: true)
                                .listClientMarketing
                                .length
                                .toString(),
                            style: TextStyle(
                                fontFamily: AppFonts.fontFamily2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8.0, bottom: 20),
                        child: Consumer<ClientProvider>(
                            builder: (context, value, child) {
                          return value.isloading_marketing
                              ? Center(child: CircularProgressIndicator())
                              : Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              value.listClientMarketing.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: CardAllClient(
                                                  clientModel:
                                                      value.listClientMarketing[
                                                          index],
                                                ));
                                          }),
                                    ),
                                  ],
                                );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

        //    )
        );
  }

  void filterShow() {
    context.read<ClientProvider>().filterClientMarketingSalesList(
          activity: activity,
          idUser: iduser,
          region: regoin,
          typeClient: typeclientvalue,
        );
  }
}
