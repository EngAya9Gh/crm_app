import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/models/location/branch_model.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../view_model/regoin_vm.dart';
import 'add_regoin.dart';

class regoinview extends StatefulWidget {
  const regoinview({super.key});

  @override
  _regoinviewState createState() => _regoinviewState();
}

class _regoinviewState extends State<regoinview> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<RegionProvider>(context, listen: false).getRegions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BranchModel> _listlevel =
        Provider.of<RegionProvider>(context, listen: true).listRegion;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفروع',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
        centerTitle: true,
      ),
      floatingActionButton:
          // Provider.of<privilge_vm>(context,listen: true)
          //     .checkprivlge('64')==true ?
          FloatingActionButton(
        child: Icon(Icons.add, color: AppColors.white),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => addregoin(
                fk_country: null,
                idregoin: null,
                nameregoin: null,
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
      ),
      //:Container(),
      body: _listlevel.length == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _listlevel.length,
                itemBuilder: (BuildContext context, int index) => Builder(
                    builder: (context) => SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  AppNavigator.push(addregoin(
                                    fk_country: _listlevel[index].countryId,
                                    nameregoin: _listlevel[index].branchName,
                                    idregoin: _listlevel[index].branchId,
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 8.0,
                                        color: Colors.black87.withOpacity(0.2),
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),

                                      //color: AppColors.kMainColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Center(
                                          child: Text(
                                            _listlevel[index].branchName,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppFonts.fontFamily2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                //     _listProd.map(
                //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
                // ).toList(),
              ),
            ),
    );
  }
}
