import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../core/utils/end_points.dart';
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
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
    return InkWell(
      onTap: () {
        invoice_vm().openFile(attachFile: fileAttach);
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
                        decoration:
                            BoxDecoration(color: kMainColor.withOpacity(0.1)),
                        child: Icon(
                          Icons.picture_as_pdf_rounded,
                          color: Colors.grey,
                        ))
                    : FancyImageShimmerViewer(
                        imageUrl:
                            "${EndPoints.baseUrls.laravelUrl_Image}${fileAttach.fileAttach}",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            if (context.read<PrivilegeCubit>().checkPrivilege('146') == true)
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
          ],
        ),
      ),
    );
  }
}
