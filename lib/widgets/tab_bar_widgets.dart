import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/controllers/home_screen_controller.dart';

class TabBarWidgets extends StatelessWidget {
  TabBarWidgets({Key? key, this.newsTypes}) : super(key: key);
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final String? newsTypes;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        homeScreenController.getNews(newsType: newsTypes);
        return homeScreenController.isload == false
            ? Center(
                child: Container(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              )
            : Container(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.71,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.newsModel.articles!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        width: 111,
                        margin: EdgeInsets.only(right: 8),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              height: 136,
                              width: 97,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: homeScreenController.newsModel
                                          .articles![index].urlToImage ??
                                      "https://static.thenounproject.com/png/340719-200.png",
                                  placeholder: (context, url) => Center(
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.4,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    child: Icon(
                                      Icons.error,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              homeScreenController
                                  .newsModel.articles![index].title
                                  .toString(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
