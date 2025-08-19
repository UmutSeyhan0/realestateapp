import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/modules/home/views/home_screen.dart';
import 'package:realestateapp/app/modules/property/views/property_add_view.dart';
import 'package:realestateapp/app/modules/saved/views/saved_view.dart';
import 'package:realestateapp/app/modules/settings/views/settings_view.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  BottomNavView({super.key});

  final List<Widget> pages = [
    HomeView(),
    SavedPage(),
    AddPropertyView(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Ana Menü',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark),
              label: 'Kaydedilenler',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_outlined),
              selectedIcon: Icon(Icons.add),
              label: 'Emlak Ekle',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'Ayarlar',
            ),
          ],
        ),
      );
    });
  }
}
