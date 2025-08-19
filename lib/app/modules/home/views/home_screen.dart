import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/routes/navigation_constants.dart';
import 'package:realestateapp/app/widgets/home/selectable_label.dart';
import 'package:realestateapp/app/widgets/inputs/app_text_field.dart';
import 'package:realestateapp/core/components/app_text_widget.dart';
import 'package:realestateapp/app/widgets/home/property_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        "Hello",
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      AppTextWidget(
                        "James Butler",
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Search Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      prefixIcon: Icon(Icons.search),
                      label: "Search",
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Kategori
            Center(child: SelectableLabelsRow()),
            const SizedBox(height: 20),

            // Başlık ve See All
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    if (controller.selectedIndex.value == -1) {
                      return const Text(
                        "Emlak Seçin",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                    return Text(
                      "${controller.getPropertyTypeName(controller.selectedIndex.value)} Emlakları",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(NavigationConstants.addProperty);
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 370,
              child: Obx(() {
                if (controller.selectedIndex.value == -1) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Kategori Seçin",
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.outline,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Emlakları görmek için yukarıdan bir kategori seçin",
                          style: TextStyle(
                            fontSize: 14,
                            color: colorScheme.outline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                // Yükleniyor durumu
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Emlak bulunamadı durumu
                if (controller.properties.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Bu tipte emlak bulunamadı",
                          style: TextStyle(
                            fontSize: 16,
                            color: colorScheme.outline,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Farklı bir kategori deneyin",
                          style: TextStyle(
                            fontSize: 14,
                            color: colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Emlakları listele
                return SizedBox(
                  height: 100, // kartın yüksekliği (PropertyCard + margin için)
                  child: PageView.builder(
                    controller: PageController(
                      viewportFraction: 0.8,
                    ), // %80 kaplasın
                    itemCount: controller.properties.length,
                    itemBuilder: (context, index) {
                      final property = controller.properties[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: PropertyCard(property: property),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
