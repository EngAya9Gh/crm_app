abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "http://smartcrm.ws/aya/api/";
  static const care = _Care();
  static const users = _Users();
}

class _Users {
  const _Users();

  final allUsers = 'users/getUser.php';
  final addUser = 'users/addUser.php';
  final updateUser = 'users/updateuser_patch.php';
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
}
