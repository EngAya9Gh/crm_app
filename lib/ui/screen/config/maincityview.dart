import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/config/theme/theme.dart';
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'addmaincity.dart';
import 'cityview.dart';

class maincityview extends StatefulWidget {
  const maincityview({Key? key}) : super(key: key);

  @override
  _maincityviewState createState() => _maincityviewState();
}

class _maincityviewState extends State<maincityview> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<MainCityProvider>(context, listen: false).getmaincity();
      //.getcity('config/getcity.php?fk_maincity');
    });
    super.initState();
  }

  List<MainCityModel> _listlevel = [];

  @override
  Widget build(BuildContext context) {
    _listlevel = Provider.of<MainCityProvider>(context, listen: true).listmaincity;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المناطق',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      floatingActionButton: context.read<PrivilegeCubit>().checkPrivilege('78') == true
          ? FloatingActionButton(
              child: Icon(Icons.add, color: AppColors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => addmaincity(
                      fkcountry: null,
                      idregoin: null,
                      nameregoin: null,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              backgroundColor: kMainColor,
            )
          : Container(),
      body: _listlevel.length == 0
          ? Center(child: Text(''))
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
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => cityview(
                                                fkmain: _listlevel[index].id_maincity,
                                              )));
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
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),

                                      //color: kMainColor,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Center(
                                                  child: Text(
                                                    _listlevel[index].namemaincity,
                                                    style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: kMainColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    CupertinoPageRoute<void>(
                                                      builder: (BuildContext context) => addmaincity(
                                                        fkcountry: _listlevel[index].fk_country,
                                                        idregoin: _listlevel[index].id_maincity,
                                                        nameregoin: _listlevel[index].namemaincity,
                                                      ),
                                                      fullscreenDialog: true,
                                                    ),
                                                  );
                                                },
                                                //onPressed: BOOKMARK,
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
