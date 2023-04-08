import 'package:dio/dio.dart';

// we’ve two different states, one when we get a successful response (DataSuccess), and the other is used when an error occurs while sending the request or receiving the response (DataFailed).
abstract class DataState<T> {
  final T? data;
  final DioError? error;
  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);
}
