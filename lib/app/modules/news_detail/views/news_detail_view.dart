import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_demo/Constants/sizeConstant.dart';

import '../../../../Constants/utils.dart';
import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetWidget<NewsDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                String line1 = "News" + "\n";
                String line2 =
                    (isNullEmptyOrFalse(controller.articleModel!.title)
                            ? "-"
                            : controller.articleModel!.title.toString()) +
                        "\n\n";
                String line3 = "News Link:" +
                    (isNullEmptyOrFalse(controller.articleModel!.url)
                        ? "-"
                        : controller.articleModel!.url.toString()) +
                    "\n\n";
                String line4 = "News Img:" +
                    (isNullEmptyOrFalse(controller.articleModel!.urlToImage)
                        ? "-"
                        : controller.articleModel!.urlToImage.toString()) +
                    "\n\n";
                String msg = line1 + line2 + line3 + line4;
                Share.share(msg);
              },
              icon: Icon(Icons.share)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MySize.getScaledSizeWidth(15),
            vertical: MySize.getScaledSizeHeight(15)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(MySize.size6!),
                child: CachedNetworkImage(
                  imageUrl: controller.articleModel!.urlToImage.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    height: MySize.size300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: MySize.size300,
                    child: Center(
                        child: SpinKitFadingCircle(
                      color: Colors.purple,
                      size: 30.0,
                    )),
                  ),
                  errorWidget: (context, url, error) => Container(
                      height: MySize.size300, child: Icon(Icons.error)),
                ),
              ),
              SizedBox(
                height: MySize.size20,
              ),
              getTitleWithData(
                  title: "Title :",
                  data: controller.articleModel!.title.toString()),
              SizedBox(
                height: MySize.size10,
              ),
              getTitleWithData(
                  title: "Author :",
                  data: (isNullEmptyOrFalse(controller.articleModel!.author))
                      ? "N/A"
                      : controller.articleModel!.author.toString()),
              SizedBox(
                height: MySize.size10,
              ),
              getTitleWithData(
                  title: "Publish Date :",
                  data: DateFormat('dd-MM-yyyy').format(getDateFromString(
                      controller.articleModel!.publishedAt.toString()))),
              SizedBox(
                height: MySize.size10,
              ),
              getTitleWithData(
                  title: "Description :",
                  data: controller.articleModel!.description.toString()),
              SizedBox(
                height: MySize.size10,
              ),
              getTitleWithData(
                  title: "Content :",
                  data: controller.articleModel!.content.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTitleWithData({
    String? title,
    String? data,
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
              decoration: TextDecoration.underline),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MySize.getScaledSizeHeight(3),
              ),
              Text(
                " " + data!,
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
