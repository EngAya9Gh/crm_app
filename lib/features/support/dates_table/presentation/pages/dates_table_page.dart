import '../../../../../constants.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/main_city_drop_down.dart';
import '../widgets/user_drop_down.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportTable extends StatefulWidget {
  const SupportTable({Key? key}) : super(key: key);

  @override
  _SupportTableState createState() => _SupportTableState();
}

class _SupportTableState extends State<SupportTable> {
  late EventProvider _eventProvider;
  late final DatesTableCubit datesTableCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    super.initState();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    datesTableCubit.isAllEvents = true;
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
      datesTableCubit.resetFilter(mainCityProvider.listmaincityfilter);
      await datesTableCubit.getDateInstallation(
        GetDateInstallationParams(
          fkCountry: AppConstants.currentCountry(context)!,
        ),
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
                MainCityDropdown(),
                SizedBox(height: 10),
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
