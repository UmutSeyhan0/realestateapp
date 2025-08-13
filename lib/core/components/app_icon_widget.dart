import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../values/ui/app_colors.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  const AppIcon({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      colorFilter: ColorFilter.mode(
        color ?? AppColors.blackColor,
        BlendMode.srcIn,
      ),
      icon,
      width: size ?? 24,
      height: size ?? 24,
    );
  }
}
