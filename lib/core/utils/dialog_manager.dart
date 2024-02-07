import 'package:flutter/material.dart';

class DialogManager {
  static final DialogManager instance = DialogManager._internal();

  // factory DialogManager() => _instance;

  DialogManager._internal(); // Private constructor for singleton

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void showLoading({
    required BuildContext context,
    bool showDefaultDialog = true,
    String title = "",
    String message = "",
  }) {
    _isLoading = true;

    if (showDefaultDialog) {
      // Show platform-specific dialog (AlertDialog or similar)
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.value(false),
          child: SimpleDialog(
           
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      );
    }
  }

  void hideLoading({required BuildContext context,}) {
    if(_isLoading){
     _isLoading = false;
     Navigator.of(context).pop();
    }

  }
}