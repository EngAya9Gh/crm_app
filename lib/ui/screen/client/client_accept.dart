import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/ui/widgets/client_widget/clientAccept.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientAccept extends StatefulWidget {
  ClientAccept({Key? key}) : super(key: key);

  @override
  _ClientAcceptState createState() => _ClientAcceptState();
}

class _ClientAcceptState extends State<ClientAccept> {
  String? regoin;
  String? typeclientvalue;
  late List<MainCityModel>? selecteditemmaincity = [];
  late TextEditingController _searchTextField;

  late final ClientProvider clientProvider;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    clientProvider = Provider.of<ClientProvider>(context, listen: false);
    mainCityProvider = Provider.of<MainCityProvider>(context, listen: false);
    _searchTextField = TextEditingController();
    _searchTextField.addListener(onSearch);
    context.read<MainCityProvider>().changeitemlist([], isInit: true);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await   Provider.of<invoice_vm>(context, listen: false).getinvoices();
      // Add Your Code here.
      // only
      clientProvider.clear();
      //Provider.of<typeclient>(context,listen: false).changelisttype_install(null);
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      clientProvider.listClientAccept = [];
      // Provider.of<client_vm>(context, listen: false)
      //   .getallclient();
      // Provider.of<client_vm>(context, listen: false). getclient_Local('مشترك');

      //  Provider.of<client_vm>(context,listen: false)
      //     .getallclientAccept();
      if (mainCityProvider.selectedRegions.isEmpty) {
        mainCityProvider.selectedRegions = mainCityProvider.listmaincityfilter;
      }
      clientProvider.getfilterviewSupport(mainCityProvider.selectedRegions);
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
    context.read<ClientProvider>().onSearch(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'العملاء المشتركين',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<MainCityProvider>(
                            builder: (context, cart, child) {
                              return DropdownSearch<
                                  MainCityModel>.multiSelection(
                                showFavoriteItems: true,
                                mode: Mode.DIALOG,
                                filterFn: (user, filter) =>
                                    user!.getfilteruser(filter!),
                                compareFn: (item, selectedItem) =>
                                    item?.id_maincity ==
                                    selectedItem?.id_maincity,
                                // itemAsString: (UserModel u) => u.userAsStringByName(),
                                items: cart.listmaincityfilter,
                                // showSelectedItems: true,
                                selectedItems: cart.selectedRegions,
                                itemAsString: (u) => u!.userAsString(),
                                onChanged: (data) {
                                  // if contains all then check all cities
                                  if (data.any((element) =>
                                      element.namemaincity == 'الكل')) {
                                    data = cart.listmaincityfilter;
                                  }
                                  selecteditemmaincity = data;
                                  // remove the choice "all" only
                                  if (data.any((element) =>
                                      element.namemaincity == 'الكل')) {
                                    data.removeWhere((element) =>
                                        element.namemaincity == 'الكل');
                                  }
                                  cart.changeitemlist(data);
                                  filtershow();
                                },
                                //selectedItem: cart.selecteduser,
                                showSearchBox: true,
                                dropdownSearchDecoration: InputDecoration(
                                  //filled: true,
                                  isCollapsed: true,
                                  hintText: 'المنطقة',
                                  alignLabelWithHint: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  //labelText: "choose a user",
                                  contentPadding: EdgeInsets.all(0),
                                  //contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  // focusedBorder: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     borderSide: const BorderSide(color: Colors.white)),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  // OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(10),
                                  //     borderSide: const BorderSide( color: Colors.white)),
                                ),
                                // InputDecoration(border: InputBorder.none),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  SizedBox(height: 5),
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
                        Consumer<ClientProvider>(
                            builder: (context, value, child) {
                          final list = _searchTextField.text.isEmpty
                              ? value.listClientAccept
                              : value.listClientAcceptFilter;
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
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<ClientProvider>(
                          builder: (context, value, child) {
                        final list = _searchTextField.text.isEmpty
                            ? value.listClientAccept
                            : value.listClientAcceptFilter;

                        return value.isloading == true
                            ? Center(child: CircularProgressIndicator())
                            : list.length == 0
                                ? Center(child: Text(messageNoData))
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: list.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: cardAccept(
                                                  itemClient: list[index],
                                                ),
                                              );
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

  void filtershow() {
    //
    //   Provider.of<invoice_vm>(context,listen: false)
    //       .getclienttype_filter(typeclientvalue!,regoin,'only');
    clientProvider.getfilterviewSupport(selecteditemmaincity);
    //   if(regoin==null)
    //  Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    // else {
    //
    //   Provider.of<invoice_vm>(context,listen: false).getclienttype_filter(typepayController,regoin);
    //
    // }
  }
}
