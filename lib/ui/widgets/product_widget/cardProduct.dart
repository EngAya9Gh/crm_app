import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/productmodel.dart';
import '../../screen/product/editproduct.dart';

class CardProduct extends StatelessWidget {
  CardProduct({required this.itemProd, Key? key}) : super(key: key);
  ProductModel itemProd;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          EditProduct(productModel: itemProd),
          isNew: false,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(itemProd.nameProduct,maxLines: 2,),
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText('السعر', fontWeight: FontWeight.bold),
              AppText(itemProd.priceProduct),
              5.width,
              SizedBox(width: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(' الضريبة  ', fontWeight: FontWeight.bold),
                  AppText(
                    itemProd.value_config == null ||
                            itemProd.value_config == "null"
                        ? ' لا يوجد'
                        : itemProd.value_config.toString(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
