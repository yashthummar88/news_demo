import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_demo/NewsMOdel.dart';

Future<NewsModel?> callApiForNews() async {
  NewsModel? data;
  Dio dio = new Dio();
  dio.options.headers["Content-Type"] = "multipart/form-data";
  dio.options.headers["Cookie"] = "PHPSESSID=bkvkbqr2kphppo4n2u4efvrt05";
  Map<String, dynamic> dict = {};

  FormData formData = new FormData.fromMap(dict);
  Response response = await dio
      .get(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-03-09&sortBy=publishedAt&apiKey=073bb9dc479c4c30abe4042aa33fea27',
      )
      .catchError((e) => print(e));
  NewsModel res = NewsModel.fromJson(response.data);

  return res;
}
