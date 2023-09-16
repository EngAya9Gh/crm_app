import 'package:flutter/foundation.dart';

void tryCall({
  required AsyncCallback call,
  ValueChanged<dynamic>? onCatch,
  VoidCallback? onFinally,
}) async {
  if (onFinally != null) {
    try {
      await call();
    } catch (e) {
      onCatch?.call(e);
    } finally {
      onFinally.call();
    }
  } else {
    try {
      await call();
    } catch (e) {
      onCatch?.call(e);
    }
  }
}
