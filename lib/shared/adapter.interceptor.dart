import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AdapterInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions opt, RequestInterceptorHandler handler) {
    _logger.i('REQ[${opt.method}]::PATH: ${opt.path}\nHEADERS[${opt.headers}]');
    if (opt.method == 'POST') {
      _logger.d(opt.data);
    }

    return super.onRequest(opt, handler);
  }

  @override
  void onResponse(Response res, ResponseInterceptorHandler handler) {
    // ignore: avoid_dynamic_calls
    _logger.i('RES[${res.statusCode}]::PATH: ${res.requestOptions.path}\n$res');

    return super.onResponse(res, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // ignore: avoid_dynamic_calls
    _logger.e(
        'ERROR[${err.response?.statusCode}]::PATH: ${err.requestOptions.path}');

    return super.onError(err, handler);
  }
}
