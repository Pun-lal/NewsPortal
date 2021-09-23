import 'package:get/get.dart';
import 'package:news_portal/helpers/SecureStorage.dart';

class HomeScreenController extends GetxController {
  var isDarkMode = false.obs;
  var darkLightMode;
  SecureStorage secureStorage = new SecureStorage();

  @override
  void onInit() {
    super.onInit();
  }

  doModeChange() {
    if (isDarkMode.value == false) {
      readModeTheme();
      isDarkMode.value = true;
    } else {
      readModeTheme();
      isDarkMode.value = false;
    }
  }

  readModeTheme() async {
    darkLightMode = await secureStorage.readKey(key: 'Mode');
    return darkLightMode;
  }
}
