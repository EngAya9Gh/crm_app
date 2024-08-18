import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/communication_modle.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/communication_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import 'card_comm_all_type.dart';

class View_welcomeClient extends StatefulWidget {
  const View_welcomeClient({Key? key}) : super(key: key);

  @override
  _View_welcomeClientState createState() => _View_welcomeClientState();
}

class _View_welcomeClientState extends State<View_welcomeClient> {
  List<CommunicationModel> listCommunicationwelcome = [];
  bool isload = false;
  String? regoin;
  String? typeclientvalue;
  late UserModel user;
  late String userId;
  late final CommunicationVm _communicationVm;

  @override
  void initState() {
    user = context.read<UserProvider>().currentUser;
    _communicationVm = context.read<CommunicationVm>();
    userId = user.idUser!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changelisttype_welcome('الكل');
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      await _communicationVm.getCommunicationWelcome("");
    });
    super.initState();
  }

  bool isMyClients = false;

  @override
  Widget build(BuildContext context) {
    listCommunicationwelcome =
        Provider.of<CommunicationVm>(context, listen: true)
            .listCommunicationWelcome;
    isload = Provider.of<CommunicationVm>(context, listen: true).isloading;
    return Scaffold(
      appBar: CustomAppBar(title: 'الترحيب بالعملاء '),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
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
                            hint: AppText("الفرع"),
                            items: cart.listRegionFilter.map((level_one) {
                              return DropdownMenuItem(
                                child: AppText(level_one.regionName),
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
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: Consumer<ClientTypeProvider>(
                          builder: (context, cart, child) {
                        return DropdownButton(
                          isExpanded: true,
                          hint: AppText('الحالة'),
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_welcome.map((level_one) {
                            return DropdownMenuItem(
                              child: AppText(level_one), //label of item
                              value: level_one, //value of item
                            );
                          }).toList(),
                          value: cart.selectedwelcome,
                          onChanged: (value) {
                            //namemanage=value.toString();
                            cart.changelisttype_welcome(value.toString());
                            typeclientvalue = value.toString();

                            filtershow();
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
              CustomSearchWidget(
                searchController: TextEditingController(),
                onChanged: (value) {
                  _communicationVm.searchwelcome(
                    value,
                    isMyClients ? '&fk_user=$userId' : '',
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
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
                title: AppText("عملائي"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('عدد العملاء'),
                    AppText(listCommunicationwelcome.length.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<CommunicationVm>(
                      builder: (context, value, child) {
                    return value.isloading == true
                        ? Center(child: CircularProgressIndicator())
                        : value.listCommunicationWelcome.length == 0
                            ? Center(child: AppText(messageNoData))
                            : Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: value
                                            .listCommunicationWelcome.length,
                                        itemBuilder: (context, index) {
                                          return SingleChildScrollView(
                                              child: Container(
                                                  child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: CardCommAllType(
                                                itemcom: value
                                                        .listCommunicationWelcome[
                                                    index],
                                                tabCareIndex: 0),
                                          )));
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
    );
  }

  void filtershow([String? myClientsParam]) {
    Provider.of<CommunicationVm>(context, listen: false)
        .getcommtype_filter(typeclientvalue, regoin, myClientsParam);

    // }
  }
}
