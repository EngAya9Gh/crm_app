import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/seller_type_enum.dart';
import '../../../core/common/widgets/custom_error_widget.dart';
import '../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/participatModel.dart';
import '../../../view_model/invoice_vm.dart';

class SellerWidget extends StatefulWidget {
  const SellerWidget({
    super.key,
    this.invoiceModel,
    required this.sellerStatus,
    required this.selectedSellerType,
    required this.collaboratesList,
    required this.agentsListTemp,
  });

  final InvoiceModel? invoiceModel;
  final SellerStatus sellerStatus;
  final SellerTypeEnum selectedSellerType;
  final List<ParticipateModel> collaboratesList;
  final List<AgentDistributorModel> agentsListTemp;

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  late final InvoiceVm invoiceVm;

  @override
  void initState() {
    invoiceVm = context.read<InvoiceVm>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceVm>(builder: (context, invoiceVm, _) {
      if (widget.sellerStatus == SellerStatus.loading) {
        return CustomLoadingIndicator();
      } else if (widget.sellerStatus == SellerStatus.failed) {
        return CustomErrorWidget(
          onPressed: () => invoiceVm
            ..getAgentsAndDistributors()
            ..getCollaborators(),
        );
      } else if (widget.selectedSellerType == SellerTypeEnum.collaborator) {
        return collaborateDropdown(
          participates: widget.collaboratesList,
          selectedSellerType: widget.selectedSellerType,
          selectedValue: invoiceVm.selectedCollaborator,
        );
      } else if (widget.selectedSellerType == SellerTypeEnum.distributor) {
        return AgentDropdown(
          agents: widget.agentsListTemp,
          selectedSellerType: widget.selectedSellerType,
          selectedValue: invoiceVm.selectedDistributor,
        );
      } else {
        return AgentDropdown(
          agents: widget.agentsListTemp,
          selectedSellerType: widget.selectedSellerType,
          selectedValue: invoiceVm.selectedAgent,
        );
      }
    });
  }

  Widget collaborateDropdown({
    required List<ParticipateModel> participates,
    required ParticipateModel? selectedValue,
    required SellerTypeEnum selectedSellerType,
  }) {
    return CustomSearchableDropDown<ParticipateModel>(
      hint: 'اختر المتعاون',
      items: participates,
      itemAsString: (u) => u!.name_participate,
      onChanged: (seller) {
        invoiceVm.onChangeSelectedCollaborator(seller!);
      },
      selectedItem: selectedValue,
      filterFn: (user, filter) => user.getFilterParticipate(filter),
      compareFn: (item, selectedItem) =>
          item.id_participate == selectedItem.id_participate,
      validator: (text) {
        if (selectedSellerType == SellerTypeEnum.employee) {
          return null;
        }

        if (text == null) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }

  Widget AgentDropdown({
    required List<AgentDistributorModel> agents,
    required AgentDistributorModel? selectedValue,
    required SellerTypeEnum selectedSellerType,
  }) {
    return CustomSearchableDropDown<AgentDistributorModel>(
      hint: 'اختر الوكيل',
      items: agents,
      itemAsString: (u) => u!.nameAgent,
      onChanged: (seller) {
        invoiceVm.onChangeSelectedAgent(seller!);
      },
      selectedItem: selectedValue,
      filterFn: (user, filter) => user.nameAgent
          .toLowerCase()
          .toString()
          .contains(filter.toLowerCase()),
      compareFn: (item, selectedItem) => item.idAgent == selectedItem.idAgent,
      validator: (text) {
        if (selectedSellerType == SellerTypeEnum.employee) {
          return null;
        }

        if (text == null) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }

  Widget sellerDropdown<T>(
    List<T> sellerNames,
    SellerTypeEnum selectedSellerType, {
    T? selectedValue,
  }) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            validator: (text) {
              if (selectedSellerType == SellerTypeEnum.employee) {
                return null;
              }

              if (text == null) {
                return 'هذا الحقل مطلوب';
              }
              return null;
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
            hint: Text(selectedSellerType == SellerTypeEnum.distributor
                ? "اختر الموزع"
                : "اختر الوكيل"),
            items: sellerNames.map((item) {
              if (T == ParticipateModel) {
                return DropdownMenuItem(
                  child: Text((item as ParticipateModel).name_participate,
                      textDirection: TextDirection.rtl),
                  value: item,
                );
              } else {
                return DropdownMenuItem(
                  child: Text((item as AgentDistributorModel).nameAgent,
                      textDirection: TextDirection.rtl),
                  value: item,
                );
              }
            }).toList(),
            value: selectedValue,
            onChanged: (seller) {
              if (seller == null) {
                return;
              }

              if (T == ParticipateModel) {
                invoiceVm
                    .onChangeSelectedCollaborator(seller as ParticipateModel);
              } else {
                invoiceVm
                    .onChangeSelectedAgent(seller as AgentDistributorModel);
              }
            },
            onSaved: (seller) {},
          ),
        ),
      ),
    );
  }
}
