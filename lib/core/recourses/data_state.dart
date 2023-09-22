

abstract class DataState<T> {
  final T? data;
  final Exception? error;

  const DataState({this.data, this.error});
}

class DateSuccess<T> extends DataState<T> {
  const DateSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(Exception error) : super(error: error);
}
