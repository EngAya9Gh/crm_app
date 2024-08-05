import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/filter_dates_table_sheet.dart';

class DatesTablePage extends StatefulWidget {
  const DatesTablePage({Key? key}) : super(key: key);

  @override
  _DatesTablePageState createState() => _DatesTablePageState();
}

class _DatesTablePageState extends State<DatesTablePage> {
  late EventProvider _eventProvider;
  late final DatesTableCubit datesTableCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    super.initState();
    mainCityProvider = context.read<MainCityProvider>();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context)
      ..init(mainCityProvider.listmaincityfilter)
      ..getSubscribedClients();

    final userProvider = context.read<UserProvider>();
    final regionProvider = context.read<RegionProvider>();
    _eventProvider = context.read<EventProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userProvider.changevalueuser(null, true);
      await userProvider.getUsersVm();
      regionProvider.changeVal(null);

      _eventProvider.fkCountry = userProvider.currentUser.fkCountry!;

      await datesTableCubit.getDateInstallation(
        fkCountry: AppConstants.currentCountry(context)!,
        onSuccess: (listEvents) {},
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCityProvider>().changeItemsList([], isInit: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'جدول التركيب للعملاء',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Flexible(
                      child: CustomSearchWidget(
                        hint: "العنوان، الوصف، اسم المؤسسة...",
                        searchController:
                            datesTableCubit.pageVariables.searchController,
                        onChanged: (value) {
                          datesTableCubit.filterEventsLocally();
                        },
                      ),
                    ),
                    CustomFilterIcon(
                      onTap: () async {
                        final value = await AppBottomSheet.show(
                          context: context,
                          child: FilterDatesTableSheet(),
                        );
                        if (value != true) {
                          datesTableCubit.returnToPreviousState();
                        }
                      },
                    ),
                    8.width,
                  ],
                ),
                SizedBox(height: 5),
                CalendarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
