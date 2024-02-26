import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../model/commentmodel.dart';
import '../../../../ui/screen/care/card_comment.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_loader_widget/app_loader.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../domain/use_cases/addcomment_usecase.dart';
import '../../domain/use_cases/getcomment_usecase.dart';
import '../manager/company_cubit.dart';

class comment_company extends StatefulWidget {
  const comment_company(
      {Key? key, required this.idCompany, required this.nameCompany})
      : super(key: key);
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
    getcommentParams = GetCommentParams(widget.idCompany);
    // getcommentParams.fk_comment=widget.idCompany;
    _formKey = GlobalKey<FormState>();
    _commentController = TextEditingController();
    _companyCubit = getIt<CompanyCubit>()
      ..getComment(getcommentParams: getcommentParams);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _companyCubit,
      child: AppScaffold(
        appBar: SmartCrmAppBar(
            appBarParams:
                AppBarParams(title: widget.nameCompany.toString(), action: [])),
        body: Column(
          children: [
            20.verticalSpace,
            Form(
              key: _formKey,
              child: BlocBuilder<CompanyCubit, CompanyState>(
                builder: (context, addState) {
                  if (addState.actionCommentState.isLoading())
                    return Center(child: CircularProgressIndicator());

                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // padding: HWEdgeInsets.symmetric(horizontal: 10),
                        children: [
                          Flexible(
                            child: AppTextField(
                              labelText: "اترك تعليق*",
                              validator: HelperFunctions.instance.requiredFiled,
                              controller: _commentController,
                              minLines: 5,
                              contentPadding: HWEdgeInsets.all(5),
                            ),
                          ),
                          20.horizontalSpace,
                          IconButton(
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              if (!isValid) return;
                              _companyCubit.actionComment(
                                onSuccess: (String? value) {
                                  if (value != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('errorً')));
                                    return;
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('تم')));
                                  // Navigator.pop(context,value);
                                  _commentController.text = '';
                                },
                                addcommentParams: AddCommentParams(
                                  user_id: context
                                      .read<UserProvider>()
                                      .currentUser
                                      .idUser
                                      .toString(),
                                  content: _commentController.text,
                                  fk_company: widget.idCompany.toString(),
                                ),
                              );
                            },
                            icon: Icon(Icons.send, color: kMainColor),
                          ),
                        ],
                      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (context, index) {
                          print(data.length);
                          final comment = data[index];
                          commentmodel = CommentModel(
                              idComment: comment.id_comment_company.toString(),
                              fkUser: comment.fk_user.toString(),
                              fkClient: 'fkClient',
                              content: comment.content.toString(),
                              nameUser: comment.nameUser.toString(),
                              imgImage: comment.imgImage != ''
                                  ? urlimage + comment.imgImage.toString()
                                  : '',
                              nameEnterprise: '',
                              date_comment: comment.date_comment.toString());
                          return cardcomment(
                            commentmodel: commentmodel,
                          );
                        },
                        itemCount: data.length,
                        separatorBuilder: (context, index) => 7.verticalSpace,
                      ),
                    ),
                    empty: () => Center(child: AppText("comment isEmpty!!")),
                    error: (exception) => Center(
                      child: IconButton(
                        onPressed: () => _companyCubit.getComment(
                            getcommentParams: getcommentParams),
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
