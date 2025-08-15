import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:realestateapp/app/routes/navigation_service.dart';
import 'package:realestateapp/config/themes/app_theme.dart';
import 'firebase_options.dart'; // flutterfire ile oluşturulan dosya
import 'app/routes/navigation_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'i başlat
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      initialRoute: NavigationConstants.registerView,
    );
  }
}
