import 'package:get/get.dart';
import 'package:test_demo/NewsMOdel.dart';

class NewsDetailController extends GetxController {
  //TODO: Implement NewsDetailController
  Articles? articleModel;
  final count = 0.obs;
  @override
  void onInit() {
    if (Get.arguments != null) {
      articleModel = Get.arguments["newsData"];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
