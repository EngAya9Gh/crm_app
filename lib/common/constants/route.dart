abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "http://smartcrm.ws/test/api/";
  static const care = _Care();
}

class _Care {
  const _Care();

  final communicationRepeat = 'care/getcommuncation_repeat_star.php';
}
