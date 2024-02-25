enum StatusCode {
  operationSucceeded,
  operationFailed,
  unAuthorized,
  forbidden,
  serverError,
}

extension StatusCodeExt on StatusCode {
  int get code {
    switch (this) {
      case StatusCode.operationSucceeded:
        return 200;
      case StatusCode.operationFailed:
        return 400;
      case StatusCode.unAuthorized:
        return 401;
      case StatusCode.forbidden:
        return 403;
      case StatusCode.serverError:
        return 500;
    }
  }
}
