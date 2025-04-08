import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_drop_down.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../clients_care/violations_clienta_care/data/models/management_model.dart';
import '../manager/versions_bloc.dart';
import 'package:crm_smart/core/common/widgets/info_item.dart';

class AddNewEntryVersion extends StatefulWidget {
  const AddNewEntryVersion({
    super.key,
    required this.oneItemVersionEntity,
    required this.listManagement,
    this.shouldShowClose = false,
    this.isTitleOpional = false,
  });

  final bool shouldShowClose;
  final OneItemVersionEntity oneItemVersionEntity;
  final List<ManagementModel> listManagement;
  final bool isTitleOpional;

  @override
  State<AddNewEntryVersion> createState() => _AddNewEntryVersionState();
}

class _AddNewEntryVersionState extends State<AddNewEntryVersion> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  late final VersionsBloc bloc;

  @override
  void initState() {
    bloc = context.read<VersionsBloc>();
    title.text = widget.oneItemVersionEntity.title ?? '';
    description.text = widget.oneItemVersionEntity.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.shouldShowClose)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  bloc.add(RemoveItemVersion(
                      index: widget.oneItemVersionEntity.index));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
          ),
        5.height,
        InfoItem(
          title: "العنوان",
          value: widget.oneItemVersionEntity.title ?? '',
          isRequired: widget.isTitleOpional ? false : true,
          customWidget: AppTextField(
            hintText: "العنوان",
            onChange: (val) {
              bloc.add(AddOrUpdateNewVersionItemEvent(
                  oneItemVersionEntity:
                      widget.oneItemVersionEntity.copyWith(title: val)));
            },
            controller: title,
            validator:
                widget.isTitleOpional ? null : InputValidator.requiredFiled,
          ),
        ),
        10.height,
        InfoItem(
          title: "الإدارة",
          value: widget.oneItemVersionEntity.management ?? '',
          isRequired: true,
          customWidget: AppDropdownButtonFormField(
            value: (widget.oneItemVersionEntity.management?.isEmpty ?? true)
                ? '0'
                : widget.oneItemVersionEntity.management,
            items: widget.listManagement,
            itemBuilder: (item) => AppText(item?.nameManage ?? ''),
            itemAsValue: (item) => item?.idManage.toString(),
            // itemAsString: (item) => item??'' ,
            onChange: (value) {
              bloc.add(AddOrUpdateNewVersionItemEvent(
                  oneItemVersionEntity: widget.oneItemVersionEntity
                      .copyWith(management: value == -1 ? null : value)));
            },
          ),
        ),
        10.verticalSpace,
        InfoItem(
          title: "الوصف",
          value: widget.oneItemVersionEntity.description ?? '',
          isRequired: true,
          customWidget: AppTextField(
            validator: InputValidator.requiredFiled,
            hintText: "الوصف",
            controller: description,
            onChange: (val) {
              bloc.add(AddOrUpdateNewVersionItemEvent(
                  oneItemVersionEntity:
                      widget.oneItemVersionEntity.copyWith(description: val)));
            },
            maxLines: 5,
          ),
        ),
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
