import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_demo/Constants/sizeConstant.dart';
import 'package:test_demo/Constants/utils.dart';
import 'package:test_demo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('News '),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Container(
          height: MySize.screenHeight,
          width: MySize.screenWidth,
          child: (controller.hasData.value)
              ? (!isNullEmptyOrFalse(controller.articleList))
                  ? ListView.builder(
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MySize.getScaledSizeWidth(15),
                            vertical: MySize.size10!,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.NEWS_DETAIL, arguments: {
                                "newsData": controller.articleList![i],
                              });
                            },
                            child: Card(
                              elevation: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MySize.getScaledSizeWidth(10),
                                    vertical: MySize.size10!),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MySize.size10,
                                    ),
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size6!),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .articleList![i].urlToImage
                                            .toString(),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: MySize.size70,
                                          width: MySize.size100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            Container(
                                          height: MySize.size70,
                                          width: MySize.size100,
                                          child: Center(
                                              child: SpinKitFadingCircle(
                                            color: Colors.purple,
                                            size: 20.0,
                                          )),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                                height: MySize.size70,
                                                width: MySize.size100,
                                                child: Icon(Icons.error)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: MySize.getScaledSizeWidth(10),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Title : ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: MySize.size16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  controller
                                                      .articleList![i].title
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: MySize.size14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                MySize.getScaledSizeHeight(10),
                                          ),
                                          getTitleWithData(
                                              title: "Date : ",
                                              data: DateFormat('dd-MM-yyyy')
                                                  .format(getDateFromString(
                                                      controller.articleList![i]
                                                          .publishedAt
                                                          .toString()))),
                                          SizedBox(
                                            height:
                                                MySize.getScaledSizeHeight(10),
                                          ),
                                          getTitleWithData(
                                              title: "Description : ",
                                              data: controller
                                                  .articleList![i].description
                                                  .toString()),
                                          SizedBox(
                                            height:
                                                MySize.getScaledSizeHeight(10),
                                          ),
                                          getTitleWithData(
                                              title: "Author : ",
                                              data: (isNullEmptyOrFalse(
                                                      controller.articleList![i]
                                                          .author))
                                                  ? "N/A"
                                                  : controller
                                                      .articleList![i].author
                                                      .toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: controller.articleList?.length,
                    )
                  : Center(
                      child: Text("No Any News are there"),
                    )
              : Center(
                  child: SpinKitFadingCircle(
                    color: Colors.purple,
                    size: 50.0,
                  ),
                ),
        ),
      );
    });
  }

  Widget getTitleWithData({
    String? title,
    String? data,
    int? maxline = 2,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: MySize.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MySize.getScaledSizeHeight(3),
              ),
              Text(
                data!,
                maxLines: maxline,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MySize.size14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
