import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/clients_attachments/data/models/attachment_model.dart';
import 'package:crm_smart/features/clients_care/clients_attachments/domain/use_cases/get_attachments_usecase.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../core/common/models/file_model.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_paginated_grid.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/files/app_platform_image.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/widgets/app_file_viewer.dart';
import '../../../../../view_model/invoice_vm.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/client_attachments_bloc.dart';
import '../widgets/filter_clients_attachments_sheet.dart';

class ClientAttachmentsPage extends StatefulWidget {
  const ClientAttachmentsPage({Key? key}) : super(key: key);

  @override
  State<ClientAttachmentsPage> createState() => _ClientAttachmentsPageState();
}

class _ClientAttachmentsPageState extends State<ClientAttachmentsPage> {
  late final ClientAttachmentsBloc _bloc;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    _bloc = context.read<ClientAttachmentsBloc>();
    _bloc.add(GetAttachmentsEvent());
    _bloc.add(GetAllClientEvent());
    super.initState();
  }

  @override
  void deactivate() {
    _bloc.add(ChangeFilterClientEvent(getAttachmentsParams: GetAttachmentsParams()));

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'المرفقات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomSearchWidget(
                    keyboardType: TextInputType.number,
                    searchController: textController,
                    onChanged: (value) {
                      AppConstants.debounceFunction(
                        () {
                          _bloc
                            ..add(ChangeFilterClientEvent(
                                getAttachmentsParams:
                                    _bloc.state.getAttachmentsParams.copyWith(invoice_id: () => value.isEmpty ? null : int.parse(value))))
                            ..add(GetAttachmentsEvent());
                        },
                        tag: "search_clients_contacts_list",
                        isDebounced: true,
                      );
                    },
                  ),
                ),
                CustomFilterIcon(
                  onTap: () async {
                    await AppBottomSheet.show(
                      context: context,
                      child: FilterClientAttachmentSheet(
                        bloc: _bloc,
                        canReset: !(_bloc.state.getAttachmentsParams.isEmpty()),
                      ),
                    ).then(
                      (value) => (value ?? false) ? null : _bloc.add(ChangeFilterClientEvent(getAttachmentsParams: GetAttachmentsParams())),
                    );
                  },
                ),
                SizedBox(width: 8),
              ],
            ),
            5.verticalSpace,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('عدد المرفقات: '),
                    BlocBuilder<ClientAttachmentsBloc, ClientAttachmentsState>(
                      builder: (context, state) {
                        return ((state.getListAttachments.data??[]).isEmpty)?SizedBox.shrink():AppText('${state.getListAttachments.data?.length??''}/${state.totalCountItem}');
                      },
                    ),
                  ],
                )
            ),
            5.verticalSpace,
            Expanded(
                child: BlocBuilder<ClientAttachmentsBloc, ClientAttachmentsState>(
                    builder: (context, state) => state.getListAttachments.when(
                          loading: () => AppLoader(),
                          success: (data) => AppPaginatedGridView(
                            onLoadMore: () {
                              _bloc
                                ..add(ChangeFilterClientEvent(
                                    getAttachmentsParams: _bloc.state.getAttachmentsParams.copyWith(page: state.getAttachmentsParams.page + 1)))
                                ..add(GetAttachmentsEvent());
                            },
                            items: data ?? [],
                            itemBuilder: (context, index) {
                              Container(
                                width: 200,
                                height: 200,
                                color: Colors.red,
                              );
                              final attachModel = data?[index];
                              // if (attachModel?.fileAttachInvoice != null) {
                              return SizedBox(
                                  height: 250.scaleIconsSize,
                                  child: fileImage(
                                      FileAttach(id: data?[index].id.toString(), fileAttach: data?[index].fileAttachInvoice, file: XFile('path')),
                                      index,
                                      attachModel!));
                              // } else {
                              // return SizedBox(
                              //     height: 250.scaleIconsSize,
                              //     child:
                              //         networkImage(FileAttach(id: data?[index].id.toString(), fileAttach: data?[index].fileAttachInvoice), index));
                              // }
                            },
                          ),
                          empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
                          failure: (error, data) => AppErrorWidget(
                            message: error,
                            onPressed: () => _bloc.add(GetAttachmentsEvent()),
                          ),
                        ))),
          ],
        ),
      ),
    );
  }

  final List<String> allowedExtensions = ["pdf", "PDF"];

  Widget fileImage(FileAttach fileAttach, int index, AttachmentModel attachModel) {
    bool isLoading = false;
    var type = TypeSubClientEnum.values.firstWhereOrNull((element) => element.text == attachModel.type);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.circular(12.r),
        boxShadow: <BoxShadow>[
          BoxShadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.white24 //.withOpacity(0.2),
              ),
        ],
      ),
      margin: EdgeInsetsDirectional.only(bottom: 10, end: 4, start: 4),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: allowedExtensions.any((ext) => fileAttach.file?.name.ext == '.$ext') ||
                            ((fileAttach.file?.name.ext == '.pdf' || fileAttach.file?.name.ext == '.PDF') ||
                                (fileAttach.fileAttach == null
                                    ? false
                                    : (fileAttach.fileAttach!.endsWith('.pdf') || fileAttach.fileAttach!.endsWith('.PDF'))))
                        ? StatefulBuilder(
                            builder: (context, refresh) {
                              return InkWell(
                                onTap: () async {
                                  isLoading = true;
                                  refresh(() {});
                                  await InvoiceVm().openFile(
                                    attachFile: fileAttach,
                                    baseUrl: EndPoints.baseUrls.laravelFilesUrl,
                                    context: context,
                                  );
                                  isLoading = false;
                                  refresh(() {});
                                },
                                child: Container(
                                    width: 110,
                                    decoration: BoxDecoration(color: AppColors.primaryMain.withOpacity(0.1)),
                                    child: isLoading
                                        ? AppLoader(padding: 12)
                                        : AppIcon(
                                            Icons.picture_as_pdf_rounded,
                                            color: Colors.grey,
                                          )),
                              );
                            },
                          )
                        : InkWell(
                            onTap: () => AppFileViewer(
                                  imageSource: ImageSourceViewer.file,
                                  files: [fileAttach.file!],
                                ).show(context),
                            child: AppPlatformImage(
                              fileModel: FileModel(file: fileAttach.file!),
                              fit: BoxFit.cover,
                              width: 110,
                            )),

                    // _getFile(fileAttach),
                  ),
                ),
                if (attachModel.nameEnterprise != null)
                  PositionedDirectional(
                      top: 0,
                      width: 1.sw,
                      child: Align(
                          alignment: Alignment.center,
                          child: AppText(
                            attachModel.nameEnterprise,
                            color: AppColors.primaryMain,
                          )))
              ],
            ),
          ),
          5.verticalSpacingRadius,
          if (attachModel.invoiceAddress != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: TextScroll(
                  '${attachModel.invoiceAddress}',
                  mode: TextScrollMode.endless,
                  velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
                  delayBefore: Duration(milliseconds: 2000),
                  pauseBetween: Duration(milliseconds: 1000),
                  style: AppStyles.textStyle,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: TextScroll(
                "${type?.text}",
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(45, 0)),
                delayBefore: Duration(milliseconds: 2000),
                pauseBetween: Duration(milliseconds: 1000),
                style: AppStyles.textStyle,
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
