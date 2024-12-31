import 'package:crm_smart/features/app/presentation/widgets/app_drop_down.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../../../clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart';
import '../manager/versions_bloc.dart';

class AddNewEntryVersion extends StatefulWidget {
  const AddNewEntryVersion({
    super.key,
    required this.oneItemVersionEntity,
    required this.bloc,
  });

  final OneItemVersionEntity oneItemVersionEntity;
  final VersionsBloc bloc;

  @override
  State<AddNewEntryVersion> createState() => _AddNewEntryVersionState();
}

class _AddNewEntryVersionState extends State<AddNewEntryVersion> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  late final ViolationsCubit violationsCubit;
  final ValueNotifier<List<ManagementModel>> listManagement = ValueNotifier([]);

  @override
  void initState() {
    violationsCubit = context.read<ViolationsCubit>()..init;
    violationsCubit.getAllManagements(
      onSuccess: (value) {
        listManagement.value = value..insert(0, ManagementModel(idManage: 0, nameManage: 'عام'));
      },
    );
    title.text = widget.oneItemVersionEntity.title ?? '';
    description.text = widget.oneItemVersionEntity.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                hintText: "العنوان",
                onChange: (val) {
                  widget.bloc.add(AddOrUpdateNewVersionItemEvent(oneItemVersionEntity: widget.oneItemVersionEntity.copyWith(title: val)));
                },
                controller: title,
                validator: InputValidator.requiredFiled,
                isRequired: true,
              ),
            ),
            Spacer(),
            ValueListenableBuilder(
              valueListenable: listManagement,
              builder: (context, value, child) {
                print(widget.oneItemVersionEntity.management);
                return Expanded(
                  flex: 3,
                  child: AppDropdownButtonFormField(
                    value: (widget.oneItemVersionEntity.management?.isEmpty??true)? '0':widget.oneItemVersionEntity.management,
                    items: value,
                    itemBuilder: (item) => AppText(item?.nameManage ?? ''),
                    itemAsValue: (item) => item?.idManage.toString(),
                    // itemAsString: (item) => item??'' ,
                    onChange: (value) {
                      widget.bloc.add(AddOrUpdateNewVersionItemEvent(
                          oneItemVersionEntity: widget.oneItemVersionEntity.copyWith(management: value == -1 ? null : value)));
                    },
                  ),
                );
              },
            ),
          ],
        ),
        10.verticalSpace,
        AppTextField(
          validator: InputValidator.requiredFiled,
          hintText: "الوصف",
          controller: description,
          onChange: (val) {
            widget.bloc.add(AddOrUpdateNewVersionItemEvent(oneItemVersionEntity: widget.oneItemVersionEntity.copyWith(description: val)));
          },
          isRequired: true,
          maxLines: 5,
        )
      ],
    );
  }
}

class OneItemVersionEntity {
  final int index;
  final String? management;
  final String? title;
  final String? description;

  const OneItemVersionEntity({
    required this.index,
    this.management,
    this.title,
    this.description,
  });

  OneItemVersionEntity copyWith({
    int? index,
    String? management,
    String? title,
    String? description,
  }) {
    return OneItemVersionEntity(
      index: this.index,
      management: management ?? this.management,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'management': this.management,
    };
  }

  factory OneItemVersionEntity.fromMap(Map<String, dynamic> map) {
    return OneItemVersionEntity(
      index: map['index'] as int,
      management: map['management'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  @override
  String toString() {
    return 'OneItemVersionEntity{id: $management, title: $title, description: $description}';
  }
}
