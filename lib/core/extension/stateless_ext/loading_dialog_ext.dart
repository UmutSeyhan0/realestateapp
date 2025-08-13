import 'package:flutter/material.dart';

extension StatelessWidgetExtension on StatelessWidget {
  void logWidgetInfo() {
    print("Widget Type: ${this.runtimeType}");
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
