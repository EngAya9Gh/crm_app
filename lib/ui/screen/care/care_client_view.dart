import 'package:crm_smart/model/communication_modle.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'communcation_view_widget.dart';
import 'package:collection/collection.dart';

class care_client_view extends StatefulWidget {
  care_client_view({
    required this.fk_client,
    Key? key,
    this.tabCareIndex = 0,
    required this.idCommunication,
  }) : super(key: key);
  String fk_client;
  int tabCareIndex;
  String idCommunication;

  @override
  _care_client_viewState createState() => _care_client_viewState();
}

class _care_client_viewState extends State<care_client_view> {
  // List<CommunicationModel> listCommunication = [];
  // List<TicketModel> listticket_client = [];
  // TicketModel? ttc;

  Map tabsToIndex = {
    0: "ترحيب",
    1: "تركيب",
    2: "دوري",
  };

  @override
  Widget build(BuildContext context) {
    // listCommunication = Provider.of<communication_vm>(context, listen: true).listCommunicationClient;
    // listticket_client= Provider.of<ticket_vm>(context, listen: true)
    //     .listticket_client;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: tabBar(),
      ),
    );
  }

  Widget tabBar() {
    return Consumer<communication_vm>(builder: (context, communicationVm, _) {
      final carteClientState = communicationVm.careClientState;
      final isLoading = communicationVm.isLoadingCareClient;

      final initialIndex = carteClientState.keys.toList().indexOf(tabsToIndex[widget.tabCareIndex]) == -1
          ? 0
          : carteClientState.keys.toList().indexOf(tabsToIndex[widget.tabCareIndex]);
      if (isLoading) {
        return Center(child: CircularProgressIndicator.adaptive());
      }
      return DefaultTabController(
        length: carteClientState.keys.length,
        initialIndex: initialIndex,
        child: Builder(builder: (context) {
          return Column(
            children: [
              TabBar(
                controller: DefaultTabController.of(context),
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 0),
                indicator: _CustomIndicator(color: kMainColor),
                unselectedLabelStyle:
                    context.textTheme.titleMedium?.copyWith(color: Colors.grey.shade700, fontFamily: kfontfamily2),
                labelStyle: context.textTheme.titleMedium
                    ?.copyWith(color: kMainColor, fontWeight: FontWeight.w800, fontFamily: kfontfamily2),
                labelColor: kMainColor,
                unselectedLabelColor: Colors.grey.shade700,
                splashBorderRadius: BorderRadius.circular(15),
                overlayColor: MaterialStateProperty.all(kMainColor.withOpacity(0.05)),
                tabs: carteClientState.keys.map((e) => Tab(text: e)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: carteClientState.keys.mapIndexed((i, e) {
                    final list = carteClientState.values.toList()[i];

                    return ListView.separated(
                      itemBuilder: (context, index) => communcation_view_widget(
                        element: list[index],
                        initiallyExpanded: list[index].idCommunication == widget.idCommunication,
                      ),
                      separatorBuilder: (context, index) => SizedBox(height: 10),
                      itemCount: list.length,
                    );
                  }).toList(),
                ),
              )
            ],
          );
        }),
      );
    });
  }

  @Deprecated("This old way for view care client")
  Widget gets() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GroupedListView<CommunicationModel, String>(
          elements: [],
          groupBy: (element) {
            switch (element.typeCommuncation) {
              case 'ترحيب':
                return 'ترحيب';

              case 'تركيب':
                return 'تركيب';

              case 'دوري':
                return 'دوري';
            }
            return '';
          },
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) => item1.idCommunication!.compareTo(item2.idCommunication),
          order: GroupedListOrder.ASC,
          useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          itemBuilder: (c, element) {
            return Container(
                //children: _privilgelist.map(( key) {
                child: Column(
              children: [
                // for(int i=0;i<listCommunication.length;i++)
                // if(listCommunication[i].typeCommuncation!='دوري')
                // communcation_view_widget(element: element),

                // else commview(listCommunication[i])
                //  listCommunication.isNotEmpty?
                //  commview( listCommunication
                //      .firstWhere((element) => element.typeCommuncation=='دوري',
                //  orElse: ()=> CommunicationModel(
                //  idCommunication: '',nameUser: '',nameEnterprise: '',
                //  clientRepeat: '',result: '',number_wrong: '',rate: '',
                //  typeCommuncation: '',mobile: '',notes: '',
                //  fkClient: '',fkUser: '',date_create: '',dateNext: '',
                //  dateCommunication: '',id_invoice: '',dateinstall_done: ''
                //  ) ) ) :Container(),
              ],
            ));

            // );
          },
        ));
  }
}

class _CustomIndicator extends Decoration {
  const _CustomIndicator({
    this.color = kMainColor,
    this.radius = 25.0,
  });

  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(
      color: color,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({
    required this.color,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill,
        super(onChange);

  final Paint _paint;
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset + Offset(configuration.size!.width / 2, configuration.size!.height);

    final Rect rect = Rect.fromCenter(center: circleOffset, width: 70, height: 4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      _paint,
    );
  }
}
