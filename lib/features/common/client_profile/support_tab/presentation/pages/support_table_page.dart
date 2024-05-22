import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/calendar_widget.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/main_city_drop_down.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/user_drop_down.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportTable extends StatefulWidget {
  const SupportTable({Key? key}) : super(key: key);

  @override
  _SupportTableState createState() => _SupportTableState();
}

class _SupportTableState extends State<SupportTable> {
  late EventProvider _eventProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = context.read<UserProvider>();
      final regionProvider = context.read<RegionProvider>();
      _eventProvider = context.read<EventProvider>();

      userProvider.changevalueuser(null, true);
      userProvider.getUsersVm();
      regionProvider.changeVal(null);
      _eventProvider
        ..resetFilter()
        ..setFkCountry(userProvider.currentUser.fkCountry!)
        ..getAppointments();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCityProvider>().changeitemlist([], isInit: true);
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
