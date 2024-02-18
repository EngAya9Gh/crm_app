import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';

class not_using_system extends StatefulWidget {
  const not_using_system({Key? key}) : super(key: key);

  @override
  _not_using_systemState createState() => _not_using_systemState();
}

class _not_using_systemState extends State<not_using_system> {
  late TextEditingController _searchTextField;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<communication_vm>(context, listen: false)
          .get_wrong_using('use');
    });

    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
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
    context
        .read<communication_vm>()
        .onSearchClientsNotUsingSys(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(labelNotUse),
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
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                )),
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 8, right: 8, bottom: 2),
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
                          15.verticalSpace,
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
                                Consumer<communication_vm>(
                                    builder: (context, value, _) {
                                  final list = _searchTextField.text.isEmpty
                                      ? value.list_not_use
                                      : value.listCommunicationFilterSearch;
                                  return Text(
                                    list.length.toString(),
                                    style: TextStyle(
                                        fontFamily: kfontfamily2,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Consumer<communication_vm>(
                                builder: (context, value, child) {
                              final list = _searchTextField.text.isEmpty
                                  ? value.list_not_use
                                  : value.listCommunicationFilterSearch;

                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: list.length,
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
                                                                idClient: list[
                                                                        index]
                                                                    .fkClient)),
                                                  );
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
                                                                  list[index]
                                                                      .name_regoin
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      //fontWeight: FontWeight.bold,
                                                                      fontSize: 12,
                                                                      fontFamily: kfontfamily2,
                                                                      color: kMainColor),
                                                                ),
                                                                Text(
                                                                  list[index]
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
                                                                  list[index]
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
