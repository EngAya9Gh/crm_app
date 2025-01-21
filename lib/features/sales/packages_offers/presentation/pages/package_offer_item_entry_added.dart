import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/packages_offers_enum/offers_itme_enum.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../app/presentation/widgets/app_drop_down.dart';
import '../manager/packages_offers_bloc.dart';

class PackageOfferItemEntryAdded extends StatefulWidget {
  const PackageOfferItemEntryAdded({super.key, required this.products, required this.item});

  final List<ProductModel> products;
  final NewEntryItemPackageOfferAdded item;

  @override
  State<PackageOfferItemEntryAdded> createState() => _PackageOfferItemEntryAddedState();
}

class _PackageOfferItemEntryAddedState extends State<PackageOfferItemEntryAdded> {
  final TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    if (widget.item.rebateValue != null) {
      valueController.text = widget.item.rebateValue.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  hintText: "قيمة العرض",
                  controller: valueController,
                  onChange: (val) {
                    if (val != null) {
                      context.read<PackagesOffersBloc>().add(DeleteOrAddOrUpdateEntryToListOfItemAddedEvent(
                          newEntryItemPackageOfferAdded: widget.item.copyWith(rebateValue: double.parse(val))));
                    }
                  },
                  isRequired: true,
                  inputType: TextInputType.number,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              20.width,
              Expanded(
                child: AppDropdownButtonFormField(
                  value: widget.item.rebateType,
                  validator: (value) {
                    if (value == null) {
                      return 'هذا الحقل مطلوب.';
                    }
                    return null;
                  },
                  items: OfferItemType.values,
                  itemAsString: (item) => item!.text.toString(),
                  itemAsValue: (item) => item!.name.toString(),
                  onChange: (value) {
                    if (value != null) {
                      context.read<PackagesOffersBloc>().add(
                          DeleteOrAddOrUpdateEntryToListOfItemAddedEvent(newEntryItemPackageOfferAdded: widget.item.copyWith(rebateType: value)));
                    }
                  },
                ),
              ),
              10.width,
              if (widget.item.index != 0)
                InkWell(
                    onTap: () {
                      context
                          .read<PackagesOffersBloc>()
                          .add(DeleteOrAddOrUpdateEntryToListOfItemAddedEvent(newEntryItemPackageOfferAdded: widget.item, isRemove: true));
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
          10.height,
          AppDropdownButtonFormField(
            value: widget.item.idProduct,
            validator: (value) {
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
            items: widget.products,
            itemAsString: (item) => item!.nameProduct.toString(),
            itemAsValue: (item) => item!.idProduct,
            onChange: (value) {
              if (value != null) {
                context.read<PackagesOffersBloc>().add(DeleteOrAddOrUpdateEntryToListOfItemAddedEvent(
                      newEntryItemPackageOfferAdded: widget.item.copyWith(idProduct: value),
                    ));
              }
            },
          )
        ],
      ),
    );
  }
}

class NewEntryItemPackageOfferAdded {
  final int index;
  final String? rebateType;
  final num? rebateValue;
  final String? idProduct;

const  NewEntryItemPackageOfferAdded({
    required this.index,
    this.rebateType,
    this.rebateValue,
    this.idProduct,
  });

  NewEntryItemPackageOfferAdded copyWith({
    String? rebateType,
    num? rebateValue,
    String? idProduct,
  }) {
    return NewEntryItemPackageOfferAdded(
      index: this.index,
      rebateType: rebateType ?? this.rebateType,
      rebateValue: rebateValue ?? this.rebateValue,
      idProduct: idProduct ?? this.idProduct,
    );
  }
}
