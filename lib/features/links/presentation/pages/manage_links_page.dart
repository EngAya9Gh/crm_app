import 'package:crm_smart/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_scaffold.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_elvated_button.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../manager/link_cubit.dart';
import 'action_link_page.dart';

class ManageLinkPage extends StatefulWidget {
  const ManageLinkPage({Key? key}) : super(key: key);

  @override
  State<ManageLinkPage> createState() => _ManageLinkPageState();
}

class _ManageLinkPageState extends State<ManageLinkPage> {
  late LinkCubit _linkCubit;

  @override
  void initState() {
    _linkCubit = GetIt.I<LinkCubit>()..getLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _linkCubit,
      child: AppScaffold(

        appBar: SmartCrmAppBar(
            appBarParams: AppBarParams(title: "الروابط الهامة", action: [
              AppTextButton(
                text: "إضافة",
                onPressed: () async{
               await   Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: _linkCubit,
                          child: ActionLinkPage(),
                        )),
                  );
                  _linkCubit.getLinks();

                },
                appButtonStyle: AppButtonStyle.secondary,
              ),
            ])),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<LinkCubit, LinksState>(
            builder: (context, state) {
              return state.allLinksList.when(
                init: () => Center(child: AppLoader()),
                loading: () => Center(child: AppLoader()),
                loaded: (data) => ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  itemBuilder: (context, index) {
                    print(data.length);
                    final link = data[index];
                    print(link.title);
                   return InkWell(
                      onTap:() async{
                     final result = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: _linkCubit,
                              child: ActionLinkPage(linkModel:link ),
                            )),
                      );
                     _linkCubit.getLinks();
                      },

                      child:Card(

                        // color: Colors.grey.shade200,
                        child: Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                                      child: AppText(

                                       link.title ?? '',
                                        style: context.textTheme.bodyLarge!
                                            .copyWith(color: context.colorScheme.grey600),
                                      ),
                                    ),
                                  ),
                                ],),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                                    child: AppText(
                                     link.link  ?? '',
                                      style: context.textTheme.bodySmall!
                                          .copyWith(color: context.colorScheme.grey600),
                                    ),
                                  ),
                                ),
                              ],),
                            10.verticalSpace,

                          ],
                        ),
                      ) ,
                    );
                  },

                  itemCount: data.length,
                  separatorBuilder: (context, index) =>  7.verticalSpace,
                ),
                empty: () => Center(child: AppText("link isEmpty!!")),
                error: (exception) => Center(
                  child: IconButton(
                    onPressed: () => _linkCubit.getLinks(),
                    icon: Icon(Icons.refresh),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
