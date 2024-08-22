abstract class BaseUsecase<T, Params> {
  Future<T> call(Params params);
}

abstract class UseCaseNoParam<T> {
  Future<T> call();
}
