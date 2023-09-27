import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/network/provider/dio_base_provider.dart';
import 'package:flutter_aitriage/aitriage_core/util/file_picker/file_picker.dart';
import '../response/upload_image_response.dart';

class UploadImageUseCase {
  final _provider = DioBaseProvider(url: AppEnvironment.baseUrl);

  Future<UploadImageResponse> execute() async {
    final image = await FilePickerUtil.pickImage();
    final file = File(image!.path);
    final multipartFile = MultipartFile.fromBytes(
        await file.readAsBytes(),
        filename: image.name
    );
    final formData = FormData.fromMap({
      'folderPath': 'patient/avatar',
      'fileName': image.name,
      'files': multipartFile
    });
    final resp = await _provider.post('/upload/v1/file/custom', data: formData);
    return _provider.convertResponse(resp, (json) => UploadImageResponse.fromJson(json));
  }
}

