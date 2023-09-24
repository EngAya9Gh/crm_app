abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "http://smartcrm.ws/crm/api/";
  static const care = _Care();
  static const client= _Client();
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
}

class _Client {
  const _Client();

  final allClientsList = 'client/getClientAll.php';
  final clientsByRegionList = 'client/getclientByRegoin.php';
  final clientsByUserList = 'client/getclientbyuser.php';
}
