import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/widgets/user_installation_calendar.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/page_state.dart';
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
  late String iduser;

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
                UserDropdown(onUserChanged: (userId) {
                  iduser = userId;
                }),
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

class MainCityDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<MainCityProvider>(
        builder: (context, mainCityProvider, child) {
          return CustomMultiSelectionDropdown<MainCityModel>(
            items: mainCityProvider.listmaincityfilter,
            selectedItems: mainCityProvider.selectedRegions,
            hint: 'المنطقة',
            onChanged: (data) {
              mainCityProvider.changeitemlist(data);
              final eventProvider = context.read<EventProvider>();
              if (data.any((element) => element.id_maincity == '0')) {
                eventProvider.onChangeFkMainCity(
                  mainCityProvider.listmaincityfilter
                      .where((element) => element.id_maincity != "0")
                      .map((e) => e.id_maincity)
                      .toList(),
                );
              } else {
                eventProvider.onChangeFkMainCity(
                  data.map((e) => e.id_maincity).toList(),
                );
              }
            },
            itemAsString: (u) => u!.userAsString(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.messageEmpty;
              }
              return null;
            },
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
          );
        },
      ),
    );
  }
}

class UserDropdown extends StatelessWidget {
  final Function(String) onUserChanged;

  const UserDropdown({required this.onUserChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<UserProvider, EventProvider>(
        builder: (context, userProvider, eventProvider, child) {
          return Row(
            children: [
              if (eventProvider.selectedFkUser != null &&
                  eventProvider.appointmentsState.isSuccess) ...[
                IconButton(
                  onPressed: () {
                    userProvider.changevalueuser(null);
                    eventProvider.onChangeFkUser('');
                  },
                  icon: Icon(Icons.highlight_off),
                ),
                SizedBox(width: 10),
              ],
              Expanded(
                child: CustomSearchableDropDown<UserModel>(
                  hint: 'الموظف',
                  items: userProvider.usersSupportManagement,
                  itemAsString: (u) => u!.userAsString(),
                  onChanged: (data) {
                    final iduser = data!.idUser!;
                    userProvider.changevalueuser(data);
                    eventProvider.onChangeFkUser(iduser);
                    onUserChanged(iduser);
                  },
                  selectedItem: userProvider.selectedUser,
                  filterFn: (user, filter) => user.getfilteruser(filter),
                  compareFn: (item, selectedItem) =>
                      item.idUser == selectedItem.idUser,
                  validator: (value) {
                    if (value == null) {
                      return 'يرجى اختيار الموظف';
                    }
                    return null;
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<EventProvider, PageState<List<AppointmentModel>>>(
      selector: (_, eventProvider) => eventProvider.appointmentsState,
      builder: (context, appointmentsState, child) {
        if (appointmentsState.isLoading) {
          return Expanded(child: CustomLoadingIndicator());
        }
        if (appointmentsState.isFailure) {
          return Center(
            child: IconButton(
              onPressed: () => context.read<EventProvider>().getAppointments(),
              icon: Icon(Icons.refresh),
            ),
          );
        }
        return Expanded(child: USerInstallationCalendar());
      },
    );
  }
}
