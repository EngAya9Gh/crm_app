import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants.dart';
import '../../../widgets/custom_widget/row_edit.dart';

class BranchManagementDetailsPage extends StatefulWidget {
  const BranchManagementDetailsPage({Key? key}) : super(key: key);

  @override
  State<BranchManagementDetailsPage> createState() => _BranchManagementDetailsPageState();
}

class _BranchManagementDetailsPageState extends State<BranchManagementDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'فرع المدينة',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          infoWidget("الفرع", "فرع المدينة"),
          infoWidget("الشهر", "يونيو-2023"),
          infoWidget("الهدف الشهري", "130,000.00"),
          infoWidget("المجموع الشهري للفرع", "8415"),
          infoWidget("نسبة التحقيق الشهري", "6.47%"),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: RowEdit(name: 'تعديل الهدف الشهري', des: 'Required'),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              controller: TextEditingController(),
              obscureText: false,
              cursorColor: Colors.black,
              readOnly: false,
              validator: (text) {
                if (text?.trim().isEmpty ?? true) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                hintText: '',
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoWidget(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16)),
              Text(value, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        divider,
      ],
    );
  }

  Widget get divider {
    return Divider(
      indent: 15,
      endIndent: 15,
      height: 20,
    );
  }
}
