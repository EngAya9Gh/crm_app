// import 'package:crm_smart/core/utils/end_points.dart';
// import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
// import 'package:crm_smart/model/invoiceModel.dart';
// import 'package:crm_smart/ui/widgets/fancy_image_shimmer_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../view_model/invoice_vm.dart';
//
// class CustomNetworkImage extends StatelessWidget {
//   const CustomNetworkImage({
//     super.key,
//     required this.fileAttach,
//     required this.onDelete,
//     required this.invoiceVm,
//   });
//
//   final FileAttach fileAttach;
//   final VoidCallback onDelete;
//   final invoice_vm invoiceVm;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         invoiceVm.openFile(attachFile: fileAttach);
//       },
//       child: SizedBox(
//         width: 100,
//         height: 100,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: FancyImageShimmerViewer(
//                   imageUrl:
//                       "${EndPoints.baseUrls.laravelUrlImage}${fileAttach.fileAttach}",
//                   fit: BoxFit.cover,
//                 ),
//                 // Image.network(
//                 //   "${EndPoints.baseUrls.url_laravel}${fileAttach.fileAttach}",
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//             ),
//             if (context.read<PrivilegeCubit>().checkPrivilege('146') == true)
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Positioned.fill(
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: InkWell(
//                         onTap: onDelete,
//                         borderRadius: BorderRadius.circular(90),
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           margin: EdgeInsets.only(top: 5, right: 5),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade50,
//                             shape: BoxShape.circle,
//                           ),
//                           alignment: Alignment.center,
//                           child: Icon(Icons.delete_rounded,
//                               color: Colors.red, size: 17),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
