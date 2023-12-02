import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';

class search_widget extends StatelessWidget {
  search_widget(
    this.serch,
    this.hint,
    this.type, {
    Key? key,
    this.onChange,
    this.myClientsParams = '1',
  }) : super(key: key);
  String hint = '';
  String serch;
  String? type;
  ValueChanged<String>? onChange;
  String myClientsParams;

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
                // await Navigator.of(context).push(CupertinoPageRoute(
                //     builder: (context) => productSearchView(
                //         pattern, list)));

                onChange?.call(pattern);
                switch (serch) {
                  case 'client':
                    Provider.of<ClientProvider>(context, listen: false)
                        .searchProducts(pattern, GetIt.I<PrivilegeCubit>());
                    break;
                  case 'product':
                    Provider.of<product_vm>(context, listen: false).searchProducts(pattern);
                    break;

                  // case 'delayinstall':
                  // Provider.of<client_vm>(context,listen: false)
                  //     .searchdelay(pattern);
                  // break;

                  case 'clientmarketing':
                    Provider.of<ClientProvider>(context, listen: false).searchmarket(pattern,GetIt.I<PrivilegeCubit>());
                    break;

                  case 'accept':
                    Provider.of<ClientProvider>(context, listen: false).searchclientAccept(pattern);
                    break;

                  case 'ticket':
                    Provider.of<ticket_vm>(context, listen: false).searchProducts(pattern);
                    break;

                  case 'user':
                    Provider.of<UserProvider>(context, listen: false).searchProducts(pattern);
                    break;
                  case 'marketinvoice':
                    Provider.of<invoice_vm>(context, listen: false).searchmarketing(pattern,GetIt.I<PrivilegeCubit>());
                    break;
                  case 'welcome':
                    Provider.of<communication_vm>(context, listen: false).searchwelcome(pattern, type, myClientsParams);
                    break;
                  // case 'invoice':
                  //   Provider.of<invoice_vm>(context,listen: false)
                  //       .searchProducts(pattern);
                  //   break;
                  case 'wait':
                    Provider.of<invoice_vm>(context, listen: false).searchwait(pattern,GetIt.I<PrivilegeCubit>());
                    break;
                  case 'waitcare':
                    Provider.of<communication_vm>(context, listen: false).searchwaitcare(pattern);
                    break;
                  case 'waitout':
                    Provider.of<invoice_vm>(context, listen: false).searchwaitout(pattern);
                    break;
                  case 'withprev':
                    Provider.of<invoice_vm>(context, listen: false).searchwaitwithprev(pattern,GetIt.I<PrivilegeCubit>());
                    break;
                  case 'waitsupport':
                    Provider.of<invoice_vm>(context, listen: false).searchwaitsupport(pattern);
                    break;
                  case 'debt':
                    Provider.of<invoice_vm>(context, listen: false).searchwaitsupport(pattern);
                    break;
                  case 'accept_invoice':
                    Provider.of<invoice_vm>(context, listen: false).search_accept_invoice_admin(pattern);
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
