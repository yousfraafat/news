import 'package:news/api/models/news.dart';
import 'package:news/api/result.dart';
import 'package:news/common/base_view_model.dart';
import 'package:news/common/ui_state.dart';

import '../api/api_manager.dart';

class NewsViewModel extends BaseViewModel<List<News>> {
  NewsViewModel() : super(LoadingState());

  Future<void> getNewsList(String sourceId, String? q) async {
    var result = await ApiManager.getNewsBySourceId(sourceId, query: q);
    switch (result) {
      case Success<List<News>>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<News>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Error<List<News>>():
        {
          emit(ErrorState(error: result));
        }
    }
  }
}
