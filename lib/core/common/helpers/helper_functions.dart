import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_constants.dart';
import '../enums/toast_colors_enum.dart';
import 'app_snackbar.dart';

class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();

  bool hasReachedMax<T>(List<T>? list) =>
      (list ?? []).length < AppConstants.kPerPage;

  List<T> intersection<T>(Iterable<Iterable<T>> iterables) {
    return iterables
        .map((e) => e.toSet())
        .reduce((a, b) => a.intersection(b))
        .toList();
  }

  static String? JsonStringNullHandler(dynamic value) {
    return value == null ? null : value.toString();
  }

  static Future<void> urlLauncher(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  static String formatDate(dynamic date) {
    if (date == null) return '';
    if (date is String) {
      date = dateFromString(date);
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatTime(BuildContext context, TimeOfDay time) {
    return TimeOfDay(
      hour: time.hour,
      minute: time.minute,
    ).format(context);
  }

  static DateTime? dateFromString(String? date) {
    if (date == null) return null;
    return DateTime.tryParse(date);
  }

  static TimeOfDay? timeFromString(String? time) {
    if (time == null) return null;

    DateTime? dateTime = DateTime.tryParse(time);
    if (dateTime == null) {
      dateTime = DateFormat.jm().tryParse(time);
    }
    if (dateTime == null) return null;
    final timeOfDay = TimeOfDay.fromDateTime(dateTime);
    return timeOfDay;
  }

  static String dateTimeToString(DateTime dateTime) {
    final date = DateFormat.yMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);
    return '$date $time';
  }

  static int? assignNullInt({int? currentValue, int? newValue}) {
    if (newValue == -1) {
      return null;
    }
    if (newValue == null) {
      return currentValue;
    }
    return newValue;
  }

  static String? assignNullString({String? currentValue, String? newValue}) {
    if (newValue == '') return null;
    if (newValue == null) return currentValue;

    return newValue;
  }

  static String getCurrencyName(dynamic value) {
    value = int.tryParse(value.toString()) ?? 1;

    switch (value) {
      case 0:
        return ' USD ';
      case 1:
        return ' ريال ';
      default:
        return ' ريال ';
    }
  }

  static Future<void> copyToClipboard(String text) async {
    return Clipboard.setData(new ClipboardData(text: text)).then((_) {
      AppSnackbar.showSnakeBar(
        'Copied to your clipboard !',
        color: ToastColorsEnum.success,
      );
    });
  }

  static String getNameShort(String name) {
    return name.length > 15
        ? '..' + name.substring(0, 15).toString()
        : name.toString();
  }
}
