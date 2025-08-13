import 'package:flutter/material.dart';

import '../../../core/components/app_icon_widget.dart';
import '../../../core/values/ui/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final double? width;
  final double? height;
  final Color foregroundColor;
  final BoxDecoration? decoration;
  final bool hasElevation;
  final Function() onTap;
  const AppIconButton({
    super.key,
    required this.icon,
    this.decoration,
    this.foregroundColor = AppColors.primaryColor,
    required this.onTap,
    this.width,
    this.height,
    this.hasElevation = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: hasElevation ? 10 : 0,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: width,
          height: height,
          decoration: decoration,
          padding: const EdgeInsets.all(8.0),
          child: AppIcon(color: foregroundColor, icon: icon),
        ),
      ),
    );
  }
}
