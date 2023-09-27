import 'package:flutter_aitriage/aitriage_core/network/common/base_response.dart';

class UploadImageResponse extends BaseResponse {
  final String data;

  UploadImageResponse.fromJson(dynamic json)
      : data = ((json?['data']?['success']) as List).first?['url'],
        super.fromJson(json);
}