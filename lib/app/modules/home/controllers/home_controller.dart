import 'package:get/get.dart';
import 'package:test_demo/NewsMOdel.dart';
import 'package:test_demo/newsNetworkCall.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxBool hasData = false.obs;
  List<Articles>? articleList;

  @override
  void onInit() {
    getNewsList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getNewsList() async {
    await callApiForNews().then((res) {
      print(res);
      hasData.value = true;
      articleList = res?.articles;
    }).catchError((error, stack) {
      hasData.value = true;

      // print("$error ===> $stack}");
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
