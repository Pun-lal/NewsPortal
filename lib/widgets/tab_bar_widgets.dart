import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isOdd ? 3 : 2.7),
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  crossAxisCount: 4,
                  itemCount: controller.newsModel.articles!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              height: Get.height * 0.21,
                              width: Get.width * 0.38,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: homeScreenController.newsModel
                                          .articles![index].urlToImage ??
                                      "https://static.thenounproject.com/png/340719-200.png",
                                  placeholder: (context, url) => Center(
                                    child: Container(
                                      height: 22,
                                      width: 22,
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
                            Container(
                              width: Get.width * 0.4,
                              child: Text(
                                homeScreenController
                                        .newsModel.articles![index].title ??
                                    "Title not available",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  letterSpacing: 0.3,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
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
