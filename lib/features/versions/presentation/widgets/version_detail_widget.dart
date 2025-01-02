import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VersionDetailWidget extends StatefulWidget {
  final VersionModel versionModel;

  const VersionDetailWidget({super.key, required this.versionModel});

  @override
  State<VersionDetailWidget> createState() => _VersionDetailWidgetState();
}

class _VersionDetailWidgetState extends State<VersionDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      smallBuilder: (context) => _buildMobileCard(),
      mediumBuilder: (context) => _buildDesktopCard(),
      // largeBuilder: (context) => _buildDesktopCard(),
    );
  }

  Widget _buildMobileCard() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      // Use the full width of the available space
      padding: EdgeInsets.all(5.sp),
      // Increased padding for readability
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(
                HelperFunctions.formatDate(widget.versionModel.versionDate),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10.sp, color: Colors.blue),
                softWrap: true,
              ),
              10.width,

              Text(
                widget.versionModel.management ?? "غير محددة الادارة",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10.sp),
                softWrap: true,
              ),
            ],
          ),
          10.height,
          Text(
            widget.versionModel.description ?? '',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10.sp),
            // maxLines: 3, // Restrict to 3 lines for a clean look
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopCard() {
    return Container(
      alignment: Alignment.center,
      width: 660,
      // 330,
      // height: 115,
      padding: EdgeInsets.all(5.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text(
                HelperFunctions.formatDate(widget.versionModel.versionDate),
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 4.sp, color: Colors.blue),
                softWrap: true,
              ),
              10.width,
              Text(
                widget.versionModel.title??'',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 4.sp),
                softWrap: true,
              ),
            ],
          ),
          10.height,
          Text(
            widget.versionModel.description??'',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 4.sp),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
