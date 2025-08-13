import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/controller/theme_controller.dart';
import 'package:realestateapp/core/components/app_text_widget.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 16, top: 16),
              child: TextButton(
                onPressed: controller.skip,
                child: AppTextWidget(
                  'Skip',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
            ),

            // Onboarding Pages
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  final page = controller.onboardingPages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(page["image"]!, height: 300),
                        const SizedBox(height: 40),
                        Text(
                          page["title"]!,
                          style: textTheme.titleLarge?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page["subtitle"]!,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Page Indicators
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingPages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: controller.pageIndex.value == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == index
                          ? colorScheme.primary
                          : colorScheme.onSurface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Obx(
                    () => controller.pageIndex.value > 0
                        ? TextButton(
                            onPressed: controller.previousPage,
                            child: Text(
                              'Back',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                          )
                        : const SizedBox(width: 60),
                  ),
                  // Next / Start button
                  TextButton(
                    onPressed: controller.nextPage,
                    style: TextButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Obx(
                      () => Text(
                        controller.pageIndex.value ==
                                controller.onboardingPages.length - 1
                            ? 'Başla'
                            : 'İleri',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
