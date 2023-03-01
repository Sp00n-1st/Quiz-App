import 'package:get/get.dart';
import '../view/home.dart';
import 'controller.dart';

class SplashController extends GetxController {
  var controller = Get.put(Controller());
  @override
  void onReady() {
    controller.jarak.value = 500;
    Future.delayed(
      const Duration(milliseconds: 4500),
      () {
        Get.offAll(const Home());
      },
    );
    super.onReady();
  }
}
