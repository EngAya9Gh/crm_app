enum DevicesStateEnum {
  prepare,
  ready,
  receive;

  static bool isSalesTeam(String? state) {
    return state == DevicesStateEnum.prepare.name || state == null;
  }

  DevicesStateEnum fromString(String? state) {
    if (state == DevicesStateEnum.prepare.name) {
      return DevicesStateEnum.prepare;
    } else if (state == DevicesStateEnum.ready.name) {
      return DevicesStateEnum.ready;
    } else if (state == DevicesStateEnum.receive.name) {
      return DevicesStateEnum.receive;
    } else {
      return DevicesStateEnum.prepare;
    }
  }
}
