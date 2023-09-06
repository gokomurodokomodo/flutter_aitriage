class ParamType {
  final String? groupType;
  final String? type;
  final String? key;
  final String? value;
  final String? description;
  final String? mediaUrl;
  final int? position;
  final String? scope;

  ParamType.fromJson(dynamic json)
      : groupType = json?['groupType'],
        type = json?['type'],
        key = json?['key'],
        value = json?['value'],
        description = json?['description'],
        mediaUrl = json?['mediaUrl'],
        position = json?['position'],
        scope = json?['scope'];
}