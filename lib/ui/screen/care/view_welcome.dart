import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../model/communication_modle.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/communication_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import '../search/search_container.dart';
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

  @override
  void initState() {
    user = context.read<UserProvider>().currentUser;
    userId = user.idUser!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changelisttype_welcome('الكل');
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      await Provider.of<communication_vm>(context, listen: false)
          .getCommunicationWelcome("");
    });
    super.initState();
  }

  bool isMyClients = false;

  @override
  Widget build(BuildContext context) {
    listCommunicationwelcome =
        Provider.of<communication_vm>(context, listen: true)
            .listCommunicationWelcome;
    isload = Provider.of<communication_vm>(context, listen: true).isloading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الترحيب بالعملاء ',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
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
                          hint: Text('الحالة'),
                          //hint: Text("حدد حالة العميل"),
                          items: cart.type_of_welcome.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one), //label of item
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
              search_widget('welcome', hintnamefilter, 'welcome',
                  myClientsParams: isMyClients ? '&fk_user=$userId' : ''),
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
                title: Text("عملائي"),
              ),
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
                      listCommunicationwelcome.length.toString(),
                      style: TextStyle(
                          fontFamily: kfontfamily2,
                          fontWeight: FontWeight.bold),
                    ),
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
                  child: Consumer<communication_vm>(
                      builder: (context, value, child) {
                    return value.isloading == true
                        ? Center(child: CircularProgressIndicator())
                        : value.listCommunicationWelcome.length == 0
                            ? Center(child: Text(messageNoData))
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
    Provider.of<communication_vm>(context, listen: false)
        .getcommtype_filter(typeclientvalue, regoin, myClientsParam);

    // }
  }
}
