import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/manager/attachments_row_cubit/attachments_row_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';
import '../../core/common/helpers/check_sorage_permission.dart';
import '../../core/common/widgets/custom_error_widget.dart';
import '../../core/common/widgets/custom_loading_indicator.dart';
import '../../features/clients_list/data/models/client_support_file_model.dart';
import '../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart';
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../model/invoiceModel.dart';
import 'custom_network_Image.dart';
import 'custom_widget/text_uitil.dart';
import 'pdf_with_zoom_icon.dart';
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
  late final ClientsListBloc clientsListBloc;
  late final AttachmentsRowCubit attachmentsRowCubit;

  @override
  void initState() {
    clientsListBloc = context.read<ClientsListBloc>();
    attachmentsRowCubit = context.read<AttachmentsRowCubit>();

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
        // BlocBuilder<ClientsListBloc, ClientsListState>(
        //   builder: (context, state) {
        //     return AttachmentWidget(
        //         crudClientSupportFilesStatus:
        //             clientsListBloc.state.getClientSupportFilesStatus);
        //   },
        // ),
        // SizedBox(height: 20),
        20.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextUtilis(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              textstring: 'المرفقات:',
              underline: TextDecoration.none,
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
                      final fileModel = ClientSupportFileModel.fromFile(file)
                          .copyWith(isSelected: true);
                      attachmentsRowCubit.addFile(fileModel);
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
          builder: (context, state) {
            if (state is AttachmentsRowLoading) {
              return CustomLoadingIndicator();
            } else if (state is AttachmentsRowError) {
              return CustomErrorWidget(onPressed: () {
                clientsListBloc
                    .add(GetClientSupportFilesEvent(GetClientSupportFilesParams(
                  invoiceId: widget.idInvoice,
                )));
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
                  if (file.fileUrl.endsWith('.pdf')) {
                    return InkWell(
                      onTap: () {
                        // invoiceVm.deleteFileAttach(index);
                      },
                      child: PdfWithZoomIcon(
                        fileUrl: urlfile + file.fileUrl,
                        file: null,
                      ),
                    );
                  }
                  return CustomNetworkImage(
                    // todo: handle open selected images
                    isLocal: file.isSelected,
                    fileAttach: FileAttach(
                      id: file.id,
                      fileAttach: file.fileUrl,
                    ),
                    onDelete: () {
                      attachmentsRowCubit.deleteFile(file);
                    },
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

// void _uploadFile() {
//   clientsListBloc.add(CrudClientSupportFilesEvent(
//     CrudClientSupportFilesParams(
//       invoiceId: widget.idInvoice!,
//       deletedFiles: [],
//       addedFiles: [selectedFile!],
//     ),
//     onSuccess: (value) {
//       setState(() {
//         selectedFile = null;
//       });
//     },
//   ));
// }
//
// Widget fileImage(ClientSupportFileModel file, VoidCallback onDelete) {
//   return SizedBox(
//     height: 125,
//     width: 110,
//     child: Stack(
//       children: [
//         Positioned.fill(
//           child: Column(
//             children: [
//               Expanded(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Container(
//                       width: 110,
//                       decoration:
//                           BoxDecoration(color: kMainColor.withOpacity(0.1)),
//                       child: Icon(
//                         Icons.picture_as_pdf_rounded,
//                         color: Colors.grey,
//                       )),
//                 ),
//               ),
//               5.verticalSpacingRadius,
//             ],
//           ),
//         ),
//         Positioned.fill(
//           child: Align(
//             alignment: Alignment.topRight,
//             child: InkWell(
//               onTap: onDelete,
//               borderRadius: BorderRadius.circular(90),
//               child: Container(
//                 height: 25,
//                 width: 25,
//                 margin: EdgeInsets.only(top: 5, right: 5),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade50,
//                   shape: BoxShape.circle,
//                 ),
//                 alignment: Alignment.center,
//                 child:
//                     Icon(Icons.delete_rounded, color: Colors.red, size: 17),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
//

  pickImages() async {
    if (!(await checkStoragePermission())) return;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'webp', 'dng', 'heic', 'pdf'],
      type: FileType.custom,
    );
    if (result == null) {
      return;
    }

    // invoiceVm.addOnFilesAttach(
    //   result.files.map((e) => FileAttach(file: XFile(e.path!))).toList(),
    //       () => ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("أكثر عدد مسموح به هو 20 ملف."))),
    // );
  }
}

// class _AttachmentWidget extends StatelessWidget {
//   const _AttachmentWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       alignment: Alignment.center,
//       child: selectedFile != null
//           ? Stack(
//               children: [
//                 // selected file
//                 Positioned.fill(
//                     child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.file(selectedFile!, fit: BoxFit.cover),
//                 )),
//                 // icon buttons
//                 Positioned.fill(
//                     child: Align(
//                   alignment: Alignment.topRight,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // upload icon
//                       Container(
//                         height: 40,
//                         width: 40,
//                         margin: EdgeInsets.only(top: 10, right: 15),
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade50,
//                           shape: BoxShape.circle,
//                         ),
//                         alignment: Alignment.center,
//                         child: Builder(
//                           builder: (context) {
//                             if (crudClientSupportFilesStatus.isLoading()) {
//                               return CustomLoadingIndicator();
//                             } else if (crudClientSupportFilesStatus.isFail()) {
//                               return CustomErrorWidget(
//                                 color: Colors.red,
//                                 onPressed: () {
//                                   _uploadFile();
//                                 },
//                               );
//                             }
//                             return InkWell(
//                               onTap: () {
//                                 _uploadFile();
//                               },
//                               child: Icon(
//                                 Icons.done,
//                                 color: kMainColor,
//                                 size: 20,
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       // delete icon
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             selectedFile = null;
//                           });
//                         },
//                         borderRadius: BorderRadius.circular(90),
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           margin: EdgeInsets.only(top: 10, left: 15),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade50,
//                             shape: BoxShape.circle,
//                           ),
//                           alignment: Alignment.center,
//                           child: Icon(
//                             Icons.delete_rounded,
//                             color: Colors.red,
//                             size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//               ],
//             )
//           : InkWell(
//               borderRadius: BorderRadius.circular(15),
//               onTap: () => pickImage(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.attachment_rounded,
//                       color: Colors.grey.shade700, size: 35),
//                   SizedBox(height: 0),
//                   Text(
//                     'Attach file',
//                     style: context.textTheme.titleMedium?.copyWith(
//                         fontFamily: kfontfamily2,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.grey.shade600),
//                   )
//                 ],
//               ),
//             ),
//     );
//   }
// }
