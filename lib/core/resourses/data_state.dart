import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataField<T> extends DataState<T> {
  DataField(DioException exception) : super(exception: exception);
}
