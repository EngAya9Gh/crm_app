import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../view_model/client_vm.dart';
import 'profileclient.dart';

class TransferPage extends StatefulWidget {
  TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  String? regoin;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientProvider>(context, listen: false)
          .getAllClientTransfer();
    });
    //Provider.of<notifyvm>(context,listen: false).getNotification();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 10)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'موافقات تحويل العملاء',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Consumer<ClientProvider>(builder: (context, value, child) {
            if (value.isloading) {
              return AppLoader();
            } else if (value.listClientAprroveTransfer.isEmpty) {
              return Center(child: Text(messageNoData));
            }
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: value.listClientAprroveTransfer.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30)),
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
                          //pushReplacement
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ProfileClient(
                                        clientTransfer: 'transfer',
                                        idClient: value
                                            .listClientAprroveTransfer[index]
                                            .idClients,
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          //height: 70,//MediaQuery.of(context).size.height*0.15,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Flex(
                              direction: Axis.vertical,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          value.listClientAprroveTransfer[index]
                                              .nameusertransfer
                                              .toString(),
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              fontFamily: kfontfamily2,
                                              color: kMainColor),
                                        ),
                                        Text(
                                          value.listClientAprroveTransfer[index]
                                              .dateTransfer
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily: kfontfamily2,
                                              color: kMainColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          value.listClientAprroveTransfer[index]
                                              .nameEnterprise
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: kfontfamily2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
