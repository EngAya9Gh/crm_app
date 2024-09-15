import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/agents/agent_source_enum.dart';

class AgentFormEntity {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nameAgentEnterpriseController =
      TextEditingController();
  ValueNotifier<AgentSourceEnum?> selectedAgentSourceNotifier =
      ValueNotifier(null);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController logoController = TextEditingController();
}
