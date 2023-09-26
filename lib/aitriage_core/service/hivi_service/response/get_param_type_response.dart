import '../../../entity/param_type.dart';
import '../../../network/common/base_response.dart';

enum ParamTypeGroupType { registerAccountType, registerAccountStatus, gender }

extension ParamTypeGroupTypeX on ParamTypeGroupType {
  String get stringValue => switch (this) {
      ParamTypeGroupType.registerAccountType => 'REGISTER_ACCOUNT_TYPE',
      ParamTypeGroupType.registerAccountStatus => 'REGISTER_ACCOUNT_STATUS',
      ParamTypeGroupType.gender => 'GENDER'
    };

}

class GetParamTypeResponse extends BaseResponse {
  final data = <ParamType>[];

  GetParamTypeResponse.fromJson(dynamic json) : super.fromJson(json) {
    final newList = (json?['data'] as List).map((e) => ParamType.fromJson(e)).toList();
    data.addAll(newList);
  }
}