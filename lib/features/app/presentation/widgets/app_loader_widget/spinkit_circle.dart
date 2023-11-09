part of 'app_loader.dart';

class _SpinKitCircle extends AppLoader {
  const _SpinKitCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color ?? context.theme.colorScheme.primary,
      size: size ?? 30.r,
    );
  }
}
