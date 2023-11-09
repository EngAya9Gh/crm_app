import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class change_country extends StatefulWidget {
  const change_country({Key? key}) : super(key: key);

  @override
  _change_countryState createState() => _change_countryState();
}

class _change_countryState extends State<change_country> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_)async {
      String fkcoun=Provider.of<UserProvider>(context,listen: false).currentUser.fkCountry.toString();
      await Provider.of<country_vm>(context,listen: false).getcountry();
      Provider.of<country_vm>(context,listen: false).changeValuser(fkcoun);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:ModalProgressHUD(
          inAsyncCall: Provider.of<UserProvider>(context)
              .isUpdate,
          child : Padding(
            padding: EdgeInsets.only(
                top: 150,
                right: 20,
                left: 20,bottom: 150),
            child: ContainerShadows(
              width: double.infinity,
              //height: 400,
              margin: EdgeInsets.only(),
              padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 30) ,
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  RowEdit(name: 'البلد', des: '*'),
                  SizedBox(height: 15,),
                  Consumer<country_vm>(
                    builder: (context, cart, child){
                      return DropdownButton(
                        isExpanded: true,
                        //hint: Text("حدد حالة العميل"),
                        items: cart.listcountry.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.nameCountry), //label of item
                            value: level_one.idCountry, //value of item
                          );
                        }).toList(),
                        value:cart.selectedValueuser,
                        onChanged:(value) {
                          //  setState(() {
                          cart.changeValuser(value.toString());
                          // });
                        },
                      );},
                  ),
                  CustomButton(
                    width:double.infinity,
                    //MediaQuery.of(context).size.width * 0.2,
                    text: 'حفظ',
                    onTap: () async {
                        String iduser=Provider.of<UserProvider>(context,listen: false)
                        .currentUser.idUser.toString();
                        String fkcountry=Provider.of<country_vm>(context,listen: false)
                        .selectedValueuser.toString();

                          Provider.of<UserProvider>(context,listen: false)
                              .updateUserVm({
                           'fk_country':fkcountry
                          },iduser,null);}
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
