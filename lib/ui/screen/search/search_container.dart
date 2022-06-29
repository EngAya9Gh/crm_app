import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/search/search_mv.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class search_widget extends StatelessWidget {
  search_widget(
      this.serch,
      this.hint,
      this.type,{Key? key}) : super(key: key);
  String hint='';
  String serch;
  String? type;
  //List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
               Radius.circular(5),
          )),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: TextField(
              textInputAction: TextInputAction.search,
              onChanged: (pattern) async {
                // await Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => productSearchView(
                //         pattern, list)));

                switch(serch){
                    case 'client':
                    Provider.of<client_vm>(context,listen: false)
                        .searchProducts(pattern);
                    break;
                    case 'clientmarketing':
                    Provider.of<client_vm>(context,listen: false)
                        .searchmarket(pattern);
                    break;

                    case 'accept':
                    Provider.of<client_vm>(context,listen: false)
                        .searchclientAccept(pattern);
                    break;

                    case 'ticket':
                    Provider.of<ticket_vm>(context,listen: false)
                        .searchProducts(pattern);
                    break;

                    case 'user':
                    Provider.of<user_vm_provider>(context,listen: false)
                        .searchProducts(pattern);
                    break;
                    case 'marketinvoice':
                    Provider.of<invoice_vm>(context,listen: false)
                        .searchmarketing(pattern);
                    break;
                    case 'welcome':
                    Provider.of<communication_vm>(context,listen: false)
                        .searchwelcome(pattern,type);
                    break;
                  // case 'invoice':
                  //   Provider.of<invoice_vm>(context,listen: false)
                  //       .searchProducts(pattern);
                  //   break;
                    case 'wait':
                    Provider.of<invoice_vm>(context,listen: false)
                        .searchwait(pattern);
                    break;
                    case 'waitout':
                    Provider.of<invoice_vm>(context,listen: false)
                        .searchwaitout(pattern);
                    break;
                    case 'withprev':
                    Provider.of<invoice_vm>(context,listen: false)
                        .searchwaitwithprev(pattern);
                    break;
                    case 'waitsupport':
                    Provider.of<invoice_vm>(context,listen: false)
                        .searchwaitsupport(pattern);
                    break;
                }
                //.search(productName: pattern);
//changeScreen(context, ProductSearchScreen());
              },
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
