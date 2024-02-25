import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/di_container.dart';
import 'add_task_page.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({Key? key}) : super(key: key);

  @override
  State<TaskManagementPage> createState() => _TaskManagementPageState();
}

class _TaskManagementPageState extends State<TaskManagementPage> {
  late List<DragAndDropList> _contents;

  @override
  void initState() {
    super.initState();
  }

  setContent() {
    _contents = [
      DragAndDropList(
        canDrag: false,
        header: Container(
          color: const Color.fromARGB(255, 243, 242, 248),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 12),
            child: Text(
              'Backlog',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.grey200,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.grey200,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.grey200,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      DragAndDropList(
        canDrag: false,
        header: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            'In Progress',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      DragAndDropList(
        canDrag: false,
        header: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 12),
                  child: Text(
                    'Test',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      DragAndDropList(
        canDrag: false,
        header: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            'Done',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      DragAndDropList(
        canDrag: false,
        header: Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 12),
          child: Text(
            'Bug',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        children: <DragAndDropItem>[
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DragAndDropItem(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Center(
                                child: AppText(
                                  "M.H",
                                  style: context.textTheme.titleMedium!
                                      .copyWith(
                                          color: context.colorScheme.white),
                                ),
                              ),
                              radius: 22,
                            ),
                            10.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State management',
                                  style: context.textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Mustafa Hasaria',
                                  style: context.textTheme.bodySmall!.copyWith(
                                      color: context.colorScheme.grey500),
                                ),
                              ],
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.only(end: 50, start: 20),
                            child: AppText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            20.horizontalSpace,
                            Icon(Icons.date_range_rounded,
                                size: 15, color: context.colorScheme.grey600),
                            5.horizontalSpace,
                            AppText(
                              DateFormat('dd MMM hh:mm a')
                                  .format(DateTime.now()),
                              style: context.textTheme.labelSmall!
                                  .copyWith(color: context.colorScheme.grey600),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        10.verticalSpace
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = const Color.fromARGB(255, 243, 242, 248);
    setContent();

    return BlocProvider<TaskCubit>(
      create: (context) => getIt<TaskCubit>(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(
            title: 'إدارة المهام',
            action: [
              BlocBuilder<PrivilegeCubit, PrivilegeState>(
                builder: (context, state) {
                  if (getIt<PrivilegeCubit>().checkPrivilege('158'))
                    return AppTextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddTaskPage(),
                          ),
                        );
                      },
                      text: "إضافة مهمة",
                      appButtonStyle: AppButtonStyle.secondary,
                    );
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        body: DragAndDropLists(
          children: _contents,
          axis: Axis.horizontal,
          listWidth: MediaQuery.of(context).size.width * 0.85,
          listDraggingWidth: MediaQuery.of(context).size.width * 0.85,
          onItemReorder: _onItemReorder,
          onListReorder: _onListReorder,
          listPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemDivider: Divider(thickness: 2, height: 2, color: backgroundColor),
          itemDecorationWhileDragging: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          listInnerDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          lastItemTargetHeight: 8,
          addLastItemTargetHeightToTop: true,
          lastListTargetSize: 40,
          listDragHandle: const DragHandle(
            verticalAlignment: DragHandleVerticalAlignment.top,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                color: Colors.black26,
              ),
            ),
          ),
          itemDragHandle: const DragHandle(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }
}
