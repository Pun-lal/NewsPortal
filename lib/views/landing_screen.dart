import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/controllers/landing_screen_controller.dart';
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
                  onPageChanged: landingScreenController.currentIndexPage,
                  controller: landingScreenController.pageViewController,
                  itemCount: landingScreenController.landingViewModel.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                fontSize: 16.6,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.3),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.0),
                            child: Text(
                              landingScreenController
                                  .landingViewModel[index].description!,
                              style: TextStyle(fontSize: 14, height: 1.4),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: Get.height * 0.04),
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
                                                        .currentIndexPage
                                                        .value ==
                                                    index
                                                ? Colors.black
                                                : Colors.grey[500],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    );
                  }),
              Obx(() => Container(
                    child: landingScreenController.currentIndexPage.value !=
                            landingScreenController.landingViewModel.length - 1
                        ? Positioned(
                            bottom: 50,
                            left: 45,
                            child: GestureDetector(
                              onTap: () => Get.off(HomeScreen()),
                              child: Container(
                                width: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.black.withOpacity(0.4)),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 6.5),
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
                                        color: Colors.black.withOpacity(0.6),
                                        size: 16,
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        : Visibility(visible: false, child: Container()),
                  )),
              Positioned(
                bottom: 50,
                right: 45,
                child: GestureDetector(
                    onTap: landingScreenController.nextPageView,
                    child: Obx(
                      () => Container(
                        width: landingScreenController.isPageEnd
                            ? Get.width * 0.72
                            : 75,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            border: Border.all(style: BorderStyle.none),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 8,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                            padding: const EdgeInsets.all(6.5),
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
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
