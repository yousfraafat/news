import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/responses/NewsResponse.dart';
import 'package:news/api/responses/sources_response.dart';

class EndPoints {
  static const String sources = 'v2/top-headlines/sources';
  static const String headLines = 'v2/top-headlines';
}

class ApiManager {
  static const String apiKay = 'e50ee2d5f56649348ab0d7b005b9158a';
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse?> getSourcesByCategoryId(String catId) async {
    var params = {'apiKey': apiKay, 'category': catId};
    var url = Uri.https(baseUrl, EndPoints.sources, params);
    var response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = await jsonDecode(response.body);
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }
    return null;
  }

  static Future<NewsResponse?> getNewsBySourceId(
    String sourceId, {
    String? query,
  }) async {
    var params = {'apiKey': apiKay, 'sources': sourceId, 'q': query ?? ''};
    var url = Uri.https(baseUrl, EndPoints.headLines, params);
    var response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = await jsonDecode(response.body);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }
    return null;
  }
}
