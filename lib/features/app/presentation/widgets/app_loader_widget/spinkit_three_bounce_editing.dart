part of 'app_loader.dart';

class _SpinKitThreeBounceEditing extends AppLoader {
  const _SpinKitThreeBounceEditing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditedSpinKitThreeBounce(
      color: color ?? context.theme.colorScheme.inversePrimary,
      size: size ?? 30.r,
    );
  }
}
