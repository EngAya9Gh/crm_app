import 'package:crm_smart/features/app/presentation/widgets/app_drop_down.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widgets/app_text_field.dart.dart';
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
  final TextEditingController title=TextEditingController();
  final TextEditingController description=TextEditingController();
  @override
  void initState() {
    title.text=widget.oneItemVersionEntity.title??'';
    description.text=widget.oneItemVersionEntity.description??'';
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
                hintText: "رقم الاصدار",
                onChange: (val) {
                  widget.bloc.add(AddOrUpdateNewVersionItemEvent(oneItemVersionEntity: widget.oneItemVersionEntity.copyWith(title: val)));
                },
                controller: title,
                isRequired: true,
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: AppDropdownButtonFormField<String, String>(
                value:widget.oneItemVersionEntity.management??'0',
                items: ['0','1', '2'],
                itemBuilder: (item) => AppText(item),
                itemAsValue: (item) => item,
                // itemAsString: (item) => item??'' ,
                onChange: (value) {
                  widget.bloc.add(AddOrUpdateNewVersionItemEvent(oneItemVersionEntity: widget.oneItemVersionEntity.copyWith(management: value)));
                },
              ),
            ),
          ],
        ),
        10.verticalSpace,
        AppTextField(
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
