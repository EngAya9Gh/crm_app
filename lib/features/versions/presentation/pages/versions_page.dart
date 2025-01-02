import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../widgets/custome_time_line_widget.dart';

class VersionsPage extends StatefulWidget {
  const VersionsPage({super.key});

  @override
  State<VersionsPage> createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionsPage> {
  late final VersionsBloc _bloc;


  @override
  void initState() {
    _bloc = context.read<VersionsBloc>();
    _bloc.add(GetAllVersionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الاصدارت', showBackButton: true),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: BlocBuilder<VersionsBloc, VersionsState>(
          builder: (context, state) {
            return state.getAllVersionsStatus.when(
              loading: () => AppLoader(),
              success: (data) => ListView.builder(
                itemCount: (data?.length ?? 0) + 1, // Increment item count by 1
                padding: EdgeInsets.only(top: 10.h),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // العقدة الاولى في البداية للاضافة
                    return CustomTimeLineVersionWidget(
                      index: -1,
                      isFirst: true,
                      isLast: false,
                      isPast: false,
                    );
                  } else {
                    // باقي العناصر (تحويل الفهرس بسبب العقدة الجديدة)
                    final adjustedIndex = index - 1; // تعويض الفهرس
                    return CustomTimeLineVersionWidget(
                      index: adjustedIndex,
                      isFirst: false,
                      isLast: adjustedIndex == (data!.length - 1),
                      isPast: true,
                      versionModel: data[index-1],
                    );
                  }
                },
              ),
              empty: () => AppErrorWidget(message: 'لا يوجد نتائج'),
              failure: (error, data) => AppErrorWidget(
                message: error,
                onPressed: () => _bloc.add(GetAllVersionsEvent()),
              ),
            );
          },
        ),
      ),
    );
  }
}
