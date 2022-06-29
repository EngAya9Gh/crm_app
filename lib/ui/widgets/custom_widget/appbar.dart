import 'package:crm_smart/ui/screen/notification/notifypage.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customTextStyle.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
class customAppbar extends StatelessWidget implements PreferredSizeWidget{
   customAppbar({this.leading, Key? key}) : super(key: key);
   Widget? leading;
  @override
  Widget build(BuildContext context) {
    var notify=Provider.of<notifyvm>(context,listen: true);
    //notify.getcounter();

    print('build appbar');
    return  AppBar(
      key: key,
      leading:leading,

      //textTheme: TextTheme(),
      title: Padding(
        padding: EdgeInsets.all(60),
          //height: toolbarHeight,
          child: Image.asset(kLogo),
    ),
      //Text('Smart Life',style:
     // TextStyle(color: Colors.white,fontSize: 16,fontFamily: kfontfamily),),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [

                 IconButton(
                icon: Icon(
                  Icons.notifications
                  ,size: 20
                  ,color: Colors.white,
                ), onPressed: () {

                   notify.setRead_notify_vm();
                   //notify.clearcounter();
                   Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>
                            notify_pageview()
                      // ,fullscreenDialog:true
                    ));
                //set read to 1
              },
              ),

              notify.countnotify!=0?
              Positioned(
                top: 5,
                right:7,
                child:
              Container(
                decoration: BoxDecoration(
                  color:Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Center(
                  child: Text(notify.countnotify.toString(),
                    style: TextStyle(color: Colors.white,
                        fontSize:7 ),),
                ),
                height: 15,
                width: 15,
              ),
              )
                  :Text(''),
          ],
          ),
        ),
      ],
      iconTheme: IconThemeData(size: 10),
      foregroundColor: kWhiteColor,
      // leading: Image(image:
      //  AssetImage('images/Image-3.jpg'),fit: BoxFit.fill,height: 10,width: 10,
      // ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(50);
}
