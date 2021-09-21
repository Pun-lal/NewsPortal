import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var opacity = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () {
      opacity.value = false;
    });
  }
}
