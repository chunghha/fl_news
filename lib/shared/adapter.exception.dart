import 'package:dio/dio.dart';

class AdapterException implements Exception {
  AdapterException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request to API cancelled';
        break;
      case DioErrorType.connectionTimeout:
        message = 'Connection timeout with API';
        break;
      case DioErrorType.connectionError:
        message = 'Connection failed';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection with API';
        break;
      case DioErrorType.badResponse:
        message = _handleError(dioError.response?.statusCode);
        break;
      case DioErrorType.sendTimeout:
        message = 'Send timeout in connection with API';
        break;
      case DioErrorType.unknown:
      default:
        message = 'Dio Unknown exception occurred';
        break;
    }
    message += ':\n  $dioError';
  }

  late String message;

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'Requested resource not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Unexpected runtime error';
    }
  }

  @override
  String toString() => message;
}
