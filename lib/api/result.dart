sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class ServerError<T> extends Result<T> {
  String code;
  String message;

  ServerError(this.code, this.message);
}

class Error<T> extends Result<T> {
  Exception exception;

  Error(this.exception);
}
