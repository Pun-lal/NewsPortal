import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_portal/controllers/home_screen_controller.dart';
import 'package:news_portal/helpers/SecureStorage.dart';
import 'package:news_portal/widgets/tab_bar_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final List i = ["ff", "ff"];

  @override
  Widget build(BuildContext context) {
    SecureStorage().readKey(key: 'Mode').then((value) {
      if (value == "true") {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.grey[850],
            statusBarIconBrightness: Brightness.light,
          ),
        );

        Get.changeTheme(ThemeData.dark());
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.grey[50],
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        Get.changeTheme(ThemeData(primaryColor: Colors.grey[50]));
      }
    });
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04, vertical: Get.height * 0.005),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          "assests/Images/drawer_background.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Dark & Light",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.6),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Obx(
                              () => Switch(
                                activeColor: Colors.blue.shade100,
                                value: homeScreenController.isDarkMode.value,
                                onChanged: (bool val) {
                                  homeScreenController.doModeChange();
                                  SecureStorage().writeKey(
                                      key: 'Mode', value: val.toString());
                                  SecureStorage().readKey(key: 'Mode').then(
                                    (values) {
                                      if (values == "true") {
                                        SystemChrome.setSystemUIOverlayStyle(
                                          SystemUiOverlayStyle(
                                            statusBarColor: Colors.grey[850],
                                            statusBarIconBrightness:
                                                Brightness.light,
                                          ),
                                        );
                                        Get.changeTheme(ThemeData.dark());
                                      } else {
                                        SystemChrome.setSystemUIOverlayStyle(
                                          SystemUiOverlayStyle(
                                            statusBarColor: Colors.grey[50],
                                            statusBarIconBrightness:
                                                Brightness.dark,
                                          ),
                                        );
                                        Get.changeTheme(ThemeData(
                                            primaryColor: Colors.grey[50]));
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 7,
                            ),
                            child: Text(
                              "Powered by Atish pun",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            child: NestedScrollView(
                headerSliverBuilder: (context, value) => [
                      SliverAppBar(
                        toolbarHeight: Get.height * 0.06,
                        snap: true,
                        pinned: true,
                        floating: true,
                        leading: Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => Scaffold.of(context).openDrawer(),
                              child: Image.asset(
                                "assests/Images/drawer.png",
                                color: Theme.of(context).accentColor,
                                scale: 49,
                              ),
                            );
                          },
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Theme.of(context).accentColor,
                              size: 23,
                            ),
                          ),
                        ],
                        elevation: 0.0,
                        brightness: Brightness.light,
                        centerTitle: true,
                        title: RichText(
                          text: TextSpan(
                            text: "News",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.1,
                                fontFamily: "serif",
                                color: Theme.of(context).accentColor),
                            children: [
                              TextSpan(
                                text: " Portal",
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 14.7),
                              )
                            ],
                          ),
                        ),
                        bottom: TabBar(
                          indicatorWeight: 1.5,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Theme.of(context).accentColor,
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          indicatorColor: Theme.of(context).accentColor,
                          unselectedLabelStyle:
                              TextStyle(fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                          isScrollable: true,
                          tabs: [
                            Tab(text: "Sports"),
                            Tab(text: "Educational"),
                            Tab(text: "Health"),
                            Tab(text: "Society"),
                          ],
                        ),
                      ),
                    ],
                body: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.015,
                      horizontal: Get.width * 0.046),
                  child: TabBarView(
                    children: [
                      TabBarWidgets(newsTypes: "Sports"),
                      TabBarWidgets(newsTypes: "Education"),
                      TabBarWidgets(newsTypes: "Health"),
                      TabBarWidgets(newsTypes: "Society"),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
