import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/model/model.dart';

class Response {
  String apiKey=dotenv.env['API_KEY']??'NOT FOUND';
  Future<List<Model>> article(String category) async {
    try {
      var response = await Dio().get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category");
//the get لما بترجع بترجع بحجات تانيه كتير غير ال البينات الى عايزها
//عشان كده عملت السطر الى تحت
      Map<String, dynamic> dataResponse = response.data;
      List<dynamic> news = dataResponse['articles'];
      //Map<String.dynamic>      // list<dynamic>
      List<Model> articleNews = [];
      for (var element in news) {
        Model article = Model(
          element['title'] ?? 'No title',
          element['description'] ?? 'No descrption',
          element['author'] ?? 'No author',
          element['publishedAt'] ?? 'No date',
          element['urlToImage'] ??
              "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg",
          element['url'] ?? 'No url',
        );

        articleNews.add(article);
      }
      return articleNews;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
