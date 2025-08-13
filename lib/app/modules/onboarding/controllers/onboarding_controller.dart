import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;
  late PageController pageController;

  final onboardingPages = [
    {
      "title": "Hoşgeldiniz!",
      "subtitle": "Uygulamamıza hoşgeldiniz. Kolayca başlayın.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Özellikler",
      "subtitle": "Harika özellikleri keşfedin.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Hemen Başla",
      "subtitle": "Hadi uygulamayı kullanmaya başla!",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void nextPage() {
    if (pageIndex.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      completeOnboarding();
    }
  }

  void previousPage() {
    if (pageIndex.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skip() {
    completeOnboarding();
  }

  void completeOnboarding() {
    // Onboarding bittiğinde yönlendirme
    Get.offNamed('/login');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
