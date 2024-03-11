import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants.dart';
import '../../../../core/common/enums/invoice_status_enum.dart';
import '../../../../core/common/models/page_state/result_builder.dart';
import '../../../../core/di/di_container.dart';
import '../../../../model/invoiceModel.dart';
import '../../../../ui/widgets/invoice_widget/Card_invoice_client.dart';
import '../manager/manage_withdrawals_cubit.dart';

class WithdrawalsInvoicesPage extends StatefulWidget {
  const WithdrawalsInvoicesPage({Key? key}) : super(key: key);

  @override
  State<WithdrawalsInvoicesPage> createState() =>
      _WithdrawalsInvoicesPageState();
}

class _WithdrawalsInvoicesPageState extends State<WithdrawalsInvoicesPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;

  @override
  void initState() {
    _manageWithdrawalsCubit = getIt<ManageWithdrawalsCubit>()
      ..getFilteredWithdrawalsInvoices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('إدارة الفواتير المنسحبة',
                style: TextStyle(color: kWhiteColor)),
            centerTitle: true,
            backgroundColor: kMainColor,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: TextEditingController(),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: "عنوان الفاتورة...",
                            hintStyle: context.textTheme.titleSmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      10.width,
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        // drop down for InvoiceStatusEnum
                        child: DropdownButtonFormField<InvoiceStatusEnum>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          value: _manageWithdrawalsCubit.selectedFilter,
                          onChanged: (value) {
                            _manageWithdrawalsCubit.selectedFilter = value!;
                            _manageWithdrawalsCubit
                                .getFilteredWithdrawalsInvoices();
                          },
                          items: InvoiceStatusEnum.values.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(e.text),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child:
                    BlocBuilder<ManageWithdrawalsCubit, ManageWithdrawalsState>(
                  builder: (context, state) {
                    return PageStateBuilder<List<InvoiceModel>>(
                      init: Center(child: CircularProgressIndicator()),
                      success: (data) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 10,
                          ),
                          child: BlocBuilder<ManageWithdrawalsCubit,
                              ManageWithdrawalsState>(
                            builder: (context, state) {
                              return Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardInvoiceClient(
                                      type: 'withdrawn',
                                      invoice: data[index],
                                      isFromWithdrawalsInvoicesList: true,
                                    );
                                  },
                                  separatorBuilder: (context, int index) =>
                                      10.verticalSpacingRadius,
                                  itemCount: data.length,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      loading: Center(child: CircularProgressIndicator()),
                      error: (error) => Center(
                        child: IconButton(
                          onPressed: () => _manageWithdrawalsCubit
                              .getFilteredWithdrawalsInvoices(),
                          icon: Icon(Icons.refresh_rounded),
                        ),
                      ),
                      result: state.withdrawalsInvoices,
                      empty: Center(child: Text("No Withdrawals Invoices")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
