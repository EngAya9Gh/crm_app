
import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/home/ticket/ticketclientview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../constants.dart';
import 'clients.dart';

class transferClient extends StatefulWidget {
   transferClient({ this.idticket,required this.type, required this.name_enterprise, required this.idclient, Key? key}) : super(key: key);
   String idclient,name_enterprise;
   String type;
   String? idticket;
  @override
  _transferClientState createState() => _transferClientState();
}

class _transferClientState extends State<transferClient> {
  late String? iduser=null;
  TextEditingController _textresoan =TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  @override
  Future<void> didChangeDependencies() async {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      await Provider.of<user_vm_provider>(context,listen: false)
          .getuser_vm();
      print(Provider.of<user_vm_provider>(context,listen: false)
          .userall.length);
    }
    );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
        appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: kWhiteColor),
    onPressed: () => Navigator.of(context).pop(),
    )),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<client_vm>(context, listen: true)
            .isloading,
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<ticket_vm>(context,listen: true)
          .isloading,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Text("من فضلك اختر اسم الموظف الذي ترغب بتحويل العميل إليه"),
                    SizedBox(height: 10,),
                    Consumer<user_vm_provider>(
                      builder: (context, cart, child){
                      return  DropdownSearch<UserModel>(
                        mode: Mode.DIALOG,
                          label: "Name",
                          validator: (val){
                          if(val==null)
                            return 'من فضلك حدد اسم موظف';
                          },
                          //onFind: (String filter) => cart.getfilteruser(filter),
                       filterFn: (user, filter) => user!.getfilteruser(filter!),
                        //compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                         // itemAsString: (UserModel u) => u.userAsStringByName(),
                        items: cart.userall,
                        itemAsString:
                            ( u) => u!.userAsString(),
                       // selectedItem: cart.currentUser,
                          onChanged: (data) => iduser=data!.idUser!,//print(data!.nameUser),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "choose a user",
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 5),
                          border: OutlineInputBorder(),
                        ),
                        );
                      },
                    ),
                    SizedBox(height: 5,),
                    widget.type=="ticket"?
                    EditTextFormField(
                      maxline: 4,
                      paddcustom: EdgeInsets.all(10),
                      hintText:
                      'أسباب تحويل التذكرة ',
                      obscureText: false,
                      controller: _textresoan,
                      vaild: (value) {
                        if (value.toString().trim().isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                    ) :Container(),
                    SizedBox(height: 5,),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              kMainColor)),
                      onPressed: () async{
    if (_globalKey.currentState!.validate()) {
    _globalKey.currentState!.save();
                       // if(iduser!=null) {
                          if (widget.type == "ticket") {
                            //update fkuser to new user
                            await Provider.of<ticket_vm>(context, listen: false)
                                .setfTicketclient_vm(
                                {
                                  'resoan_transfer': _textresoan.text,
                                  'date_assigntr': DateTime.now().toString(),
                                  'fk_user_recive': iduser,
                                  'fkuser': iduser, //user reciept
                                  'fk_client': widget.idclient,
                                  'nameusertransfer':
                                  Provider
                                      .of<user_vm_provider>(context, listen: false)
                                      .currentUser
                                      .nameUser
                                      .toString(), //الموظف الذي حول العميل
                                  'name_enterprise': widget.name_enterprise,
                                  'fkusertrasfer': Provider
                                      .of<user_vm_provider>(context, listen: false)
                                      .currentUser
                                      .idUser
                                      .toString(),
                                  //'idclient':
                                }, widget.idticket
                            );
                            // Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                                    builder: (context) => ticketclientview()),
                                    (route) => false
                            );
                          }
                          else {
                            String? reason_transfer = 'transfer';
                            //update fkuser to new user
                          await  Provider.of<client_vm>(context, listen: false)
                                .setfkUserclient_vm(
                                {
                                  'date_transfer': DateTime.now().toString(),
                                  'reason_transfer': iduser,
                                  'fkuser': iduser, //user reciept
                                  'nameusertransfer':
                                  Provider
                                      .of<user_vm_provider>(context, listen: false)
                                      .currentUser
                                      .nameUser
                                      .toString(), //الموظف الذي حول العميل
                                  'name_enterprise': widget.name_enterprise,
                                  'fkusertrasfer': Provider
                                      .of<user_vm_provider>(context, listen: false)
                                      .currentUser
                                      .idUser
                                      .toString(),

                                }, widget.idclient
                            );
                            _scaffoldKey.currentState!.showSnackBar(
                                SnackBar(
                                    content:
                                    Text('تم تحويل العميل')));

                            //Navigator.pop(context);
                            // Navigator.pushAndRemoveUntil(context,
                            //     MaterialPageRoute(builder: (context)=>ticketclientview()),
                            //         (route) => false
                            // );
                          }
                        // }else{
                        //   // _scaffoldKey.currentState!.showSnackBar(
                        //   //     SnackBar(content: Text('من فضلك حدد مدينة')));
                        }
                      },
                      child: Text('تأكيد العملية'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
