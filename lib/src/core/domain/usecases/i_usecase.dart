abstract class IUsecase<Output, Input> {
  Future<Output> call(Input params);
}

class NoParams {}
