import 'package:flutter/cupertino.dart';
import 'debouncer.dart';

mixin SearchMixin {
  late final Debounce _debouncer;
  final FocusNode searchFocusNode = FocusNode();
  TextEditingController? searchController;
  String? lastQuery = '';

  void initSearch({int milliseconds = 500}) {
    _debouncer = Debounce(delay: Duration(milliseconds: milliseconds));
    searchController = TextEditingController()..addListener(_handleTyping);
  }

  void disposeSearch() {
    searchController!.dispose();
    searchFocusNode.dispose();
  }

  void _handleTyping() {
    _debouncer.run(() {
      if (lastQuery == searchController?.text) return;
      lastQuery = searchController?.text;
      onSearch(searchController?.text ?? '');
    });
  }

  void onSearch(String query);
}
