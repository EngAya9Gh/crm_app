import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/partic_agent/participate_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/config/theme/theme.dart';
import '../../../view_model/participate_vm.dart';

class participate_view extends StatefulWidget {
  participate_view({Key? key}) : super(key: key);

  @override
  _resoan_viewState createState() => _resoan_viewState();
}

class _resoan_viewState extends State<participate_view> {
  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<participate_vm>(context, listen: false).get_participate();
    });
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
    context.read<participate_vm>().onSearch(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المتعاونين',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      floatingActionButton:
          // Provider.of<privilge_vm>(context,listen: true)
          //     .checkprivlge('74')==true ?
          FloatingActionButton(
        child: Icon(Icons.add,color: AppColors.white),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute<void>(
              builder: (BuildContext context) => addParticipate(
                id_participate: null,
                name_participate: '',
                mobile_participate: '',
                namebank_participate: '',
                numberbank_participate: '',
              ),
              fullscreenDialog: true,
            ),
          );
        },
        backgroundColor: kMainColor,
      ),
      //:Container(),
      body: Consumer<participate_vm>(builder: (context, value, _) {
        final list = _searchTextField.text.isEmpty ? value.list_paricipate : value.listParticipatesFilterSearch;

        return list.length == 0
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          )),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: _searchTextField,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                hintText: "اسم المتعاون, رقم الموبايل للمتعاون.....",
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
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) => Builder(
                            builder: (context) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) => addParticipate(
                                                      name_participate: list[index].name_participate,
                                                      id_participate: list[index].id_participate,
                                                      mobile_participate: list[index].mobile_participate,
                                                      namebank_participate: list[index].namebank_participate,
                                                      numberbank_participate: list[index].numberbank_participate,
                                                      // type: widget.type,
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
                                            child: Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Center(
                                                child: Text(
                                                  list[index].name_participate,
                                                  style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
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
                  ],
                ),
              );
      }),
    );
  }
}
