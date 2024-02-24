import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../constants.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/maincitymodel.dart';
import '../../../../ui/screen/client/profileclient.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../app/presentation/widgets/app_drop_down.dart';
import '../../data/models/distinctive_client.dart';
import '../manager/communication_list_bloc.dart';

class CommunicationListPage extends StatefulWidget {
  const CommunicationListPage({Key? key}) : super(key: key);

  @override
  State<CommunicationListPage> createState() => _CommunicationListPageState();
}

class _CommunicationListPageState extends State<CommunicationListPage> {
  late CommunicationListBloc _communicationListBloc;
  late final MainCityProvider _mainCityProvider;
  late final fkCountry;
  late final userId;
  late TextEditingController _searchTextField;
  bool isMyClients = false;

  @override
  void initState() {
    _searchTextField = TextEditingController()..addListener(onSearch);
    final currentUser = context.read<UserProvider>().currentUser;
    fkCountry = currentUser.fkCountry;
    userId = currentUser.idUser;
    _mainCityProvider = context.read<MainCityProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _mainCityProvider.getcityAll();
      _communicationListBloc = context.read<CommunicationListBloc>()
        ..add(GetCommunicationListEvent(fkCountry!,
            query: _searchTextField.text));
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
    _communicationListBloc.add(SearchEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(title: 'قائمة عملاء التميز')),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<CommunicationListBloc, CommunicationListState>(
          builder: (context, state) {
            return state.communicationListState.when(
              init: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (data) => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          controller: _searchTextField,
                          decoration: InputDecoration(
                            hintText: "المؤسسة, العميل, الفرع.....",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      5.horizontalSpace,
                      Expanded(
                        flex: 3,
                        child: BlocBuilder<CommunicationListBloc,
                            CommunicationListState>(
                          builder: (context, state) {
                            return Consumer<MainCityProvider>(
                              builder: (context, cities, child) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: AppDropdownButtonFormField<
                                          CityModel, String?>(
                                        items: cities.listcity,
                                        value: state.selectedCityId,
                                        itemAsString: (item) => item!.name_city,
                                        itemAsValue: (item) => item!.id_city,
                                        onChange: (value) {
                                          if (value == null) {
                                            return;
                                          }
                                          _communicationListBloc.add(
                                              OnChangeRegionEvent(
                                                  value,
                                                  fkCountry!,
                                                  _searchTextField.text));
                                        },
                                        hint: "المدينة",
                                      ),
                                    ),
                                    if (state.selectedCityId != null)
                                      IconButton(
                                          onPressed: () =>
                                              _communicationListBloc.add(
                                                  OnChangeRegionEvent(
                                                      null,
                                                      fkCountry!,
                                                      _searchTextField.text)),
                                          icon: Icon(Icons.close))
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      10.horizontalSpace,
                    ],
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("عدد العملاء"),
                        AppText(data.length.toString()),
                      ],
                    ),
                  ),
                  // SwitchListTile(
                  //   value: isMyClients,
                  //   onChanged: (value) {
                  //     setState(() => isMyClients = value);
                  //     _communicationListBloc.add(GetCommunicationListEvent(fkCountry!,
                  //         userId: isMyClients ? userId : null, query: _searchTextField.text));
                  //   },
                  //   title: Text("عملائي"),
                  // ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _communicationListBloc.add(
                          GetCommunicationListEvent(fkCountry!,
                              query: _searchTextField.text)),
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            communicationWidget(
                          state.communicationListState.data[index],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount: state.communicationListState.data.length,
                      ),
                    ),
                  ),
                ],
              ),
              empty: () => Text("Empty communications"),
              error: (exception) => Text("Exception"),
            );
          },
        ),
      ),
    );
  }

  Widget communicationWidget(DistinctiveClient communication) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => ProfileClient(
              idClient: communication.fkClient,
              tabIndex: 3,
              tabCareIndex: 2,
              // idCommunication: communication.idCommunication!,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          " اسم الشركة: ",
                          // style: TextStyle(fontFamily: kfontfamily2),
                          style: TextStyle(
                              color: kMainColor, fontFamily: kfontfamily2),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: TextScroll(
                            communication.nameEnterprise ?? "",
                            mode: TextScrollMode.endless,
                            velocity: Velocity(pixelsPerSecond: Offset(30, 0)),
                            delayBefore: Duration(milliseconds: 2000),
                            pauseBetween: Duration(milliseconds: 1000),
                            style: TextStyle(fontFamily: kfontfamily2),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    communication.nameRegoin ?? '',
                    style: TextStyle(
                        color: Colors.black, fontFamily: kfontfamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 15),
                  Text(
                    intl.DateFormat("yyyy MMM dd hh:mm a", "ar")
                        .format(communication.dateCreate ?? DateTime.now()),
                    style:
                        TextStyle(color: kMainColor, fontFamily: kfontfamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
