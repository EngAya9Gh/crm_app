import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/finance/verified_invoice/presentation/manager/verified_invoice_bloc.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_paths.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import 'add_new_package_offer_page.dart';

class PackagesOffersPage extends StatefulWidget {
  const PackagesOffersPage({super.key});

  @override
  State<PackagesOffersPage> createState() => PackagesOffersPageState();
}

class PackagesOffersPageState extends State<PackagesOffersPage> {
  late final PackagesOffersBloc _bloc;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = getIt<PackagesOffersBloc>();
    context.read<InvoicesSectionCubit>().clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'العروض', actions: [
        if (context.read<PrivilegesCubit>().checkPrivilege('316'))
          Directionality(
            textDirection: TextDirection.rtl,
            child: AppTextButton(
              text: "إضافة\nعرض",
              onPressed: () => AppNavigator.go(
                AddPackageOfferItem(),
                name: AppRoutesPaths.salesPackagesOffersSubSections.addNewItem,
              ),
              textStyle: AppStyles.textStyle.copyWith(
                fontSize: (16.0).scaleFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.fontFamily1,
                color: AppColors.white,
              ),
              appButtonStyle: AppButtonStyle.secondary,
            ),
          )
      ]),
    );
  }
}
