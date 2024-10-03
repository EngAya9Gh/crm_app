import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/widgets/app_icon.dart';
import '../../core/common/widgets/app_loader.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/end_points.dart';
import '../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../model/invoiceModel.dart';
import '../../view_model/invoice_vm.dart';
import 'fancy_image_shimmer_viewer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.fileAttach,
    required this.onDelete,
  }) : super(key: key);

  final FileAttach fileAttach;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return StatefulBuilder(
      builder: (context, refresh) {
        return InkWell(
          onTap: () async {
            isLoading = true;
            refresh(() {});
            await InvoiceVm().openFile(
              attachFile: fileAttach,
              context: context,
            );
            isLoading = false;
            refresh(() {});
          },
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: fileAttach.fileAttach!.endsWith('.pdf')
                        ? Container(
                            width: 110,
                            decoration: BoxDecoration(
                                color: AppColors.primaryMain.withOpacity(0.1)),
                            child: isLoading
                                ? AppLoader(padding: 12)
                                : AppIcon(
                                    Icons.picture_as_pdf_rounded,
                                    color: Colors.grey,
                                  ))
                        : FancyImageShimmerViewer(
                            imageUrl:
                                "${EndPoints.baseUrls.laravelFilesUrl}${fileAttach.fileAttach}",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                if (context.read<PrivilegesCubit>().checkPrivilege('146') ==
                    true)
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: onDelete,
                            borderRadius: BorderRadius.circular(90),
                            child: Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(top: 5, right: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.delete_rounded,
                                  color: Colors.red, size: 17),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (isLoading) ...[
                  AppLoader(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
