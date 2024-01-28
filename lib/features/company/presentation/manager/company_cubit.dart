import 'package:bloc/bloc.dart';
import 'package:crm_smart/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/usermodel.dart';
import '../../../task_management/data/models/user_region_department.dart';
import '../../../task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart';
import '../../data/models/company_com_model.dart';
import '../../domain/use_cases/addcomment_usecase.dart';
import '../../domain/use_cases/getcomment_usecase.dart';

part 'company_state.dart';

@injectable
class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(
      this._getCommentUsecase,
      this._addCommentUsecase,
      ) : super(CompanyState());

  final GetCommentUsecase _getCommentUsecase;
  final AddCommentUsecase _addCommentUsecase;

  void getComment({
    required GetCommentParams getcommentParams,
  }) async {
    emit(state.copyWith(allLinkList: const PageState.loading()));
    final allLinks = await _getCommentUsecase(getcommentParams);

    allLinks.fold(
          (exception, message) => emit(state.copyWith(
          allLinkList: const PageState.error())),
          (value) => emit(
        state.copyWith(
          allLinkList: PageState.loaded(data: value.data!  ),
          allLinks: value.data,
        ),
      ),
    );
  }


  actionComment({
    // CompanyCommentModel? updateLink,
    required AddCommentParams addcommentParams,
    required ValueChanged<String?> onSuccess,
  }) async {
    emit(state.copyWith(actionLinkState: BlocStatus.loading()));

    final response = await _addCommentUsecase(addcommentParams);

    response.fold(
          (exception, message) => emit(
          state.copyWith(
              actionLinkState: BlocStatus.fail(error: message))),
          (value) {
        final link = value.data!;

        if (link.id == '0') {
          onSuccess.call("repeat");
          return;
        }
        List<CompanyCommentModel> users = state.allComments;


        final usersState = PageState.loaded(data: users);
        emit(
          state.copyWith(
            actionLinkState: BlocStatus.success(),
            allLinkList: usersState,
            allLinks: users,
            // currentLink: updateLink != null ? link : null,
          ),
        );

        onSuccess.call(null);
      },
    );
  }



}
