import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/products_sales_reports_cubit.dart';
import '../widgets/filter_products_sales_reports_sheet.dart';
import '../widgets/products_sales_reports_body.dart';

class ProductsSalesReportsPage extends StatefulWidget {
  const ProductsSalesReportsPage({super.key});

  @override
  State<ProductsSalesReportsPage> createState() => _ProductsSalesReportsState();
}

class _ProductsSalesReportsState extends State<ProductsSalesReportsPage> {
  late final ProductsSalesReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ProductsSalesReportsCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.getProductsSalesReports();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'تقارير مبيعات المنتجات',
        actions: [
          CustomFilterIcon(
            onTap: () async {
              final value = await AppBottomSheet.show(
                context: context,
                child: FilterProductsSalesReportsSheet(),
              );
              if (value != true) _cubit.returnToPreviousState();
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: BlocBuilder<ProductsSalesReportsCubit,
                    ProductsSalesReportsState>(
                  buildWhen: (previous, current) {
                    return previous.getProductsSalesReportsStatus !=
                        current.getProductsSalesReportsStatus;
                  },
                  builder: (context, state) {
                    return state.getProductsSalesReportsStatus.when(
                      loading: () => AppLoader(),
                      success: (data) => ProductsSalesReportsBody(),
                      empty: () => CustomErrorWidget(message: 'لا يوجد نتائج'),
                      failure: (error, data) => CustomErrorWidget(
                        message: error,
                        onPressed: () => _cubit.getProductsSalesReports(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
