import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}

extension DataStateMapX<T> on DataState<T> {
  DataState<R> map<R>(R Function(T value) convert) {
    if (this is DataSuccess<T>) {
      final T data = (this as DataSuccess<T>).data as T;
      return DataSuccess<R>(convert(data));
    } else if (this is DataFailed<T>) {
      return DataFailed<R>((this as DataFailed<T>).error as DioException);
    }
    return DataFailed<R>(
      DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Unknown state',
      ),
    );
  }
}
