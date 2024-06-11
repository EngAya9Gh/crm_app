enum AgentStateEnum {
  negotiation,
  contract,
  excluded;

  static AgentStateEnum? fromString(String? value) {
    switch (value) {
      case 'تفاوض':
        return AgentStateEnum.negotiation;
      case 'تعاقد':
        return AgentStateEnum.contract;
      case 'مستبعد':
        return AgentStateEnum.excluded;
      default:
        return null;
    }
  }
}

extension AgentStatusEnumExtension on AgentStateEnum {
  String get value {
    switch (this) {
      case AgentStateEnum.negotiation:
        return 'تفاوض';
      case AgentStateEnum.contract:
        return 'تعاقد';
      case AgentStateEnum.excluded:
        return 'مستبعد';
    }
  }
}
