import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/usermodel.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../data/models/date_invoice_model.dart';

class AddEventFormVariablesEntity {
  AddEventFormVariablesEntity();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController selectedDateController = TextEditingController();

  final TextEditingController startTimeController = TextEditingController();

  final TextEditingController endTimeController = TextEditingController();
  ValueNotifier<InstallationTypeEnum> selectInstallationType =
      ValueNotifier(InstallationTypeEnum.field);

  ValueNotifier<UserEntity?> selectedClient = ValueNotifier(null);
  ValueNotifier<DateInvoiceModel?> selectedInvoice = ValueNotifier(null);
  ValueNotifier<UserModel?> selectedEmployee = ValueNotifier(null);

  DateTime prepareDateFromTime(String time) {
    final DateTime selectedDate = DateTime.parse(selectedDateController.text);
    // split by : or space to be able to access the hours and minutes
    final List<String> timeList = time.split(RegExp(r'[:\s]'));
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      int.parse(timeList[0]),
      int.parse(timeList[1]),
    );
  }

  AddDateInstallParams getAddDateInstallParams({int? force,String? sms}) {
    return AddDateInstallParams(
      fkUser: selectedEmployee.value!.idUser,
      dateClientVisit: prepareDateFromTime(startTimeController.text),
      idInvoice: selectedInvoice.value!.idInvoice,
      typeDate: selectInstallationType.value.value,
      dateEnd: prepareDateFromTime(endTimeController.text),
      fkClient: selectedClient.value!.id,
      force: force,
      sms: sms,
      dateTable: 1,
    );
  }

  void clear() {
    selectedDateController.clear();
    startTimeController.clear();
    endTimeController.clear();
    selectInstallationType = ValueNotifier(InstallationTypeEnum.field);
    selectedClient = ValueNotifier(null);
    selectedInvoice = ValueNotifier(null);
    selectedEmployee = ValueNotifier(null);
  }
}
