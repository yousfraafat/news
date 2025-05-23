import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/models/Source.dart';
import 'package:news/api/models/news.dart';
import 'package:news/api/responses/NewsResponse.dart';
import 'package:news/api/responses/sources_response.dart';
import 'package:news/api/result.dart';

class EndPoints {
  static const String sources = 'v2/top-headlines/sources';
  static const String headLines = 'v2/top-headlines';
}

class ApiManager {
  static const String apiKay = 'e50ee2d5f56649348ab0d7b005b9158a';
  static const String baseUrl = 'newsapi.org';

  static Future<Result<List<Source>>> getSourcesByCategoryId(
    String catId,
  ) async {
    var params = {'apiKey': apiKay, 'category': catId};
    var url = Uri.https(baseUrl, EndPoints.sources, params);
    try {
      var response = await http.get(url);
      var json = await jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(sourcesResponse.sources ?? []);
      } else {
        return ServerError(
          sourcesResponse.code ?? '',
          sourcesResponse.message ?? '',
        );
      }
    } on Exception catch (e) {
      return Error(e);
    }
  }

  static Future<Result<List<News>>> getNewsBySourceId(
    String sourceId, {
    String? query,
  }) async {
    var params = {'apiKey': apiKay, 'sources': sourceId, 'q': query ?? ''};
    var url = Uri.https(baseUrl, EndPoints.headLines, params);
    try {
      var response = await http.get(url);
      var json = await jsonDecode(response.body);
      var newsResponse = NewsResponse.fromJson(json);
      if (newsResponse.status == 'ok') {
        return Success(newsResponse.articles ?? []);
      } else {
        return ServerError(newsResponse.code ?? '', newsResponse.message ?? '');
      }
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
