import 'package:flutter/material.dart';

class AppCardContainer extends StatefulWidget {
  const AppCardContainer({
    super.key,
    this.onTap,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.height,
    this.width,
  });

  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? height;
  final double? width;

  @override
  State<AppCardContainer> createState() => _AppCardContainerState();
}

class _AppCardContainerState extends State<AppCardContainer> {
  bool isHighlight = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: widget.onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHighlightChanged: (value) {
          isHighlight = value;
          setState(() {});
        },
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastEaseInToSlowEaseOut,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          padding: widget.padding ?? EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isHighlight
                ? Colors.grey.withOpacity(0.1)
                : widget.color ?? Colors.white,
            boxShadow: [
              BoxShadow(
                color: isHighlight
                    ? Colors.transparent
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
