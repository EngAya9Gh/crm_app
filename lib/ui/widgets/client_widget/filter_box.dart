// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../core/config/theme/theme.dart';
//
//
// class FilterBox extends StatelessWidget {
//   const FilterBox({
//     // super.key/,
//     this.hint,
//     this.hasFilter = true,
//     this.onTapFilter,
//   });
//
//   final String? hint;
//   final bool hasFilter;
//   final VoidCallback? onTapFilter;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: AppTextField(
//             name: "search",
//             borderWidth: 0,
//             borderSideColor: context.colorScheme.surface,
//             filled: true,
//             fillColor: AppColors.grey.shade100.withAlpha(40),
//             maxLines: 1,
//             textAlignVertical: TextAlignVertical.center,
//             hintText: hint,
//             prefixIcon: Icon(CupertinoIcons.search, color: AppColors.grey.shade600),
//           ),
//         ),
//         if (hasFilter) ...{
//           20.horizontalSpace,
//           Tooltip(
//             message: "فلترة",
//             child: InkWell(
//               onTap: onTapFilter,
//               borderRadius: BorderRadius.circular(10).r,
//               child: Container(
//                 height: 50.r,
//                 width: 50.r,
//                 decoration: BoxDecoration(
//                   color: AppColors.grey.shade100.withAlpha(40),
//                   borderRadius: BorderRadius.circular(10).r,
//                 ),
//                 child: Icon(Icons.filter_alt_rounded, color: AppColors.grey.shade600, size: 30.r),
//               ),
//             ),
//           ),
//         },
//       ],
//     );
//   }
// }
