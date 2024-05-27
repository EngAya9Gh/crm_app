import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/calendar_widget.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/main_city_drop_down.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/user_drop_down.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SupportTable extends StatefulWidget {
  const SupportTable({Key? key}) : super(key: key);

  @override
  _SupportTableState createState() => _SupportTableState();
}

class _SupportTableState extends State<SupportTable> {
  late EventProvider _eventProvider;
  late final SupportTabCubit supportTabCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    super.initState();
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    mainCityProvider = context.read<MainCityProvider>();
    final userProvider = context.read<UserProvider>();
    final regionProvider = context.read<RegionProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _eventProvider = context.read<EventProvider>();

      userProvider.changevalueuser(null, true);
      await userProvider.getUsersVm();
      regionProvider.changeVal(null);
      //
      _eventProvider.fkCountry = userProvider.currentUser.fkCountry!;
      //
      supportTabCubit.resetFilter(mainCityProvider.listmaincityfilter);
      await supportTabCubit.getDateInstallation(
        GetDateInstallationParams(
          fkCountry: AppConstants.currentCountry(context)!,
        ),
        onSuccess: (listEvents) {
          Provider.of<EventProvider>(context, listen: false)
              .handleEventsMap(listEvents);
        },
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
                MainCityDropdown(),
                UserDropdown(),
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
