import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:realestateapp/app/routes/navigation_service.dart';
import 'package:realestateapp/config/themes/app_theme.dart';
import 'app/routes/navigation_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      getPages: NavigationService.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationConstants.loginView,
    );
  }
}
