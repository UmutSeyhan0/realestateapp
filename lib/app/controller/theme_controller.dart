import 'package:get/get.dart';
import 'package:realestateapp/config/themes/app_theme.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => _instance;
  static final ThemeController _instance = ThemeController._init();

  ThemeController._init();

  var selectedTheme = AppTheme.lightTheme.obs;
  void changeTheme() {
    if (selectedTheme == AppTheme.lightTheme) {
      selectedTheme = AppTheme.darkTheme.obs;
    } else {
      selectedTheme = AppTheme.lightTheme.obs;
    }
  }
}
