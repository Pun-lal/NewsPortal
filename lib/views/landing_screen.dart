import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/controllers/landing_screen_controller.dart';
import 'package:news_portal/helpers/SecureStorage.dart';
import 'package:news_portal/views/home_screen.dart';

class LandingViewScreen extends StatelessWidget {
  LandingViewScreen({Key? key}) : super(key: key);
  final LandingScreenController landingScreenController =
      Get.put(LandingScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              PageView.builder(
                physics: new NeverScrollableScrollPhysics(),
                onPageChanged: landingScreenController.currentIndexPage,
                controller: landingScreenController.pageViewController,
                itemCount: landingScreenController.landingViewModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Container(
                            height: Get.height * 0.4,
                            width: Get.width * 0.6,
                            child: Image.asset(
                              landingScreenController
                                  .landingViewModel[index].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          landingScreenController
                              .landingViewModel[index].title!,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "serif",
                            color: Colors.blue[900],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          landingScreenController
                              .landingViewModel[index].description!,
                          style: TextStyle(fontSize: 14, height: 1.4),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              landingScreenController.landingViewModel.length,
                              (index) => Obx(
                                    () => Container(
                                      margin: EdgeInsets.all(3),
                                      height: landingScreenController
                                                  .currentIndexPage.value ==
                                              index
                                          ? 9
                                          : 7,
                                      width: landingScreenController
                                                  .currentIndexPage.value ==
                                              index
                                          ? 9
                                          : 7,
                                      decoration: BoxDecoration(
                                          color: landingScreenController
                                                      .currentIndexPage.value ==
                                                  index
                                              ? Colors.black
                                              : Colors.grey[500],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  )),
                        ),
                        SizedBox(
                          height: Get.height * 0.15,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: landingScreenController.isPageEnd
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  SecureStorage().writeKey(
                                      key: 'LandingKey', value: "landingPage");

                                  Get.off(HomeScreen());
                                },
                                child: landingScreenController.isPageEnd
                                    ? Visibility(
                                        visible: false, child: Container())
                                    : Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black
                                                    .withOpacity(0.4)),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 2,
                                                      vertical: 8),
                                                  child: Text(
                                                    "Skip now",
                                                    style: TextStyle(
                                                        fontSize: 13.5,
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        letterSpacing: 0.5),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                size: 16,
                                              ),
                                            ]),
                                      ),
                              ),
                              GestureDetector(
                                onTap: landingScreenController.nextPageView,
                                child: Container(
                                  width: landingScreenController.isPageEnd
                                      ? Get.width * 0.7
                                      : 80,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      border:
                                          Border.all(style: BorderStyle.none),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 8),
                                      child: Text(
                                        landingScreenController.isPageEnd
                                            ? "Get Started"
                                            : "Next",
                                        style: TextStyle(
                                            fontSize: 13.5,
                                            color: Colors.white,
                                            letterSpacing: 0.5),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
