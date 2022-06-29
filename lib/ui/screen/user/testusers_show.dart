import 'package:crm_smart/model/usertestmodel.dart';
import 'package:crm_smart/ui/screen/user/usertest_add.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class testuser_show extends StatelessWidget {
  testuser_show({required this.userTestModel, Key? key}) : super(key: key);
  UserTestModel userTestModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key:_scaffoldKey ,
      appBar: AppBar(
        title:
        Text(
            userTestModel.nameusertest.toString()),
        centerTitle: true,
      actions: [
    IconButton(
    onPressed: () {

      Navigator.push(context,
          MaterialPageRoute(
              builder: (context)=> addusertest(idregoin: userTestModel.id_usertest,
                nameusertest: userTestModel.nameusertest,des_usertest: userTestModel.des_usertest,)));

    },
      icon: Icon(Icons.edit),),
      ],
      ),
      body:SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(userTestModel.des_usertest.toString()),
                SizedBox(height: 15,),
                CustomButton(
                  width:double.infinity,
                  text: 'نسخ البيانات ورابط الدخول',
                  onTap: () async {
                    Clipboard.setData(
                        ClipboardData(
                        text:userTestModel.des_usertest.toString()));

                    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text('تم النسخ بنجاح')));
                    },
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
