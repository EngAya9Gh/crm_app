import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericBlocBuilder<C extends Cubit<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state) builder;

  const GenericBlocBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, S>(
      builder: builder,
    );
  }
}
