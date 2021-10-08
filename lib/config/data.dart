import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/models.dart/article_model.dart';

class News{

List<ArticleModel> datatobesavedin = [];

Future<void> getNews() async {
  String url =
      "https://newsapi.org/v2/everything?q=apple&from=2021-10-05&to=2021-10-05&sortBy=popularity&apiKey=3b086e1c3e0646c1b8f0316c40bb9c03";

  var response = await get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  if (jsonData["status"] == "ok") {
    jsonData["articles"].forEach((element) {
      if (element["urlToImage"] != null && element["description"] != null) {
        ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"]);
        datatobesavedin.add(articleModel);
      }
    });
  }
}
}


class CategoryNews{

List<ArticleModel> datatobesavedin = [];

Future<void> getNews() async {
  String url =
      "https://newsapi.org/v2/everything?q=apple&from=2021-10-05&to=2021-10-05&sortBy=popularity&apiKey=3b086e1c3e0646c1b8f0316c40bb9c03";

  var response = await get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  if (jsonData["status"] == "ok") {
    jsonData["articles"].forEach((element) {
      if (element["urlToImage"] != null && element["description"] != null) {
        ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"]);
        datatobesavedin.add(articleModel);
      }
    });
  }
}
}
