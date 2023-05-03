abstract class IRepository<T> {
  Future<T> get();
  Future<void> put(T entity);
}
