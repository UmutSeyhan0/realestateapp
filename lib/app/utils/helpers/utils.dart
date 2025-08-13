import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/ui/app_colors.dart';

Future<void> runWithLoading<T>({
  required BuildContext context,
  required Future<bool> Function() task,
  String successMessage = 'İşlem başarılı.',
  String errorMessage = 'Bir hata oluştu.',
  VoidCallback? onSuccess,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (_) => const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        ),
  );

  final result = await task();

  Navigator.of(context).pop(); // close loading dialog

  if (result) {
    Get.snackbar(
      "Başarılı",
      successMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
    onSuccess?.call();
    Navigator.pop(context);
  } else {
    Get.snackbar(
      "Hata",
      errorMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }
  // close the current screen
}
