abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "http://smartcrm.ws/test/api/";
  static const care = _Care();
  static const users = _Users();
  static const series = _Series();
}

class _Users {
  const _Users();

  final allUsers = 'users/getUser.php';
  final addUser = 'users/addUser.php';
  final updateUser = 'users/updateuser_patch.php';
}

class _Series{
  const _Series();

  final getUsersSeries = 'series/view_series_manag.php';
  final updateUsersSeries = 'series/update_series_manage.php';
  final getWithdrawalsInvoices = 'series/getInvoice_Approve_back.php';
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
}
