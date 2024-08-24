import 'dart:math' as math;

import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../utils/app_colors.dart';

class AppLoader extends StatelessWidget {
  const factory AppLoader.fourRotatingDots({Key? key}) = FourRotatingDots;

  const factory AppLoader.flicker({Key? key}) = FlickerDots;

  const AppLoader({
    super.key,
    this.size,
    this.padding = 2,
    this.isExpanded = false,
    this.color,
  });

  final double? size;
  final double padding;
  final bool isExpanded;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Widget child = Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: FourRotatingDots(),
      ),
    );
    return isExpanded ? Expanded(child: child) : child;
  }
}

class FourRotatingDots extends AppLoader {
  const FourRotatingDots({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: color ?? AppColors.primaryColor,
      size: size?.scaleIconsSize ?? (35.0).scaleIconsSize,
    );
  }
}

class FlickerDots extends AppLoader {
  const FlickerDots({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.flickr(
      leftDotColor: AppColors.primaryColor,
      rightDotColor: AppColors.secondaryColor,
      size: size?.scaleIconsSize ?? (40.0).scaleIconsSize,
    );
  }
}

/* Custom Dots Loader*/

class EditedSpinKitThreeBounce extends StatefulWidget {
  const EditedSpinKitThreeBounce({
    super.key,
    this.color,
    this.size = 25.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1400),
    this.controller,
    this.numberOfDots = 3,
  }) : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color');

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;
  final int numberOfDots;

  @override
  State<EditedSpinKitThreeBounce> createState() =>
      _EditedSpinKitThreeBounceState();
}

class _EditedSpinKitThreeBounceState extends State<EditedSpinKitThreeBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.numberOfDots, (i) {
        return ScaleTransition(
          scale:
              _DelayTween(begin: 0.0, end: 1.0, delay: i / widget.numberOfDots)
                  .animate(_controller),
          child: SizedBox.fromSize(
            size: Size.square(widget.size.scaleIconsSize),
            child: _itemBuilder(i),
          ),
        );
      }),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              border: Border.all(
                  color: context.theme.colorScheme.primary, width: 1)));
}

class _DelayTween extends Tween<double> {
  _DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

// useage

/*

            EditedSpinKitThreeBounce(
              numberOfDots: 4,
              size: 15,
              itemBuilder: (context, index) => DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),


*/
