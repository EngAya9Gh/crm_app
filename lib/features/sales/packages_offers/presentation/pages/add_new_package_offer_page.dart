import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/pages/package_offer_item_entry_added.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../model/productmodel.dart';
import '../../../../../view_model/product_vm.dart';
import '../../data/models/package_offer_model.dart';
import '../../domain/use_cases/add_packages_offers_usecase.dart';
import 'package:collection/collection.dart';

class AddPackageOfferItem extends StatefulWidget {
  const AddPackageOfferItem({
    super.key,
    this.packageOfferModel,
  });

  final PackageOfferModel? packageOfferModel;

  @override
  _AddPackageOfferItem createState() => _AddPackageOfferItem();
}

class _AddPackageOfferItem extends State<AddPackageOfferItem> {
  late final PackagesOffersBloc _bloc;
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController name = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  final _offerItemKey = GlobalKey<FormState>();
  final ValueNotifier<List<ProductModel>> listProduct = ValueNotifier([]);
  late product_vm productVm;

  @override
  void initState() {
    if (widget.packageOfferModel != null) {
      name.text = widget.packageOfferModel?.name ?? '';
      startDate.text = DateFormat('yyyy-MM-dd').format(widget.packageOfferModel!.startDate!);
      endDate.text = DateFormat('yyyy-MM-dd').format(widget.packageOfferModel!.endDate!);
      context.read<PackagesOffersBloc>().add(ResetListOfItemAddEvent(
          listItem: (widget.packageOfferModel?.products ?? [])
              .mapIndexed(
                (index, element) => NewEntryItemPackageOfferAdded(
                    index: index,
                    idProduct: element.idProduct,
                    rebateValue: widget.packageOfferModel?.offerItems?[index].rebateValue,
                    rebateType: widget.packageOfferModel?.offerItems?[index].rebateType),
              )
              .toList()));
    }
    _bloc = context.read<PackagesOffersBloc>();
    productVm = Provider.of<product_vm>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productVm.getproduct_vm(type: 'soft').then(
        (value) {
          listProduct.value = List.of(Provider.of<product_vm>(context, listen: false).listProduct).toList();
        },
      ); // Now it's safe to call
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'اضافة عروض جديدة', showBackButton: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextField(
                  hintText: "اسم العرض",
                  controller: name,
                  isRequired: true,
                  validator: InputValidator.requiredFiled,
                ),
                10.height,
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        hintText: "تاريخ البداية",
                        controller: startDate,
                        validator: InputValidator.requiredFiled,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          ).then((selectedDate) {
                            // Handle the selected date and time here.
                            if (selectedDate != null) {
                              DateTime selectedDateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                              );
                              startDate.text = DateFormat('yyyy-MM-dd').format(selectedDateTime);
                            }
                          });
                        },
                        readOnly: true,
                        isRequired: true,
                      ),
                    ),
                    20.width,
                    Expanded(
                      child: AppTextField(
                        hintText: "تاريخ النهاية",
                        controller: endDate,
                        validator: InputValidator.requiredFiled,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          ).then((selectedDate) {
                            // Handle the selected date and time here.
                            if (selectedDate != null) {
                              DateTime selectedDateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                              );
                              // if(selectedDate.isAtSameMomentAs(Date))
                              endDate.text = DateFormat('yyyy-MM-dd').format(selectedDateTime);
                            }
                          });
                        },
                        readOnly: true,
                        isRequired: true,
                      ),
                    ),
                  ],
                ),
                20.height,
                Form(
                  key: _offerItemKey,
                  child: ValueListenableBuilder(
                    valueListenable: listProduct,
                    builder: (context, value, child) => BlocBuilder<PackagesOffersBloc, PackagesOffersState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            ...state.listItemAdded
                                .map(
                                  (e) => PackageOfferItemEntryAdded(
                                    products: value,
                                    item: e,
                                  ),
                                )
                                .toList(),
                            20.height,
                            AppTextButton(
                              text: 'اضافة عنصر جديد',
                              onPressed: () {
                                if (_offerItemKey.currentState!.validate()) {
                                  context.read<PackagesOffersBloc>().add(DeleteOrAddOrUpdateEntryToListOfItemAddedEvent(
                                      newEntryItemPackageOfferAdded: NewEntryItemPackageOfferAdded(index: (state.listItemAdded.last.index + 1)),
                                      isAdd: true));
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                40.height,
                BlocConsumer<PackagesOffersBloc, PackagesOffersState>(
                  listener: (context, state) {
                    if(state.addOrUpdateNewOfferStatus.isSuccess()){
                      context.pop();
                      _bloc.add(GetPackagesOffersEvent());
                    }
                  },
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state.addOrUpdateNewOfferStatus.isLoading(),
                      text: widget.packageOfferModel != null ? 'تعديل' : 'اضافة',
                      onPressed: () {
                        if (_globalKey.currentState!.validate() && _offerItemKey.currentState!.validate()) {
                          if (widget.packageOfferModel == null) {
                            _bloc.add(AddNewPackagesOffersEvent(
                                addNewPackagesOffersParams: AddNewPackagesOffersParams(
                                    name: name.text,
                                    start_date: startDate.text,
                                    end_date: endDate.text,
                                    offers: state.listItemAdded
                                        .map(
                                          (e) => OfferItem(rebateType: e.rebateType, rebateValue: e.rebateValue),
                                        )
                                        .toList(),
                                    products: state.listItemAdded
                                        .map(
                                          (e) => ProductModel(idProduct: e.idProduct),
                                        )
                                        .toList())));
                          } else {
                            _bloc.add(UpdateNewPackagesOffersEvent(
                                addNewPackagesOffersParams: AddNewPackagesOffersParams(
                                    id: widget.packageOfferModel!.id!,
                                    name: name.text,
                                    start_date: startDate.text,
                                    end_date: endDate.text,
                                    offers: state.listItemAdded
                                        .map(
                                          (e) => OfferItem(rebateType: e.rebateType, rebateValue: e.rebateValue),
                                        )
                                        .toList(),
                                    products: state.listItemAdded
                                        .map(
                                          (e) => ProductModel(idProduct: e.idProduct),
                                        )
                                        .toList())));
                          }
                          // context.pop();
                        }
                      },
                    );
                  },
                ),
                10.height,
                AppElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: 'رجوع',
                ),
                15.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
