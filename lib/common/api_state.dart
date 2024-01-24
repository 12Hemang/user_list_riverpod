import 'package:untitled1/common/api_status.dart';

class ApiState<T> {
  T? data;
  String? errorMessage;
  ApiStatus status = ApiStatus.initial;

  init() {
    status = ApiStatus.initial;
  }
  loading() {
    status = ApiStatus.loading;
  }

  success({T? data}) {
    status = ApiStatus.success;
    this.data = data;
  }

  error({String? err}) {
    status = ApiStatus.error;
    this.errorMessage = err;
  }
}
