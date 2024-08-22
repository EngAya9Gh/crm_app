import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/common/models/client_model.dart';
import '../../../../core/common/widgets/card_invoice_client.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../view_model/client_vm.dart';
import '../../../../view_model/invoice_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../search/search_container.dart';

class invoice_marketing extends StatefulWidget {
  invoice_marketing({Key? key}) : super(key: key);

  @override
  _invoice_marketingState createState() => _invoice_marketingState();
}

class _invoice_marketingState extends State<invoice_marketing> {
  String? regoin;
  String? typeclientvalue;
  late ClientModel itemClient;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<ClientTypeProvider>(context, listen: false)
          .changelisttype_install(null);
      Provider.of<RegionProvider>(context, listen: false).changeVal(null);
      Provider.of<InvoiceVm>(context, listen: false)
          .getinvoice_marketing(getIt<PrivilegeCubit>());
      await Provider.of<ClientProvider>(context, listen: false)
          .getclientMarketing(getIt<PrivilegeCubit>());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فواتير عملاء التسويق الالكتروني',
          style: TextStyle(color: AppColors.kWhiteColor),
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
                      context.read<PrivilegeCubit>().checkPrivilege('8') == true
                          ? //regoin
                          Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Consumer<RegionProvider>(
                                  builder: (context, cart, child) {
                                    return DropdownButton(
                                      isExpanded: true,
                                      hint: Text("الفرع"),
                                      items: cart.listRegionFilter
                                          .map((level_one) {
                                        return DropdownMenuItem(
                                          child: Text(level_one.regionName),
                                          //label of item
                                          value: level_one
                                              .regionId, //value of item
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
                                    //);
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 8),
                          child: Consumer<ClientTypeProvider>(
                              builder: (context, cart, child) {
                            return DropdownButton(
                              isExpanded: true,
                              hint: Text('الحالة'),
                              items: cart.listtype_install.map((level_one) {
                                return DropdownMenuItem(
                                  child: Text(level_one), //label of item
                                  value: level_one, //value of item
                                );
                              }).toList(),
                              value: cart.selectedlisttype_install,
                              onChanged: (value) {
                                cart.changelisttype_install(value.toString());
                                typeclientvalue = value.toString();

                                filtershow();
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  search_widget(
                    'marketinvoice',
                    hintnamefilter, '',
                    // onChange: (value) => filtershow(query: value),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عدد الفواتير',
                          style: TextStyle(
                              fontFamily: AppFonts.fontFamily2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Provider.of<InvoiceVm>(context, listen: true)
                              .listinvoicesMarketing
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
                    height: MediaQuery.of(context).size.height * 0.73,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Consumer<InvoiceVm>(builder: (context, value, child) {
                        return value.isloading_marketing == true
                            ? Center(child: CircularProgressIndicator())
                            : value.listinvoicesMarketing.length == 0
                                ? Center(child: Text(messageNoData))
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: value
                                                .listinvoicesMarketing.length,
                                            itemBuilder: (context, index) {
                                              return SingleChildScrollView(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child: CardInvoiceClient(
                                                      type: 'profile',
                                                      invoice: value
                                                              .listinvoicesMarketing[
                                                          index],
                                                      //itemClient :  itemClient,
                                                    )),
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

  void filtershow({String? query}) {
    Provider.of<InvoiceVm>(context, listen: false)
        // .getclienttype_marketing(typeclientvalue,regoin,'only');
        .onFilterInvoice(typeclientvalue, regoin, query);

    // }
  }
}
