import 'package:news/api/api_manager.dart';
import 'package:news/api/models/Source.dart';
import 'package:news/api/result.dart';
import 'package:news/common/base_view_model.dart';
import 'package:news/common/ui_state.dart';

class SourcesViewModel extends BaseViewModel<List<Source>> {
  SourcesViewModel() : super(LoadingState());

  Future<void> getSourceList(String catId) async {
    var result = await ApiManager.getSourcesByCategoryId(catId);
    switch (result) {
      case Success<List<Source>>():
        {
          emit(SuccessState(result.data));
        }
      case ServerError<List<Source>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Error<List<Source>>():
        {
          emit(ErrorState(error: result));
        }
    }
  }
}
