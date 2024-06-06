enum AgentStatusEnum { negotiation, contract, excluded }

extension AgentStatusEnumExtension on AgentStatusEnum {
  String get value {
    switch (this) {
      case AgentStatusEnum.negotiation:
        return 'تفاوض';
      case AgentStatusEnum.contract:
        return 'تعاقد';
      case AgentStatusEnum.excluded:
        return 'مستبعد';
    }
  }
}
