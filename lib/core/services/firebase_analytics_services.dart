import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/main.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:intl/intl.dart';

class AnalyticsService {
  static final FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  /// Logs an event when a user signs in with email/password.
  Future<void> logLogIn({required String email}) async {
    await firebaseAnalytics.logLogin(
      loginMethod: 'email', // Specifies the login method
      parameters: {
        'email': email, // Optional custom parameter
      },
    );
  }

  Future<void> logCustomEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    final Map<String, dynamic>? data = parameters;
    await AnalyticsService.firebaseAnalytics.logEvent(
      name: 'screen_view_duration',
      parameters: {
        'screen_name': ((parameters?['duration'] != null) ? "$name duration ${parameters?['duration']}" : '$name') +
            " by ${AppConstants.currentUser.idUser.toString()}",
      },   );
  }
}
