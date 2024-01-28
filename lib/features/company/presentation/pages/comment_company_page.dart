


import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/helpers/helper_functions.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/commentmodel.dart';
import '../../../../ui/screen/care/card_comment.dart';
import '../../../../ui/widgets/custom_widget/custom_button_new.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../domain/use_cases/addcomment_usecase.dart';
import '../../domain/use_cases/getcomment_usecase.dart';
import '../manager/company_cubit.dart';

class comment_company extends StatefulWidget {
  const comment_company({Key? key,required this.idCompany,required this.nameCompany}) : super(key: key);
  final String idCompany;
  final String nameCompany;
  @override
  State<comment_company> createState() => _comment_companyState();
}

class _comment_companyState extends State<comment_company> {
  late CompanyCubit _companyCubit;
  late GetCommentParams getcommentParams;
  late CommentModel commentmodel;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _commentController;


  @override
  void initState() {
    // TODO: implement initState
    getcommentParams=GetCommentParams(widget.idCompany);
    // getcommentParams.fk_comment=widget.idCompany;
    _formKey = GlobalKey<FormState>();
    _commentController = TextEditingController();
    _companyCubit=GetIt.I<CompanyCubit>()
      ..getComment(getcommentParams: getcommentParams);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _companyCubit,
      child: AppScaffold(

        appBar: SmartCrmAppBar(

            appBarParams: AppBarParams(title: widget.nameCompany.toString(), action: [

            ])),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: BlocBuilder<CompanyCubit, CompanyState>(
                builder: (context, addState) {
                  if (addState.actionCommentState.isLoading())
                    return Center(child: CircularProgressIndicator());

                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      // padding: HWEdgeInsets.symmetric(horizontal: 10),
                      children: [
                        20.verticalSpace,

                        AppTextField(

                          labelText: "اترك تعليق*",
                          validator: HelperFunctions.instance.requiredFiled,
                          controller: _commentController,
                          minLines: 5,
                          contentPadding: HWEdgeInsets.all(5),
                        ),
                        20.verticalSpace,

                      custom_button_new(
                        onpress: () {
                          final isValid = _formKey.currentState!.validate();
                          if (!isValid) return;
                          _companyCubit.actionComment(

                            onSuccess: (String? value) {
                              if (value != null) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('errorً')));
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('تم')));
                              // Navigator.pop(context,value);
                            },
                            addcommentParams: AddCommentParams(
                            user_id: context.read<UserProvider>().currentUser.idUser.toString(),
                              content: _commentController.text,
                              fk_company: widget.idCompany.toString(),

                          ),
                          );
                        },
                        text: "حفظ",
                      ),
                      ],
                    ),
                  );
                },
              ),
            ),
            20.verticalSpace,

            Directionality(
              textDirection: TextDirection.rtl,
              child: BlocBuilder<CompanyCubit, CompanyState>(
                builder: (context, state) {
                  return state.allcommentListPages.when(
                    init: () => Center(child: AppLoader()),
                    loading: () => Center(child: AppLoader()),
                    loaded: (data) => Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                        itemBuilder: (context, index) {
                          print(data.length);
                          final comment = data[index];
                          commentmodel=CommentModel(
                              idComment: comment.id_comment_company.toString(),
                              fkUser: comment.fk_user.toString(),
                              fkClient: 'fkClient',
                              content: comment.content.toString(),
                              nameUser: comment.fk_user.toString(),
                              imgImage: comment.fk_user.toString(),
                              nameEnterprise:'',
                              date_comment: comment.date_comment.toString());
                          return   cardcomment(
                            commentmodel: commentmodel,
                          );
                        },

                        itemCount: data.length,
                        separatorBuilder: (context, index) =>  7.verticalSpace,
                      ),
                    ),
                    empty: () => Center(child: AppText("link isEmpty!!")),
                    error: (exception) => Center(
                      child: IconButton(
                        onPressed: () => _companyCubit
                            .getComment(getcommentParams: getcommentParams),
                        icon: Icon(Icons.refresh),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
