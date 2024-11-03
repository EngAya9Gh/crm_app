import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violation_type_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violations_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../data/models/management_model.dart';

class ViolationsPageVarsEntity {
  List<ViolationModel> allList = [];
  List<ViolationModel> filteredList = [];
  List<ManagementModel> managementList = [];
  List<ViolationType> violationTypeList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;
  TextEditingController descriptionController = TextEditingController();

  bool isNewFilter = true;
  bool hasReachedEnd = false;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

}
