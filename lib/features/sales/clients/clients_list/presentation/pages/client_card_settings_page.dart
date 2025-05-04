import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../../../core/common/models/client_card_preferences.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/section_header.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../providers/client_card_preferences_provider.dart';

class ClientCardSettingsPage extends StatelessWidget {
  const ClientCardSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: AppText('إعدادات بطاقة العميل'),
      ),
      body: Consumer<ClientCardPreferencesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final preferences = provider.preferences;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: 'العناصر المعروضة'),
                16.height,
                _buildDisplayOption(
                  context,
                  title: 'اسم المستخدم',
                  value: preferences.showNameUser,
                  color: preferences.nameUserColor,
                  onChanged: (value) =>
                      provider.updatePreferences(showNameUser: value),
                  onColorChanged: (color) =>
                      provider.updatePreferences(nameUserColor: color),
                ),
                8.height,
                _buildDisplayOption(
                  context,
                  title: 'نوع العميل',
                  value: preferences.showTypeClient,
                  color: preferences.typeClientColor,
                  onChanged: (value) =>
                      provider.updatePreferences(showTypeClient: value),
                  onColorChanged: (color) =>
                      provider.updatePreferences(typeClientColor: color),
                ),
                8.height,
                _buildDisplayOption(
                  context,
                  title: 'نوع السجل',
                  value: preferences.showTypeRecord,
                  color: preferences.typeRecordColor,
                  onChanged: (value) =>
                      provider.updatePreferences(showTypeRecord: value),
                  onColorChanged: (color) =>
                      provider.updatePreferences(typeRecordColor: color),
                ),
                8.height,
                _buildDisplayOption(
                  context,
                  title: 'رقم الجوال',
                  value: preferences.showMobile,
                  color: preferences.mobileColor,
                  onChanged: (value) =>
                      provider.updatePreferences(showMobile: value),
                  onColorChanged: (color) =>
                      provider.updatePreferences(mobileColor: color),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDisplayOption(
    BuildContext context, {
    required String title,
    required bool value,
    required Color color,
    required ValueChanged<bool> onChanged,
    required ValueChanged<Color> onColorChanged,
  }) {
    return Column(
      children: [
        SwitchListTile(
          title: AppText(title),
          value: value,
          onChanged: onChanged,
        ),
        if (value)
          ListTile(
            title: AppText('اختر اللون'),
            trailing: Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            onTap: () => _showColorPicker(context, color, onColorChanged),
          ),
        Divider(),
      ],
    );
  }

  void _showColorPicker(
    BuildContext context,
    Color initialColor,
    ValueChanged<Color> onColorChanged,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: AppText('اختر اللون'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: initialColor,
            onColorChanged: onColorChanged,
            pickerAreaHeightPercent: 0.8,
            enableAlpha: false,
            labelTypes: const [],
            displayThumbColor: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: AppText('تم'),
          ),
        ],
      ),
    );
  }
}
