import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/extensions/num_extensions.dart';
import '../../core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import '../../core/common/widgets/app_loader.dart';
import '../../core/common/widgets/custom_error_widget.dart';
import '../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../model/invoiceModel.dart';
import 'card_attachment.dart';
import 'custom_network_Image.dart';
import 'pick_image_bottom_sheet.dart';

class SupportAttachmentsRow extends StatefulWidget {
  final String idInvoice;

  const SupportAttachmentsRow({
    Key? key,
    required this.idInvoice,
  }) : super(key: key);

  @override
  State<SupportAttachmentsRow> createState() => _SupportAttachmentsRowState();
}

class _SupportAttachmentsRowState extends State<SupportAttachmentsRow> {
  late final AttachmentsRowCubit attachmentsRowCubit;

  @override
  void initState() {
    attachmentsRowCubit = context.read<AttachmentsRowCubit>();
    attachmentsRowCubit.invoiceId = widget.idInvoice;
    attachmentsRowCubit.clear();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      attachmentsRowCubit.getClientSupportFiles(GetClientSupportFilesParams(
        invoiceId: widget.idInvoice,
      ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText('المرفقات', fontWeight: FontWeight.bold),
            BlocBuilder<AttachmentsRowCubit, AttachmentsRowState>(
              buildWhen: (previous, current) {
                return previous is AttachmentsRowLoaded ||
                    current is AttachmentsRowLoaded ||
                    current is SaveChangesSuccess;
              },
              builder: (context, state) {
                if (attachmentsRowCubit.selectedFilesList.isNotEmpty ||
                    attachmentsRowCubit.deletedFilesList.isNotEmpty)
                  return SaveAttachmentsChangesButton();
                return SizedBox.shrink();
              },
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  builder: (context) => PickImageBottomSheet(
                    onPickFile: (context, file) {
                      attachmentsRowCubit.addFile(file);
                    },
                  ),
                );
              },
              child: AppText(
                'إضافة',
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        10.height,
        BlocBuilder<AttachmentsRowCubit, AttachmentsRowState>(
          buildWhen: (previous, current) {
            return previous is AttachmentsRowLoading ||
                current is AttachmentsRowLoading ||
                current is AttachmentsRowLoaded;
          },
          builder: (context, state) {
            if (state is AttachmentsRowLoading) {
              return AppLoader();
            } else if (state is AttachmentsRowError) {
              return AppErrorWidget(onPressed: () {
                attachmentsRowCubit
                    .getClientSupportFiles(GetClientSupportFilesParams(
                  invoiceId: widget.idInvoice,
                ));
              });
            } else if (attachmentsRowCubit.allFilesList.isEmpty) {
              return SizedBox.shrink();
            }
            return SizedBox(
              height: 125,
              child: AppPaginatedList(
                scrollDirection: Axis.horizontal,
                items: attachmentsRowCubit.allFilesList,
                itemBuilder: (context, index) {
                  final file = attachmentsRowCubit.allFilesList[index];
                  if (file.xFile != null) {
                    return CardAttachment(
                      fileModel: file,
                      onDelete: () => attachmentsRowCubit.deleteFile(file),
                    );
                  }
                  return CustomNetworkImage(
                    fileAttach: FileAttach(
                      id: file.id,
                      fileAttach: file.fileUrl,
                    ),
                    onDelete: () => attachmentsRowCubit.deleteFile(file),
                  );
                },
              ),
            );
          },
        ),
        20.height,
      ],
    );
  }
}

class SaveAttachmentsChangesButton extends StatelessWidget {
  const SaveAttachmentsChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttachmentsRowCubit, AttachmentsRowState>(
      buildWhen: (previous, current) {
        return previous is SaveChangesLoading || current is SaveChangesLoading;
      },
      builder: (context, state) {
        return AppElevatedButton(
          text: "حفظ",
          isLoading: state is SaveChangesLoading,
          onPressed: () {
            context.read<AttachmentsRowCubit>().saveFilesChanges();
          },
        );
      },
    );
  }
}
