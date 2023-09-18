import 'package:flutter_aitriage/aitriage_core/local_storage/flutter_secured_storage/response/active_user_info_use_case.dart';
import 'package:get/get_connect.dart';
import '../../common/app_error.dart';
import '../common/base_response.dart';
import '../logging/logging.dart';

class GetConnectBaseProvider extends GetConnect with ShowLog {
  final String url;
  final String apiVersion;
  final String apiPrefix;

  GetConnectBaseProvider({
    required this.url,
    this.apiVersion = '',
    this.apiPrefix = ''
  }) {
    timeout = const Duration(seconds: 15);
    allowAutoSignedCert = true;
    httpClient.baseUrl = '$url$apiPrefix$apiVersion';
    httpClient.errorSafety = true;

    // thứ tự các callback
    // authenticator -> requestModifier -> responseModifier

    httpClient.addAuthenticator<dynamic>((request) async {
      final accessToken = await ActiveUserInformationUseCase.accessToken.getData();

      if (accessToken.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $accessToken';
      }

      return request;
    });

    httpClient.addRequestModifier<void>((request) async {
      return request;
    });

    // interceptor -> refresh token
    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }

  T convertResponse<T extends BaseResponse>(Response response, T Function(dynamic) converter) {
    showResponse(response.request!.url.toString(), response.body);

    if (response.isOk) {
      return converter.call(response.body);
    } else {
      throw AppError(
        errorType: AppErrorType.networkError,
        statusCode: response.statusCode ?? 0,
        message: response.body?['message'] ?? 'Empty message',
        statusMessage: response.body?['status'] ?? 'Empty message',
        body: response.body,
      );
    }
  }

  @override
  Future<Response<T>> get<T>(
      String url, {
        Map<String, String>? headers,
        String? contentType,
        Map<String, dynamic>? query,
        Decoder<T>? decoder
      }) {
    showRequest('${httpClient.baseUrl}$url${queryToString(query)}', null);
    return super.get(
        url,
        headers: headers,
        contentType:
        contentType,
        query: query,
        decoder: decoder
    );
  }

  @override
  Future<Response<T>> post<T>(
      String? url,
      body, {
        String? contentType,
        Map<String, String>? headers,
        Map<String, dynamic>? query,
        Decoder<T>? decoder,
        Progress? uploadProgress
      }) {
    showRequest('${httpClient.baseUrl}$url${queryToString(query)}', body);
    return super.post(
        url,
        body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress
    );
  }

  @override
  Future<Response<T>> put<T>(
      String url,
      body, {
        String? contentType,
        Map<String, String>? headers,
        Map<String, dynamic>? query,
        Decoder<T>? decoder,
        Progress? uploadProgress
      }) {
    showRequest('${httpClient.baseUrl}$url${queryToString(query)}', body);
    return super.put(
        url, body,
        contentType: contentType,
        headers: headers,
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress
    );
  }
}