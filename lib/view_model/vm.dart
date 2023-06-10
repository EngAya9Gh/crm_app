import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin StateViewModelMixin<T extends StatefulWidget, VM> on State<T> {
  late VM _appViewmodel;

  void initStateWithAppViewModel(BuildContext context, VM appViewmodel) {}

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _appViewmodel = Provider.of<VM>(context, listen: false);
      initStateWithAppViewModel(context, _appViewmodel);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appViewmodel = Provider.of<VM>(context, listen: false);
  }

  VM get viewmodel => _appViewmodel;
}