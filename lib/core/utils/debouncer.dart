import 'dart:async';
import 'dart:ui';

class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce({this.delay = const Duration(milliseconds: 500)});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}
