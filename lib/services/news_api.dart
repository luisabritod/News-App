import 'dart:convert';
import 'package:bookmark/consts/consts.dart';
import 'package:bookmark/models/models.dart';
import 'package:http/http.dart' as http;

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews(
      {required int page, required String sortBy}) async {
    // var url = Uri.parse(
    //     "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ff9e8d6f4dbf4324bbdd2c6e3f41fd83");
    var uri = Uri.https(
      BASEURL,
      "v2/everything",
      {
        "q": "bitcoin",
        "pageSize": "20",
        "page": page.toString(),
        "sortBy": sortBy,
        // "domains": "bbc.co.uk,teccrunch.com,engadget.com"
        // "domains": "teccrunch.com",
        // "apiKey": API_KEY,
      },
    );
    var response = await http.get(
      uri,
      headers: {
        "X-Api-Key": API_KEY,
      },
    );
    // print('response body:${response.body}');
    // var response = await http.get(url);
    Map data = jsonDecode(response.body);
    List newsTempList = [];
    for (var v in data["articles"]) {
      newsTempList.add(v);
      // newsTempList.add(NewsModel.fromJson(v));
      // print(v.length.toString());
    }
    return NewsModel.newsFromSnapshot(newsTempList);
  }

  static Future<List<NewsModel>> searchNews({required String query}) async {
    var uri = Uri.https(
      BASEURL,
      "v2/everything",
      {
        "q": query,
        "pageSize": "20",
        "domains": "teccrunch.com",
      },
    );
    var response = await http.get(
      uri,
      headers: {
        "X-Api-Key": API_KEY,
      },
    );
    // print('response body:${response.body}');
    // var response = await http.get(url);
    Map data = jsonDecode(response.body);
    List newsTempList = [];
    for (var v in data["articles"]) {
      newsTempList.add(v);
      // newsTempList.add(NewsModel.fromJson(v));
      // print(v.length.toString());
    }
    return NewsModel.newsFromSnapshot(newsTempList);
  }
}
