import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/extensions/build_context.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../view_model/communication_vm.dart';
import 'communcation_view_widget.dart';

class CareClientView extends StatefulWidget {
  CareClientView({
    required this.fk_client,
    Key? key,
    this.tabCareIndex = 0,
    required this.idCommunication,
  }) : super(key: key);
  String fk_client;
  int tabCareIndex;
  String idCommunication;

  @override
  _CareClientViewState createState() => _CareClientViewState();
}

class _CareClientViewState extends State<CareClientView> {
  Map tabsToIndex = {
    0: "ترحيب",
    1: "تركيب",
    2: "دوري",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: tabBar(),
      ),
    );
  }

  Widget tabBar() {
    return Consumer<CommunicationVm>(builder: (context, communicationVm, _) {
      final carteClientState = communicationVm.careClientState;
      final isLoading = communicationVm.isLoadingCareClient;

      final initialIndex = carteClientState.keys
                  .toList()
                  .indexOf(tabsToIndex[widget.tabCareIndex]) ==
              -1
          ? 0
          : carteClientState.keys
              .toList()
              .indexOf(tabsToIndex[widget.tabCareIndex]);
      if (isLoading) {
        return Center(child: CircularProgressIndicator.adaptive());
      }
      return DefaultTabController(
        length: carteClientState.keys.length,
        initialIndex: initialIndex,
        child: Builder(builder: (context) {
          return Column(
            children: [
              AddManualTaskButton(
                list: carePublicTypeList,
                clientId: widget.fk_client,
              ),
              TabBar(
                controller: DefaultTabController.of(context),
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 0),
                indicator: _CustomIndicator(color: AppColors.primaryColor),
                unselectedLabelStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade700,
                    fontFamily: AppFonts.fontFamily2),
                labelStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: AppFonts.fontFamily2),
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.grey.shade700,
                splashBorderRadius: BorderRadius.circular(15),
                overlayColor: MaterialStateProperty.all(
                    AppColors.primaryColor.withOpacity(0.05)),
                tabs: carteClientState.keys.map((e) => Tab(text: e)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: carteClientState.keys.mapIndexed((i, e) {
                    final list = carteClientState.values.toList()[i];

                    return ListView.separated(
                      itemBuilder: (context, index) =>
                          CommunicationExpandedWidget(
                        element: list[index],
                        initiallyExpanded: list[index].idCommunication ==
                            widget.idCommunication,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
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
}

class _CustomIndicator extends Decoration {
  const _CustomIndicator({
    this.color = AppColors.primaryColor,
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
    final Offset circleOffset = offset +
        Offset(configuration.size!.width / 2, configuration.size!.height);

    final Rect rect =
        Rect.fromCenter(center: circleOffset, width: 70, height: 4);
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      _paint,
    );
  }
}
