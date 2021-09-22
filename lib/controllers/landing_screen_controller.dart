import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_portal/model/landing_model.dart';
import 'package:news_portal/views/home_screen.dart';

class LandingScreenController extends GetxController {
  var currentIndexPage = 0.obs;
  var pageViewController = PageController();
  bool get isPageEnd => currentIndexPage.value == landingViewModel.length - 1;

  List<LandingViewModel> landingViewModel = [
    LandingViewModel(
        heading: "Hello,\nWelcome to News portal",
        image: "assests/Images/1_landing_image.png",
        title: "Watch latest News",
        description:
            "Now you can watch various types of news related to different sectors"),
    LandingViewModel(
        image: "assests/Images/2_landing_image.png",
        title: "Get updated News",
        description:
            "Easily get updated throughout the world using this news portal"),
    LandingViewModel(
        image: "assests/Images/3_landing_image.png",
        title: "Search for popular News",
        description:
            "You can search various interesting news through anywhere and anytime"),
  ];

  nextPageView() {
    if (isPageEnd) {
      Get.off(() => HomeScreen());
    } else {
      pageViewController.nextPage(
          duration: Duration(microseconds: 700), curve: Curves.easeOut);
    }
  }
}
