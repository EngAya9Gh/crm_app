enum SellerTypeEnum { distributor, agent, collaborator, employee, all }

extension SellerTypeEnumExtension on SellerTypeEnum {
  String get value {
    switch (this) {
      case SellerTypeEnum.distributor:
        return 'موزع';
      case SellerTypeEnum.agent:
        return 'وكيل';
      case SellerTypeEnum.collaborator:
        return 'متعاون';
      case SellerTypeEnum.employee:
        return 'موظف';
      case SellerTypeEnum.all:
        return 'الكل';
    }
  }

  String? get toParam {
    switch (this) {
      case SellerTypeEnum.distributor:
        return '0';
      case SellerTypeEnum.agent:
        return '1';
      case SellerTypeEnum.collaborator:
        return '2';
      case SellerTypeEnum.employee:
        return '3';
      case SellerTypeEnum.all:
        return null;
    }
  }

  // return enum by value
  static SellerTypeEnum fromParam(String? value) {
    switch (value) {
      case '0':
        return SellerTypeEnum.distributor;
      case '1':
        return SellerTypeEnum.agent;
      case '2':
        return SellerTypeEnum.collaborator;
      case '3':
        return SellerTypeEnum.employee;
      case '4':
        return SellerTypeEnum.all;
      default:
        return SellerTypeEnum.employee;
    }
  }

  bool isParticipate() {
    return this == SellerTypeEnum.collaborator;
  }

  bool isAgent() {
    return this == SellerTypeEnum.agent;
  }

  bool isDistributor() {
    return this == SellerTypeEnum.distributor;
  }

  bool isAgentOrDistributor() {
    return this == SellerTypeEnum.agent || this == SellerTypeEnum.distributor;
  }

  bool isEmployee() {
    return this == SellerTypeEnum.employee;
  }

  bool isCollaborator() {
    return this == SellerTypeEnum.collaborator;
  }

  bool isAll() {
    return this == SellerTypeEnum.all;
  }
}
