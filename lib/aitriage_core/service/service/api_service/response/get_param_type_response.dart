import '../../../../network/common/base_response.dart';
import '../../../entity/param_type.dart';

enum ParamTypeGroupType { registerAccountType, registerAccountStatus, gender }

extension ParamTypeGroupTypeX on ParamTypeGroupType {
  String get stringValue {
    switch (this) {
      case ParamTypeGroupType.registerAccountType:
        return 'REGISTER_ACCOUNT_TYPE';
      case ParamTypeGroupType.registerAccountStatus:
        return 'REGISTER_ACCOUNT_STATUS';
      case ParamTypeGroupType.gender:
        return 'GENDER';
    }
  }
}

class GetParamTypeResponse extends BaseResponse {
  final data = <ParamType>[];

  GetParamTypeResponse.fromJson(dynamic json) : super.fromJson(json) {
    final newList = (json?['data'] as List).map((e) => ParamType.fromJson(e)).toList();
    data.addAll(newList);
  }
}