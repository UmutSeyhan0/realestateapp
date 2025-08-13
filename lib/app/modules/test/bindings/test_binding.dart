import 'package:get/get.dart';

import '../../../data/providers/test_provider.dart';
import '../../../data/repository/test_repository.dart';
import '../controllers/test_view_controller.dart';

class TestBinding extends Bindings {
  //sıra ile eklemen gerekiyor her bir bağımlılığı
  @override
  void dependencies() {
    Get.lazyPut<TestProvider>(() => TestProvider());
    Get.lazyPut<TestRepository>(() => TestRepository());
    Get.put<TestViewController>(TestViewController());
  }
}

/*
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../data/repositories/product_repository.dart';
import '../../services/analytics_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Controller bağımlılığı (her sayfa yüklendiğinde yeni bir instance)
    Get.put<HomeController>(HomeController());
    
    // Lazy loading (ihtiyaç duyulduğunda yüklenecek)
    Get.lazyPut<ProductRepository>(() => ProductRepository());
    
    // Kalıcı olarak bellekte tutulacak servis (Singleton)
    Get.putAsync<AnalyticsService>(() async => await AnalyticsService().init());
    
    // Belirli bir isimle kaydedilecek bağımlılık
    Get.put<ThemeController>(ThemeController(), tag: 'home_theme');
    
    // Geçici bağımlılık (sayfa kapandığında silinecek)
    Get.create<TempDataProvider>(() => TempDataProvider());
  }
}
*/
