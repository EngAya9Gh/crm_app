import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class AppText extends StatelessWidget {
  const AppText(String this.data, {
    Key? key,
    this.translation = true,
    this.scrollText = false,
    this.isAutoScale = false,
    this.textSpan,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
  });

  final String? data;
  final bool translation;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final bool scrollText;
  final bool isAutoScale;

  @override
  Widget build(BuildContext context) {
    if (scrollText) {
      return TextScroll(
        translation ? data! : data!,
        mode: TextScrollMode.endless,
        velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
        delayBefore: const Duration(milliseconds: 1000),
        pauseBetween: const Duration(milliseconds: 2000),
        style: style,
        selectable: true,
        intervalSpaces: 5,
        textAlign: textAlign,
        textDirection: textDirection ?? TextDirection.rtl,
      );
    }

    return Text(
      translation ? data! : data!,
      style: style,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
    );
  }
}
