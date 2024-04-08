import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/cache_services/cache_services.dart';
import '../../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../auth/login/presentation/pages/login_page.dart';

class NotAllowedPage extends StatefulWidget {
  const NotAllowedPage({Key? key}) : super(key: key);

  @override
  State<NotAllowedPage> createState() => _NotAllowedPageState();
}

class _NotAllowedPageState extends State<NotAllowedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('غير مصرح لك الدخول'),
            SizedBox(height: 20),
            StatefulBuilder(
              builder: (context, setState) {
                bool isLoading = false;
                return AppElevatedButton(
                  isLoading: isLoading,
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    final secureStorage = getIt<CacheServices>(
                      instanceName: SecureStorageConsumer.name,
                    );
                    await secureStorage.removeData(
                      key: AppStrings.secureStorage.token,
                    );
                    AppNavigator.pushAndRemoveUntil(LoginPage());
                  },
                  child: Text('تسجيل الخروج'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
