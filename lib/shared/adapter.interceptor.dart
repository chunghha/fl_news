import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AdapterInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i(
      // ignore: lines_longer_than_80_chars
      'REQ[${options.method}]::PATH: ${options.path}\nHEADERS[${options.headers}]',
    );
    if (options.method == 'POST') {
      _logger.d(options.data);
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: avoid_dynamic_calls,
    _logger.i(
      // ignore: lines_longer_than_80_chars
      'RES[${response.statusCode}]::PATH: ${response.requestOptions.path}\n$response',
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // ignore: avoid_dynamic_calls
    _logger.e(
      'ERROR[${err.response?.statusCode}]::PATH: ${err.requestOptions.path}',
    );

    return super.onError(err, handler);
  }
}
