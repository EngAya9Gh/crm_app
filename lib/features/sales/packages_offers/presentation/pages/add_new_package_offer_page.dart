import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/sales/packages_offers/data/models/package_offer_model.dart';
import 'package:crm_smart/features/sales/packages_offers/domain/use_cases/add_packages_offers_usecase.dart';
import 'package:crm_smart/features/sales/packages_offers/presentation/manager/packages_offers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/packages_offers_enum/offers_itme_enum.dart';
import 'package:collection/collection.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../model/productmodel.dart';
import '../../../../../view_model/product_vm.dart';
import '../../../../app/presentation/widgets/app_drop_down.dart';

class AddPackageOfferItem extends StatefulWidget {
  const AddPackageOfferItem({
    super.key,
  });

  @override
  _AddPackageOfferItem createState() => _AddPackageOfferItem();
}

class _AddPackageOfferItem extends State<AddPackageOfferItem> {
  late final PackagesOffersBloc _bloc;
  final ValueNotifier<List<OfferItem>> listOffers = ValueNotifier([OfferItem()]);
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController valueOfOffer = TextEditingController();
  OfferItem? offerItemToAdded;
  final _globalKey = GlobalKey<FormState>();
  final _offerItemKey = GlobalKey<FormState>();
  final ValueNotifier<List<ProductModel>> listProductsSelected = ValueNotifier([]);
  final ValueNotifier<List<ProductModel>> listProduct = ValueNotifier([]);
  late product_vm productVm;

  @override
  void initState() {
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
                    valueListenable: listOffers,
                    builder: (context, items, child) => Column(
                      children: [...items]
                          .mapIndexed(
                            (index, element) => Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppDropdownButtonFormField(
                                      value: element.rebateType,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'هذا الحقل مطلوب.';
                                        }
                                        return null;
                                      },
                                      items: OfferItemType.values,
                                      itemAsString: (item) => item!.name.toString(),
                                      itemAsValue: (item) => item!.name.toString(),
                                      onChange: (value) {
                                        items[index] = element.copyWith(rebateType: value);
                                        offerItemToAdded = items[index];
                                      },
                                    ),
                                  ),
                                  20.width,
                                  Expanded(
                                    child: AppTextField(
                                      hintText: "قيمة العرض",
                                      controller: TextEditingController(text: "${element.rebateValue ?? ''}"),
                                      onChange: (val) {
                                        if (val != null) {
                                          items[index] = element.copyWith(rebateValue: int.parse(val));
                                          offerItemToAdded = items[index];
                                          listOffers.value = List.of(items);
                                        }
                                      },
                                      isRequired: true,
                                      inputType: TextInputType.number,
                                      validator: InputValidator.requiredFiled,
                                    ),
                                  ),
                                  10.width,
                                  if (index != 0)
                                    InkWell(
                                        onTap: () {
                                          listOffers.value = List.of(listOffers.value)..removeAt(index);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 15,
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ))
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                10.height,
                AppTextButton(
                  text: 'اضافة عنصر جديد',
                  onPressed: () {
                    if (_offerItemKey.currentState!.validate()) {
                      listOffers.value = List.of(listOffers.value)..add(OfferItem());
                    }
                  },
                ),
                20.height,
                ValueListenableBuilder(
                  valueListenable: listProductsSelected,
                  builder: (context, selectedItems, child) => ValueListenableBuilder(
                    valueListenable: listProduct,
                    builder: (context, listItem, child) => CustomMultiSelectionDropdown(
                      items: listItem,
                      selectedItems: selectedItems,
                      itemAsString: (p0) => p0?.nameProduct ?? '',
                      compareFn: (item, selectedItem) => item.nameProduct == selectedItem.nameProduct,
                      onSave: (value) {
                        listProductsSelected.value = value;
                      },
                    ),
                  ),
                ),
                40.height,
                BlocBuilder<PackagesOffersBloc, PackagesOffersState>(
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state.addNewOfferStatus.isLoading(),
                      text: 'اضافة',
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          _bloc.add(AddNewPackagesOffersEvent(
                              addNewPackagesOffersParams: AddNewPackagesOffersParams(
                                  name: name.text,
                                  start_date: startDate.text,
                                  end_date: endDate.text,
                                  offers: listOffers.value,
                                  products: listProductsSelected.value)));
                          context.pop();
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
