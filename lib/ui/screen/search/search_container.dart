import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/common/extensions/build_context.dart';
import '../../../core/services/di/di_container.dart';
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../view_model/client_vm.dart';
import '../../../view_model/communication_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/product_vm.dart';
import '../../../view_model/user_vm_provider.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Flexible(
            child: TextField(
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: 12.sp,
              ),
              textInputAction: TextInputAction.search,
              onChanged: (pattern) async {
                // await Navigator.of(context).push(CupertinoPageRoute(
                //     builder: (context) => productSearchView(
                //         pattern, list)));

                onChange?.call(pattern);
                switch (serch) {
                  case 'product':
                    Provider.of<product_vm>(context, listen: false)
                        .searchProducts(pattern);
                    break;

                  case 'clientmarketing':
                    Provider.of<ClientProvider>(context, listen: false)
                        .searchmarket(pattern, getIt<PrivilegeCubit>());
                    break;

                  case 'user':
                    Provider.of<UserProvider>(context, listen: false)
                        .searchProducts(pattern);
                    break;
                  case 'marketinvoice':
                    Provider.of<InvoiceVm>(context, listen: false)
                        .searchmarketing(pattern, getIt<PrivilegeCubit>());
                    break;

                  case 'waitcare':
                    Provider.of<CommunicationVm>(context, listen: false)
                        .searchwaitcare(pattern);
                    break;
                  case 'waitout':
                    Provider.of<InvoiceVm>(context, listen: false)
                        .searchwaitout(context, pattern);
                    break;
                  case 'debt':
                    Provider.of<InvoiceVm>(context, listen: false)
                        .searchwaitsupport(pattern);
                    break;
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
