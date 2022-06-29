



import 'package:crm_smart/ui/screen/search/search_container.dart';
import 'package:crm_smart/ui/widgets/user_widget/card_user.dart';
import 'package:crm_smart/ui/widgets/user_widget/carduserbuild.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'adduser.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  _AllUserScreenState createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async {
      // Add Your Code here.
      // only
      await Provider.of<privilge_vm>(context, listen: false)
          .getprivlg_usercurrent();
      Provider.of<user_vm_provider>(context, listen: false).getuser_vm();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final controllerUsers =
    Provider.of<user_vm_provider>(context, listen: true);
    return Scaffold(
      floatingActionButton:
      Provider.of<privilge_vm>(context,listen: true)
          .checkprivlge('49')==true ?
      FloatingActionButton(
      backgroundColor: kMainColor,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>addUser()));

      },
      tooltip: 'إضافة موظف',

      child: Icon(Icons.add),
    ):Container(),
      appBar: AppBar(
        title: Text('إدارة المستخدمين',style: TextStyle(color: kWhiteColor),),

        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: search_widget(
                'user',
                "اسم الموظف....",''
            ),
            ),
            const SizedBox(
              height: 5,
            ),

            controllerUsers.listuserfilter.length == 0?
    Center(
    child: CircularProgressIndicator()):
            Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child:
                ListView.separated(
                  itemCount: controllerUsers.listuserfilter.length,
                  itemBuilder: (context, index) {
                    return Consumer<user_vm_provider>(
                        builder: (context, cart, child) {
                          return
                          //   value.listClientfilter.length==0?
                          // Center(
                          //     child: CircularProgressIndicator()
                          // ):
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: buildCardUsers(
                              usermodell: controllerUsers.listuserfilter[index],
                            ),
                          );
                        });
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 30, left: 20, bottom: 0),
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1,
                      ),
                    );
                  },
                ),

              ),
            )

           //CardUsers(),
          ],
        ),
      ),
    );
  }
}