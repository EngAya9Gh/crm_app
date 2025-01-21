import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../../core/common/enums/packages_offers_enum/offers_itme_enum.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_paths.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../ui/widgets/custom_widget/card_expansion.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import '../../data/models/package_offer_model.dart';
import 'add_new_package_offer_page.dart';
import 'package:collection/collection.dart';

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
    _bloc = context.read<PackagesOffersBloc>()..add(GetPackagesOffersEvent());
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
              onPressed: () {
                context.read<PackagesOffersBloc>().add(ResetListOfItemAddEvent());
                return AppNavigator.go(
                  AddPackageOfferItem(),
                  name: AppRoutesPaths.salesPackagesOffersSubSections.addNewItem,
                );
              },
              textStyle: AppStyles.textStyle.copyWith(
                fontSize: (16.0).scaleFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.fontFamily1,
                color: AppColors.white,
              ),
              appButtonStyle: AppButtonStyle.secondary,
            ),
          ),
      ]),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocSelector<PackagesOffersBloc, PackagesOffersState, BlocStatus<List<PackageOfferModel>>>(
          selector: (state) => state.allOffersPackages,
          builder: (context, state) => state.when(
            success: (data) => ListView.separated(
              itemBuilder: (BuildContext context, int index) => buildcardExpansion(
                  '',
                  '',
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        ...((data?[index].products ?? []))
                            .mapIndexed(
                              (i, element) => CardRow(
                                title: "اسم المنتج ${element.nameProduct} ",
                                value: '',
                                anotherWidget: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppText(
                                      '${OfferItemType.values.firstWhere(
                                            (element) => element.name.toString() == data![index].offerItems?[i].rebateType,
                                          ).symbol}',
                                      color: AppColors.primaryMain,
                                    ),
                                    10.width,
                                    AppText('${data![index].offerItems?[i].rebateValue}'),
                                  ],
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                  subTitleWidget: Column(
                    children: [
                      10.height,
                      Row(
                        children: [
                          Transform.rotate(angle: 3.14, child: Icon(Icons.play_arrow_rounded, color: Colors.green)),
                          20.width,
                          AppText(DateFormat('yyyy-MM-dd').format(data![index].startDate!)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.av_timer_outlined, color: Colors.red),
                          20.width,
                          AppText(DateFormat('yyyy-MM-dd').format(data[index].endDate!)),
                        ],
                      )
                    ],
                  ),
                  titleWidget: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (context.read<PrivilegesCubit>().checkPrivilege('318'))
                        PositionedDirectional(
                          end: -50,
                          child: InkWell(
                            onTap: () {
                              print('delete');
                            },
                            child: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ),
                      Row(
                        children: [
                          if (context.read<PrivilegesCubit>().checkPrivilege('317'))
                          InkWell(
                            onTap: () {
                              AppNavigator.go(
                                AddPackageOfferItem(packageOfferModel: data[index],),
                                name: AppRoutesPaths.salesPackagesOffersSubSections.addNewItem,
                              );
                            },
                            child: Icon(Icons.edit_square),
                          ),
                          20.width,
                          AppText("${data[index].name}"),
                        ],
                      ),
                    ],
                  )),
              separatorBuilder: (BuildContext context, int index) => 20.height,
              itemCount: data?.length ?? 0,
            ),
            failure: (error, data) => AppErrorWidget(
              message: error,
              onPressed: () {
                _bloc.add(GetPackagesOffersEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}
