// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/config/data.dart';
import 'package:newsapp/models.dart/article_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // getNews() async {
  //   var newnews = [];
  //   var response = await http.get(Uri.https("newsapi.org/",
  //       "v2/top-headlines?sources=techcrunch&apiKey=3b086e1c3e0646c1b8f0316c40bb9c03"));
  //   var jsonData = jsonDecode(response.body);
  //   for (var i in jsonData) {
  //     NewsModel news = NewsModel(i["title"], i["urlToImage"], i["description"]);
  //     newnews.add(news);
  //   }
  // }
  // final String imageUrl;
  // final String title;
  // final String desc;
  // BlogTile(
  //     {@required this.imageUrl, @required this.title, @required this.desc});

  List<ArticleModel> newsModelList = <ArticleModel>[];

  List<String> categories = [
    "Latest News",
    "Health",
    "Sports",
    "International",
    "Pakistan"
  ];
  TextEditingController searchController = TextEditingController();
  // bool isLoading = true;
  // getNewsByQuery(String query) async {
  //   String url =
  //       "https://newsapi.org/v2/everything?q=apple&from=2021-10-05&to=2021-10-05&sortBy=popularity&apiKey=3b086e1c3e0646c1b8f0316c40bb9c03";

  //   Response response = await get(Uri.parse(url));
  //   Map data = jsonDecode(response.body);
  //   setState(() {
  //     data["articles"].forEach((element) {
  //       ArticleModel articleModel =new ArticleModel();
  //       articleModel = ArticleModel.fromMap(element);
  //       newsModelList.add(articleModel);
  //       setState(() {
  //         isLoading = false;
  //       });
  //     });
  //   });
  // }

  List<ArticleModel> articles = <ArticleModel>[];
  getNews() async {
    News newsData = News();
    await newsData.getNews();
    articles = newsData.datatobesavedin;

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pak News"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(2, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search for news"),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(categories[index]);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.amber),
                        child: Center(
                            child: Text(
                          categories[index],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    );
                  }),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 20, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Latest News",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        newsModelList[index].urlToImage)),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black12.withOpacity(0),
                                                Colors.black
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            )),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 10, 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              newsModelList[index].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              newsModelList[index]
                                                          .description
                                                          .length >
                                                      50
                                                  ? "${newsModelList[index].description.substring(0, 55)}..."
                                                  : newsModelList[index]
                                                      .description,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        )))
                              ],
                            ),
                          ));
                        })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Show More"))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// // class Category extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
      
// //     );
// //   }
// // }
// Widget CategoryCard(imageUrl, title){
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(6)
//     ),
//     child: Stack(
//       children: [
//         Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover,),
//         Container(
//           alignment:Alignment.center,
//           child: Text(title),
//         )
//       ],
//     ),
//   );
// }