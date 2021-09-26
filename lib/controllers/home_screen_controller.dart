import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_portal/helpers/SecureStorage.dart';
import 'package:news_portal/model/NewsModel.dart';
import 'package:news_portal/services/servicesApi.dart';

class HomeScreenController extends GetxController {
  var isDarkMode = false.obs;
  var darkLightMode;
  var isload = false;
  var dropDownValue;
  SecureStorage secureStorage = new SecureStorage();
  var newsModel = NewsModel();

  @override
  void onInit() {
    super.onInit();
  }

  doModeChange() {
    if (isDarkMode.value == false) {
      isDarkMode.value = true;
    } else {
      isDarkMode.value = false;
    }
  }

  getNews({String? newsType, String? sortBy}) {
    try {
      SevicesApi.newsArticles(newsTypes: newsType, sortsBy: sortBy)
          .then((response) {
        if (response!.status == "ok") {
          newsModel = response;
          isload = true;
          update();
        } else {
          isload = false;
          update();
          Get.showSnackbar(
            GetBar(
              icon: Icon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.grey[100],
                size: 18,
              ),
              duration: Duration(seconds: 2),
              message: "Unable to load news!!",
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
