import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/api/models/Source.dart';

class NewsViewModel extends ChangeNotifier {
  List<Source>? sources;
  String? message = 'something went wrong';
  bool isLoading = false;

  Future<void> getSourceList(String catId) async {
    var result = await ApiManager.getSourcesByCategoryId(catId);
    if (result?.status == 'ok') {
      sources = result?.sources ?? [];
    } else {
      message = result?.message;
    }
  }
}
