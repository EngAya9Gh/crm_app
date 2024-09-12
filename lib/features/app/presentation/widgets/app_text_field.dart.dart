import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/app_dimensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/extensions/build_context.dart';
import 'app_text.dart';

class AppTextField<T> extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onTap,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.inputType,
    this.textInputAction,
    this.textDirection,
    this.validator,
    this.maxLengthEnforcement,
    this.focusNode,
    this.autoValidateMode,
    this.scrollPhysics,
    this.scrollController,
    this.initialValue,
    this.keyboardAppearance,
    this.textAlignVertical,
    this.obscuringCharacter = "*",
    this.expands = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.showLength = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.obscure = false,
    this.prefixIcon,
    this.icon,
    this.hintTextStyle,
    this.textStyle,
    this.suffixIcon,
    this.suffix,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.contentPadding,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.borderSideColor,
    this.filled,
    this.fillColor,
    this.labelTextStyle,
    this.translateHint = true,
    this.translateLabel = true,
    this.borderRadius,
    this.title,
    this.borderWidth,
    this.isPasswordFiled = false,
    this.prefixBoxConstraints,
    this.initValue,
    this.prefix,
    this.suffixText,
    this.suffixStyle,
    this.helperText,
    this.isRequired = false,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String? val)? onChange;
  final void Function(String val)? onFieldSubmitted;
  final void Function(String? val)? onSaved;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final FormFieldValidator<String?>? validator;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidateMode;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final String? initialValue;
  final Brightness? keyboardAppearance;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsets scrollPadding;
  final bool expands;
  final bool readOnly;
  final bool autocorrect;
  final bool autofocus;
  final String obscuringCharacter;
  final bool showLength;
  final bool obscure;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final EditableTextContextMenuBuilder contextMenuBuilder;
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final bool translateHint;
  final bool translateLabel;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final String? title;
  final double? borderWidth;
  final bool isPasswordFiled;
  final BoxConstraints? prefixBoxConstraints;
  final String? initValue;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final String? helperText;
  final bool isRequired;

  @override
  State<AppTextField> createState() => _AppTextFieldState();

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

class _AppTextFieldState extends State<AppTextField> {
  late final ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    obscureNotifier = ValueNotifier(widget.isPasswordFiled);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          AppText(
            widget.title!,
            style: !widget.enabled
                ? context.textTheme.titleMedium?.s15.sb
                    ?.copyWith(color: Colors.grey)
                : context.textTheme.titleMedium?.s15.sb,
          ),
          5.verticalSpace,
        },
        ValueListenableBuilder<bool>(
            valueListenable: obscureNotifier,
            builder: (context, obscureValue, _) {
              return TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                initialValue: widget.initValue,
                controller: widget.controller,
                onTap: widget.onTap,
                onChanged: widget.onChange,
                onFieldSubmitted: (value) => widget.onFieldSubmitted,
                onEditingComplete: widget.onEditingComplete,
                onSaved: widget.onSaved,
                validator: widget.isRequired
                    ? InputValidator.requiredFiled
                    : widget.validator,
                maxLines: widget.isPasswordFiled ? 1 : widget.maxLines,
                minLines: widget.minLines,
                maxLength: widget.showLength ? widget.maxLength : null,
                textAlign: widget.textAlign,
                enabled: widget.enabled,
                keyboardType: widget.inputType,
                textInputAction: widget.textInputAction,
                textDirection: widget.textDirection,
                scrollPadding: widget.scrollPadding,
                expands: widget.expands,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                focusNode: widget.focusNode,
                obscureText: obscureValue,
                obscuringCharacter: widget.obscuringCharacter,
                autovalidateMode: widget.autoValidateMode,
                readOnly: widget.readOnly,
                scrollPhysics: widget.scrollPhysics,
                scrollController: widget.scrollController,
                autocorrect: widget.autocorrect,
                autofocus: widget.autofocus,
                cursorColor: context.colorScheme.primary,
                keyboardAppearance: widget.keyboardAppearance,
                textAlignVertical: widget.textAlignVertical,
                textCapitalization: widget.textCapitalization,
                contextMenuBuilder: widget.contextMenuBuilder,
                inputFormatters: [
                  if (widget.maxLength != null)
                    LengthLimitingTextInputFormatter(widget.maxLength),
                  if (widget.inputType == TextInputType.phone ||
                      widget.inputType == TextInputType.number) ...[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  ...?widget.inputFormatters
                ],
                style: widget.textStyle ??
                    context.textTheme.titleSmall?.r?.copyWith(
                      color: !widget.enabled
                          ? Colors.grey
                          : context.colorScheme.onBackground,
                      decoration: TextDecoration.none,
                      decorationColor: context.colorScheme.borderTextField,
                      fontSize: (18.0).scaleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  suffixText: widget.suffixText,
                  suffixStyle: widget.suffixStyle,
                  helperText: widget.helperText,
                  helperStyle: AppStyles.textStyle.copyWith(
                    fontSize: (12.0).scaleFontSize,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.primary,
                      width: widget.borderWidth ?? 1,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.primary,
                      width: widget.borderWidth ?? 1.0,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.primary,
                      width: widget.borderWidth ?? 1,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.primary,
                      width: widget.borderWidth ?? 1.0,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.error,
                      width: widget.borderWidth ?? 1.0,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          widget.borderSideColor ?? context.colorScheme.error,
                      width: widget.borderWidth ?? 1.0,
                    ),
                    borderRadius: widget.borderRadius ??
                        BorderRadius.circular(AppDimensions.kbrBorderTextField),
                  ),
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  contentPadding: widget.contentPadding ??
                      EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: widget.prefixIcon,
                  prefix: widget.prefix,
                  prefixIconConstraints: widget.prefixBoxConstraints,
                  icon: widget.icon,
                  suffixIcon: widget.isPasswordFiled
                      ? eyeIcon(obscureValue)
                      : widget.suffixIcon,
                  suffix: widget.suffix,
                  hintText:
                      widget.translateHint ? widget.hintText : widget.hintText,
                  hintStyle: widget.hintTextStyle ??
                      AppStyles.textStyle.copyWith(
                        fontSize: (16.0).scaleFontSize,
                        color: Colors.grey,
                      ),
                  labelText: widget.translateLabel
                      ? widget.labelText
                      : widget.labelText,
                  labelStyle: widget.labelTextStyle ??
                      AppStyles.textStyle.copyWith(
                        fontSize: (16.0).scaleFontSize,
                        color: Colors.grey,
                      ),
                  floatingLabelStyle: widget.labelTextStyle ??
                      AppStyles.textStyle.copyWith(
                        fontSize: (16.0).scaleFontSize,
                        color: Colors.grey,
                      ),
                ),
              );
            }),
      ],
    );
  }

  Widget eyeIcon(bool obscure) {
    return IconButton(
      onPressed: () => obscureNotifier.value = !obscure,
      icon: Icon(obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: context.colorScheme.primary),
    );
  }
}
