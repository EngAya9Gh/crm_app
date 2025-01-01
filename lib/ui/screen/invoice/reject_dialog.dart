import 'dart:io';
import 'dart:ui' as myui;

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as pp;
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../core/common/enums/enums.dart';
import '../../../core/common/enums/rate/rate_enum.dart';
import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/helpers/app_snackbar.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_icon.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/end_points.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/reasonmodel.dart';
import '../../../view_model/datetime_vm.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/app_file_viewer.dart';
import '../../widgets/fancy_image_shimmer_viewer.dart';
import '../../widgets/pick_image_bottom_sheet.dart';
import 'invoice_images_file.dart';

class RejectDialog extends StatefulWidget {
  const RejectDialog({
    Key? key,
    required this.invoice,
    required this.clientModel,
  });

  final InvoiceModel invoice;
  final ClientModel clientModel;

  @override
  State<RejectDialog> createState() => _RejectDialogState();
}

class _RejectDialogState extends State<RejectDialog> {
  final TextEditingController valueBackController = TextEditingController();
  final TextEditingController descresaonController = TextEditingController();
  late ClientTypeProvider typeclient_provider;
  late InvoiceModel _invoice;
  XFile? selectedFile;
  ValueNotifier<String?> selectedRateProductRadio = ValueNotifier(null);
  ValueNotifier<String?> selectedRateSalesRadio = ValueNotifier(null);
  ValueNotifier<String?> selectedRateSupportRadio = ValueNotifier(null);

  @override
  void initState() {
    _invoice = widget.invoice;
    if (_invoice.desc_reason_back?.isNotEmpty ?? false)
      descresaonController.text = _invoice.desc_reason_back.toString();
    if (_invoice.value_back?.isNotEmpty ?? false)
      valueBackController.text = _invoice.value_back.toString();

    selectedRateProductRadio.value = _invoice.rateProduct;
    selectedRateSalesRadio.value = _invoice.rateSales;
    selectedRateSupportRadio.value = _invoice.rateSupport;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      typeclient_provider =
          Provider.of<ClientTypeProvider>(context, listen: false);
      typeclient_provider.getreasons('client');

      typeclient_provider.selectedValueOut =
          _invoice.reason_back == null ? null : _invoice.reason_back.toString();
      // typeclient_provider.changevalueOut(typeclient_provider.selectedValueOut.toString());
      String val = (_invoice.date_change_back?.isNotEmpty ?? false)
          ? _invoice.date_change_back.toString()
          : formatter.format(DateTime.now());
      _currentDate = DateTime.parse(val);
      Provider.of<datetime_vm>(context, listen: false)
          .setdatetimevalue1(_currentDate);
    });
    super.initState();
  }

  @override
  void dispose() {
    valueBackController.dispose();
    descresaonController.dispose();
    super.dispose();
  }

  clear_back() {
    descresaonController.text = '';
    valueBackController.text = '';
  }

  DateTime _currentDate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context, DateTime? pickedDate) async {
    if (pickedDate != null) //&& pickedDate != currentDate)
      setState(() {
        _currentDate = pickedDate;
      });
    Provider.of<datetime_vm>(context, listen: false)
        .setdatetimevalue1(_currentDate);
  }

  final _globalKey = GlobalKey<FormState>();

  pickImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
      builder: (context) => PickImageBottomSheet(
        onPickFile: (context, file) {
          selectedFile = file;
          _invoice = _invoice.copyWith(attachFileStatus: AttachFileStatus.init);
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0,
      titlePadding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      insetPadding: EdgeInsets.only(left: 0, right: 0, bottom: 10),
      contentPadding: EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 10),
      title: Center(child: AppText('تحويل العميل إلى منسحب')),
      children: [
        Directionality(
          textDirection: myui.TextDirection.rtl,
          child: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("اسباب الإنسحاب*"),
                    5.height,
                    Consumer<ClientTypeProvider>(
                      builder: (context, cart, child) {
                        return CustomDropDown<ReasonModel>(
                          hint: "",
                          items: cart.type_of_out,
                          itemAsString: (item) => item!.nameReason,
                          selectedItem: cart.type_of_out.firstWhereOrNull(
                            (element) =>
                                element.idReason ==
                                (cart.selectedValueOut ?? 0),
                          ),
                          onChanged: (value) {
                            cart.changevalueOut(value!.idReason.toString());
                          },
                        );
                      },
                    ),
                    10.height,
                    AppTextField(
                      hintText: 'وصف سبب الإنسحاب',
                      controller: descresaonController,
                      maxLines: 3,
                      contentPadding: EdgeInsets.all(10),
                      isRequired: true,
                    ),
                    10.height,
                    AppTextField(
                      hintText: 'المبلغ المسترجع',
                      controller: valueBackController,
                      isRequired: true,
                    ),
                    10.height,
                    AppText("تاريخ الإنسحاب*"),
                    5.height,
                    CustomDateTimePicker(
                      hintText: Provider.of<datetime_vm>(context, listen: true)
                          .valuedateTime
                          .toString(),
                      dateTimeType: DateTimeEnum.date,
                      dateTimeController: TextEditingController(
                        text: _currentDate.toString().split(' ')[0],
                      ),
                      onDateChange: (dateTime, formattedDate) {
                        _selectDate(context, dateTime);
                      },
                    ),
                    10.height,
                    SizedBox(height: 10),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: selectedFile != null
                          ? Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: AppPlatformImage(
                                      fileModel: FileModel(file: selectedFile),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () => pickImage(),
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                margin: EdgeInsets.only(
                                                    top: 10, right: 15),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: Alignment.center,
                                                child: AppIcon(
                                                    Icons.attachment_rounded,
                                                    color: Colors.grey.shade700,
                                                    size: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            deleteFile();
                                          },
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            margin: EdgeInsets.only(
                                                top: 10, left: 15),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade50,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: AppIcon(
                                              Icons.delete_rounded,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : (_invoice.file_reject?.isNotEmpty ?? false)
                              ? InkWell(
                                  //onTap: () => AppPhotoViewer(urls: [EndPoints.baseUrls.urlfile + _invoice.file_reject!]).show(context),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: _invoice.file_reject!.mimeType
                                                    ?.contains("image") ==
                                                true
                                            ? InkWell(
                                                onTap: () => AppFileViewer(
                                                  imageSource:
                                                      ImageSourceViewer.network,
                                                  urls: [
                                                    EndPoints.baseUrls.urlFile +
                                                        _invoice.file_reject!
                                                  ],
                                                ).show(context),
                                                child: FancyImageShimmerViewer(
                                                  imageUrl: EndPoints
                                                          .baseUrls.urlFile +
                                                      _invoice.file_reject!,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () => openFile(
                                                    _invoice.file_reject!),
                                                child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primaryMain
                                                            .withOpacity(0.1)),
                                                    child: Icon(
                                                        Icons
                                                            .picture_as_pdf_rounded,
                                                        color: Colors.grey,
                                                        size: 30)),
                                              ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () => pickImage(),
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: Container(
                                                  height: 40.scaleIconsSize,
                                                  width: 40.scaleIconsSize,
                                                  margin: EdgeInsets.only(
                                                      top: 10, right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade50,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: AppIcon(
                                                    Icons.attachment_rounded,
                                                    color: Colors.grey.shade700,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  deleteImageReject();
                                                },
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: Container(
                                                  height: 40.scaleIconsSize,
                                                  width: 40.scaleIconsSize,
                                                  margin: EdgeInsets.only(
                                                      top: 10, right: 15),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade50,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: AppIcon(
                                                    Icons.delete_rounded,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () => pickImage(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppIcon(Icons.attachment_rounded,
                                          color: Colors.grey.shade700,
                                          size: 35),
                                      SizedBox(height: 0),
                                      AppText(
                                        'Attach file',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade600,
                                      )
                                    ],
                                  ),
                                ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 0,
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("جودة المنتج"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ..._buildRadioListTile(
                              items:
                                  RateEnum.values.map((e) => e.value).toList(),
                              selectedValue: selectedRateProductRadio,
                            ),
                          ],
                        ),
                        AppText("جودة الخدمة المقدمة من المبيعات"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ..._buildRadioListTile(
                              items:
                                  RateEnum.values.map((e) => e.value).toList(),
                              selectedValue: selectedRateSalesRadio,
                            ),
                          ],
                        ),
                        AppText("جودة الخدمة المقدمة من الدعم الفني (الشات)"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ..._buildRadioListTile(
                              items:
                                  RateEnum.values.map((e) => e.value).toList(),
                              selectedValue: selectedRateSupportRadio,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Consumer<InvoiceVm>(
                      builder: (context, value, child) {
                        if (value.isloading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (_invoice.approveBackDone==null || _invoice.approveBackDone=='2'
                            ||_invoice.approveBackDone=='3')
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppElevatedButton(
                                    text: 'انسحاب',
                                    onPressed: () async {
                                      if ((selectedFile == null &&
                                          (_invoice.file_reject?.isEmpty ??
                                              true)) ||
                                          typeclient_provider.selectedValueOut ==
                                              null) {
                                        AppSnackbar.showSnakeBar(
                                          "من فضلك قم بملىء الخيارات",
                                          color: ToastColorsEnum.warning,
                                        );
                                        return;
                                      }
                                      if (_globalKey.currentState!.validate()) {
                                        _globalKey.currentState!.save();

                                        await Provider.of<InvoiceVm>(context,
                                            listen: false)
                                            .set_state_back(
                                          {
                                            'type_back': 'back',
                                            "reason_back": typeclient_provider
                                                .selectedValueOut
                                                .toString(),
                                            "desc_reason_back":
                                            descresaonController.text
                                                .toString(),
                                            "date_change_back":
                                            _currentDate.toString(),
                                            "value_back": valueBackController.text
                                                .toString(),
                                            "rate_product":
                                            selectedRateProductRadio.value,
                                            "rate_sales":
                                            selectedRateSalesRadio.value,
                                            "rate_support":
                                            selectedRateSupportRadio.value,
                                          },
                                          _invoice.idInvoice.toString(),
                                          selectedFile,
                                        );
                                        Navigator.of(context, rootNavigator: true)
                                            .pop(false);
                                      }
                                    },
                                  ),
                                ),
                                20.horizontalSpace,
                                Expanded(
                                  child: AppElevatedButton(
                                    text: 'ارجاع',
                                    onPressed: () async {
                                      if ((selectedFile == null &&
                                          (_invoice.file_reject?.isEmpty ??
                                              true)) ||
                                          typeclient_provider.selectedValueOut ==
                                              null) {
                                        AppSnackbar.showSnakeBar(
                                          "من فضلك قم بملىء الخيارات",
                                          color: ToastColorsEnum.warning,
                                        );
                                        return;
                                      }
                                      if (_globalKey.currentState!.validate()) {
                                        _globalKey.currentState!.save();

                                        await Provider.of<InvoiceVm>(context,
                                            listen: false)
                                            .set_state_back({
                                          'type_back': 'return',
                                          "reason_back": typeclient_provider
                                              .selectedValueOut
                                              .toString(),
                                          "desc_reason_back": descresaonController
                                              .text
                                              .toString(),
                                          "date_change_back":
                                          _currentDate.toString(),
                                          "value_back":
                                          valueBackController.text.toString(),
                                          "rate_product":
                                          selectedRateProductRadio.value,
                                          "rate_sales":
                                          selectedRateSalesRadio.value,
                                          "rate_support":
                                          selectedRateSupportRadio.value,
                                        }, _invoice.idInvoice.toString(),
                                            selectedFile);
                                        Navigator.of(context, rootNavigator: true)
                                            .pop(false);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );

                        return SizedBox.shrink();

                      },
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  _buildRadioListTile({
    required List<String> items,
    required ValueNotifier<String?> selectedValue,
  }) {
    return List.generate(
      items.length,
      (index) {
        return Flexible(
          child: RadioListTile<String>(
            value: items[index],
            groupValue: selectedValue.value,
            selected: selectedValue.value == items[index],
            activeColor: AppColors.primaryMain,
            title: AppText(
              items[index],
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              setState(() {
                selectedValue.value = value;
              });
            },
          ),
        );
      },
    );
  }

  void deleteFile() {
    setState(() {
      selectedFile = null;
    });
  }

  void deleteImageReject() {
    setState(() {
      _invoice = _invoice.copyWith(deleteRejectImage: true);
    });
  }

  openFile(String attachFile) async {
    try {
      final checkFile = await Api().checkExist(pp.basename(attachFile));
      if (checkFile != null) {
        return;
      }

      File file;
      file = await Api().downloadFile(
          EndPoints.baseUrls.urlFile + attachFile, pp.basename(attachFile));
      if (file.existsSync()) {
        return;
      }
    } catch (e) {
      AppSnackbar.showSnakeBar(
        e.toString(),
        color: ToastColorsEnum.error,
      );
    }
  }
}
