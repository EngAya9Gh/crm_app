import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/communication_list/data/models/communication_list_response.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:text_scroll/text_scroll.dart';

import '../../../../constants.dart';
import '../../../../ui/screen/client/profileclient.dart';
import '../manager/communication_list_bloc.dart';

class CommunicationListPage extends StatefulWidget {
  const CommunicationListPage({Key? key}) : super(key: key);

  @override
  State<CommunicationListPage> createState() => _CommunicationListPageState();
}

class _CommunicationListPageState extends State<CommunicationListPage> {
  late CommunicationListBloc _communicationListBloc;
  late final fkCountry;
  late final userId;
  late TextEditingController _searchTextField;
  bool isMyClients = false;

  @override
  void initState() {
    _searchTextField = TextEditingController()..addListener(onSearch);
    final currentUser = context.read<user_vm_provider>().currentUser;
    fkCountry = currentUser.fkCountry;
    userId = currentUser.idUser;
    _communicationListBloc = context.read<CommunicationListBloc>()
      ..add(
        GetCommunicationListEvent(fkCountry!, query: _searchTextField.text),
      );
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'قائمة التواصل',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<CommunicationListBloc, CommunicationListState>(
          builder: (context, state) {
            return state.communicationListState.when(
              init: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (data) => Column(
                children: [
                  TextField(
                    textInputAction: TextInputAction.search,
                    controller: _searchTextField,
                    decoration: InputDecoration(
                      hintText: "المؤسسة, العميل, الفرع.....",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SwitchListTile(
                    value: isMyClients,
                    onChanged: (value) {
                      setState(() => isMyClients = value);
                      _communicationListBloc.add(GetCommunicationListEvent(fkCountry!,
                          userId: isMyClients ? userId : null, query: _searchTextField.text));
                    },
                    title: Text("عملائي"),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _communicationListBloc.add(GetCommunicationListEvent(fkCountry!,
                          query: _searchTextField.text, userId: isMyClients ? userId : null)),
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        itemBuilder: (BuildContext context, int index) => communicationWidget(
                          state.communicationListState.data[index],
                        ),
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
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

  Widget communicationWidget(Communication communication) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => ProfileClient(
              idClient: communication.fkClient,
              tabIndex: 4,
              tabCareIndex: 2,
              idCommunication: communication.idCommunication!,
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
                children: [
                  Text(
                    "${communication.idCommunication}#",
                    style: TextStyle(color: Colors.amber, fontFamily: kfontfamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextScroll(
                      communication.nameClient ?? '',
                      mode: TextScrollMode.endless,
                      velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                      delayBefore: Duration(milliseconds: 2000),
                      pauseBetween: Duration(milliseconds: 1000),
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "اسم الشركة:",
                          style: TextStyle(fontFamily: kfontfamily2),
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
                  Container(
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsetsDirectional.only(start: 10),
                    child: Center(
                      child: Text(
                        "دوري",
                        style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
                      ),
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
                    style: TextStyle(color: Colors.grey.shade800, fontFamily: kfontfamily2),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(width: 15),
                  Text(
                    DateFormat("yyyy MMM dd hh:mm a", "ar").format(communication.dateNext ?? DateTime.now()),
                    style: TextStyle(color: Colors.grey, fontFamily: kfontfamily2),
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
