import 'package:get/get.dart';
import 'controller/splash_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
