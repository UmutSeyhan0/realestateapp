import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestateapp/app/modules/home/controllers/home_controller.dart';

class SelectableLabelsRow extends StatelessWidget {
  SelectableLabelsRow({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<_LabelItem> items = const [
    _LabelItem(text: 'Home', color: Color(0xFF3B82F6)), // mavi
    _LabelItem(text: 'Apartment', color: Color(0xFF10B981)), // yeşil
    _LabelItem(text: 'Office', color: Color(0xFFF59E0B)), // turuncu
    _LabelItem(text: 'Land', color: Color(0xFFEF4444)), // kırmızı
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isSelected = controller.selectedIndex.value == i;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => controller.select(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? item.color.withOpacity(0.2) : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item.text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: item.color,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _LabelItem {
  final String text;
  final Color color;
  const _LabelItem({required this.text, required this.color});
}
