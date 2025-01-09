import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/enums/type_process_date.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../model/usermodel.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../data/models/date_invoice_model.dart';
import '../use_cases/reschedule_date_usecase.dart';

class AddEventFormVariablesEntity {
  AddEventFormVariablesEntity();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController selectedDateController = TextEditingController();

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();

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
    if(timeList[2]=="PM"&&timeList[0]!='12'){
      var s =  int.parse(timeList[0]) +12;
      timeList[0] = s.toString();
    }
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
      fkUser: selectedEmployee.value!.id,
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
  RescheduleDateParams getRescheduleDateParams({required String idClientsDate,String? sms,}) {
    return RescheduleDateParams(
      scheduleId:idClientsDate,
      dateClientVisit: prepareDateFromTime(startTimeController.text),
      dateEnd: prepareDateFromTime(endTimeController.text),
      fkUser: selectedEmployee.value!.id,
      typeDate: selectInstallationType.value.value,
      processReason: descresaonController.text,
      typeProcess: TypeProcessDate.reschedule.value,
      sms: sms,
    );
  }

  void clear() {
    selectedDateController.clear();
    startTimeController.clear();
    descresaonController.clear();
    endTimeController.clear();
    selectInstallationType = ValueNotifier(InstallationTypeEnum.field);
    selectedClient = ValueNotifier(null);
    selectedInvoice = ValueNotifier(null);
    selectedEmployee = ValueNotifier(null);
  }
}
