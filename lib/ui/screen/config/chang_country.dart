import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_scaffold.dart';
import '../../../model/countrymodel.dart';
import '../../../view_model/country_vm.dart';
import '../../../view_model/user_vm_provider.dart';

class ChangeCountry extends StatefulWidget {
  const ChangeCountry({super.key});

  @override
  _ChangeCountryState createState() => _ChangeCountryState();
}

class _ChangeCountryState extends State<ChangeCountry> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String fkcoun = AppConstants.currentCountry;

      await Provider.of<country_vm>(context, listen: false).getcountry();
      Provider.of<country_vm>(context, listen: false).changeValuser(fkcoun);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'تغيير الدولة'),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<UserProvider>(context).isUpdate,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: AppCardContainer(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('البلد*'),
                  5.height,
                  Consumer<country_vm>(
                    builder: (context, cart, child) {
                      if (cart.isGetCountryLoading || cart.listcountry.isEmpty) {
                        return AppLoader();
                      }

                      return CustomSearchableDropDown<CountryModel>(
                        hint: 'البلد',
                        items: cart.listcountry,
                        itemAsString: (u) => u!.nameCountry,
                        selectedItem: cart.listcountry
                            .firstWhere((element) => element.idCountry == cart.selectedValueuser.toString(), orElse: () => cart.listcountry.first),
                        onChanged: (data) {
                          cart.changeValuser(data!.idCountry);
                        },
                        validator: InputValidator.requiredFiled,
                        filterFn: (user, filter) {
                          return user.nameCountry.contains(filter);
                        },
                        compareFn: (user, value) {
                          return user.idCountry == value;
                        },
                      );
                    },
                  ),
                  20.height,
                  AppElevatedButton(
                    width: double.infinity,
                    text: 'حفظ',
                    onPressed: () async {
                      String iduser = Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString();
                      String fkcountry = Provider.of<country_vm>(context, listen: false).selectedValueuser.toString();

                      Provider.of<UserProvider>(context, listen: false).updateUserVm(
                        body: {'fk_country': fkcountry, 'isActive': Provider.of<UserProvider>(context, listen: false).currentUser.isActive},
                        iduser: iduser,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
