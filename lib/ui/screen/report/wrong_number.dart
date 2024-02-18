import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_strings.dart';
import '../../../constants.dart';

class wrong_number extends StatefulWidget {
  const wrong_number({Key? key}) : super(key: key);

  @override
  _wrong_numberState createState() => _wrong_numberState();
}

class _wrong_numberState extends State<wrong_number> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<communication_vm>(context, listen: false)
          .get_wrong_using('wrong');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.labelWrongNumber),
        centerTitle: true,
      ),
      body: Center(
        child: Provider.of<communication_vm>(context, listen: true).isloading
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    child: Column(
                        // scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30, top: 10),
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
                                  Provider.of<communication_vm>(context,
                                          listen: true)
                                      .list_wrong_number
                                      .length
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Consumer<communication_vm>(
                                builder: (context, value, child) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.list_wrong_number.length,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  offset: Offset(1.0, 1.0),
                                                  blurRadius: 8.0,
                                                  color: Colors.black87
                                                      .withOpacity(0.2),
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
                                                          builder: (context) =>
                                                              ProfileClient(
                                                                idClient: value
                                                                    .list_wrong_number[
                                                                        index]
                                                                    .fkClient,
                                                              )));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
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
                                                                  value
                                                                      .list_wrong_number[
                                                                          index]
                                                                      .name_regoin
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      //fontWeight: FontWeight.bold,
                                                                      fontSize: 12,
                                                                      fontFamily: kfontfamily2,
                                                                      color: kMainColor),
                                                                ),
                                                                Text(
                                                                  value
                                                                      .list_wrong_number[
                                                                          index]
                                                                      .dateCommunication
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
                                                                  value
                                                                      .list_wrong_number[
                                                                          index]
                                                                      .nameEnterprise
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        kfontfamily2,
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
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }),
                          )
                        ]),
                  ),
                ),
              ),
      ),
    );
  }
}
