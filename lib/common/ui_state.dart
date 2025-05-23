import 'package:news/api/result.dart';

sealed class UiState<T> {}

class SuccessState<T> extends UiState<T> {
  T data;

  SuccessState(this.data);
}

class LoadingState<T> extends UiState<T> {}

class ErrorState<T> extends UiState<T> {
  ServerError? serverError;
  Error? error;

  ErrorState({this.error, this.serverError});
}

class NoDataState<T> extends UiState<T> {}
