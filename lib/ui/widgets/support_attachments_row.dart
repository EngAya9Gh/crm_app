import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import '../../core/common/widgets/custom_error_widget.dart';
import '../../core/common/widgets/custom_loading_indicator.dart';
import '../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../model/invoiceModel.dart';
import 'custom_file_widget.dart';
import 'custom_network_Image.dart';
import 'custom_widget/text_uitil.dart';
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
          children: [
            TextUtilis(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              textstring: 'المرفقات:',
              underline: TextDecoration.none,
            ),
            Spacer(),
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
            TextButton(
              onPressed: () {
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
              child: Text("إضافة"),
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
              return CustomLoadingIndicator();
            } else if (state is AttachmentsRowError) {
              return CustomErrorWidget(onPressed: () {
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
              child: ListView.separated(
                separatorBuilder: (context, index) => 10.horizontalSpace,
                itemCount: attachmentsRowCubit.allFilesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final file = attachmentsRowCubit.allFilesList[index];
                  if (file.file != null) {
                    return CustomFileWidget(
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttachmentsRowCubit, AttachmentsRowState>(
      buildWhen: (previous, current) {
        return previous is SaveChangesLoading || current is SaveChangesLoading;
      },
      builder: (context, state) {
        return state is SaveChangesLoading
            ? CustomLoadingIndicator()
            : TextButton(
                onPressed: () {
                  context.read<AttachmentsRowCubit>().saveFilesChanges();
                },
                child: Text("حفظ"),
              );
      },
    );
  }
}
