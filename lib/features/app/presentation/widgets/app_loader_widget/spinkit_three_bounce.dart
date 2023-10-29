part of 'app_loader.dart';

class _SpinKitThreeBounce extends AppLoader {
  const _SpinKitThreeBounce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? context.theme.colorScheme.primary,
      size: size ?? 30.r,
    );
  }
}
