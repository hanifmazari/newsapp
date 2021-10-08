class ArticleModel {
  // late String author;
  String title;
  String description;
  String url;
  String urlToImage;

  ArticleModel(
      {
        // this.author = "author",
      this.title = "title",
      this.description = "description",
      this.urlToImage = "urlToImage",
      this.url = "url"
      }
  );

  // factory ArticleModel.fromMap(Map news) {
  //   return ArticleModel(
  //     // author: news["author"],
  //     title: news["title"],
  //     description: news["description"],
  //     urlToImage: news["urlToImage"],
  //     url: news["url"]
  //   );
  // }
}
