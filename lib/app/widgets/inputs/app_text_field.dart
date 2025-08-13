import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  Color? iconColor;
  AppTextField({
    this.label,
    this.iconColor,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final inputDecorationTheme = Theme.of(context).inputDecorationTheme;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: prefixIcon,
                  backgroundColor: iconColor,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(padding: const EdgeInsets.all(8.0), child: suffixIcon)
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        fillColor: inputDecorationTheme.fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
