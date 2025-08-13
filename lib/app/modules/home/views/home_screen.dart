import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/ui/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // backgroundColor: AppColors.lightPageBackground, // Or keep it white from theme
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          // Assuming go_rent_logo.svg is in assets/icons/
          // child: SvgPicture.asset('assets/icons/go_rent_logo.svg', color: AppColors.goRentBlue),
          child: Icon(
            Icons.directions_car,
            color: AppColors.goRentBlue,
            size: 28,
          ), // Placeholder icon
        ),
        title: const Text('Go Rent'),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 28),
            onPressed: () {
              /* Implement search functionality */
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              // child: Image.asset('assets/images/user_avatar.png'), // Placeholder for user avatar
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle(context, 'Brands', textTheme.headlineSmall!),
              const SizedBox(height: 16),
              _buildBrandsList(context, textTheme),
              const SizedBox(height: 24),
              _buildSectionTitle(
                context,
                'Popular Cars',
                textTheme.headlineSmall!,
              ),
              const SizedBox(height: 16),
              _buildPopularCarsList(context, textTheme),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.filter_list_outlined),
              activeIcon: Icon(Icons.filter_list),
              label: 'Filter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              activeIcon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: controller.selectedBottomNavIndex.value,
          onTap: controller.changeBottomNavIndex,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    TextStyle style,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: style),
        Text('See All', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildBrandsList(BuildContext context, TextTheme textTheme) {
    return SizedBox(
      height: 120, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.brands.length,
        itemBuilder: (context, index) {
          final brand = controller.brands[index];
          return Card(
            color:
                brand['color'] as Color? ??
                AppColors.chevroletLightBlue, // Default color if not specified
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: 110, // Adjust width as needed
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Replace with Image.asset(brand['logo']!) for actual logos
                    CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 25,
                      child: Icon(
                        Icons.directions_car,
                        size: 30,
                        color:
                            (brand['color'] as Color? ??
                                    AppColors.chevroletLightBlue)
                                .withAlpha(150),
                      ), // Placeholder
                    ),
                    const SizedBox(height: 10),
                    Text(
                      brand['name']!,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularCarsList(BuildContext context, TextTheme textTheme) {
    return SizedBox(
      height: 280, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.popularCars.length,
        itemBuilder: (context, index) {
          final car = controller.popularCars[index];
          return Card(
            color: AppColors.popularCarCardBackground,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 240, // Adjust width as needed
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        // Replace with Image.asset(car['image']!) for actual car images
                        child: Image.network(
                          'https://static.vecteezy.com/system/resources/previews/024/007/396/original/white-tesla-model-s-car-free-png.png',
                          fit: BoxFit.contain,
                        ), // Placeholder Image
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      car['name']!,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${car['price']}/ Day',
                          style: textTheme.bodyLarge?.copyWith(
                            color: AppColors.blackColor.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            /* Implement Rent Now */
                          },
                          child: const Text('Rent Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
