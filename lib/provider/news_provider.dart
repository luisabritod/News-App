import 'package:bookmark/models/models.dart';
import 'package:bookmark/services/services.dart';
import 'package:flutter/cupertino.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newList = [];

  List<NewsModel> get getNewsList => newList;

  Future<List<NewsModel>> fetchAllNews(
      {required int page, required String sortBy}) async {
    newList = await NewsApiServices.getAllNews(page: page, sortBy: sortBy);
    return newList;
  }

  NewsModel findByDate({required String publishedAt}) {
    return newList.firstWhere((element) => element.publishedAt == publishedAt);
  }
}
