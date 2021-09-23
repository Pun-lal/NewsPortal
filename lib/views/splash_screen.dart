import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_portal/controllers/splash_screen_controller.dart';
import 'package:news_portal/helpers/SecureStorage.dart';
import 'package:news_portal/views/home_screen.dart';
import 'package:news_portal/views/landing_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey[50],
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => AnimatedOpacity(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.35,
                          ),
                          Image.asset(
                            "assests/Images/splash_image_news.png",
                            height: Get.height * 0.13,
                          ),
                          SizedBox(
                            height: Get.height * 0.4,
                          ),
                          Text("Read and enjoy the news",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontFamily:
                                      GoogleFonts.notoSans().fontFamily)),
                        ],
                      ),
                      opacity:
                          splashScreenController.opacity.value == true ? 1 : 0,
                      duration: Duration(seconds: 3),
                      onEnd: () {
                        SecureStorage()
                            .readKey(key: 'LandingKey')
                            .then((value) {
                          if (value == null) {
                            Get.off(() => LandingViewScreen());
                          } else {
                            Get.off(() => HomeScreen());
                          }
                        });
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
