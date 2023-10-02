// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_param.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSystemParamCollection on Isar {
  IsarCollection<SystemParam> get systemParams => this.collection();
}

const SystemParamSchema = CollectionSchema(
  name: r'SystemParam',
  id: -8904169132594896204,
  properties: {
    r'systemAppBackgroundColor': PropertySchema(
      id: 0,
      name: r'systemAppBackgroundColor',
      type: IsarType.string,
    ),
    r'systemAppBaseUrl': PropertySchema(
      id: 1,
      name: r'systemAppBaseUrl',
      type: IsarType.string,
    ),
    r'systemAppColor': PropertySchema(
      id: 2,
      name: r'systemAppColor',
      type: IsarType.string,
    ),
    r'systemAppEmailMarketing': PropertySchema(
      id: 3,
      name: r'systemAppEmailMarketing',
      type: IsarType.string,
    ),
    r'systemAppEmailSupport': PropertySchema(
      id: 4,
      name: r'systemAppEmailSupport',
      type: IsarType.string,
    ),
    r'systemAppName': PropertySchema(
      id: 5,
      name: r'systemAppName',
      type: IsarType.string,
    ),
    r'systemPathFileCity': PropertySchema(
      id: 6,
      name: r'systemPathFileCity',
      type: IsarType.string,
    ),
    r'systemPathFileCountries': PropertySchema(
      id: 7,
      name: r'systemPathFileCountries',
      type: IsarType.string,
    ),
    r'systemPathFileStates': PropertySchema(
      id: 8,
      name: r'systemPathFileStates',
      type: IsarType.string,
    ),
    r'systemUrlPrivacyPolicy': PropertySchema(
      id: 9,
      name: r'systemUrlPrivacyPolicy',
      type: IsarType.string,
    ),
    r'systemUrlTerms': PropertySchema(
      id: 10,
      name: r'systemUrlTerms',
      type: IsarType.string,
    ),
    r'trialTime': PropertySchema(
      id: 11,
      name: r'trialTime',
      type: IsarType.string,
    )
  },
  estimateSize: _systemParamEstimateSize,
  serialize: _systemParamSerialize,
  deserialize: _systemParamDeserialize,
  deserializeProp: _systemParamDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _systemParamGetId,
  getLinks: _systemParamGetLinks,
  attach: _systemParamAttach,
  version: '3.1.0+1',
);

int _systemParamEstimateSize(
  SystemParam object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.systemAppBackgroundColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemAppBaseUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemAppColor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemAppEmailMarketing;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemAppEmailSupport;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemAppName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemPathFileCity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemPathFileCountries;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemPathFileStates;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemUrlPrivacyPolicy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.systemUrlTerms;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.trialTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _systemParamSerialize(
  SystemParam object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.systemAppBackgroundColor);
  writer.writeString(offsets[1], object.systemAppBaseUrl);
  writer.writeString(offsets[2], object.systemAppColor);
  writer.writeString(offsets[3], object.systemAppEmailMarketing);
  writer.writeString(offsets[4], object.systemAppEmailSupport);
  writer.writeString(offsets[5], object.systemAppName);
  writer.writeString(offsets[6], object.systemPathFileCity);
  writer.writeString(offsets[7], object.systemPathFileCountries);
  writer.writeString(offsets[8], object.systemPathFileStates);
  writer.writeString(offsets[9], object.systemUrlPrivacyPolicy);
  writer.writeString(offsets[10], object.systemUrlTerms);
  writer.writeString(offsets[11], object.trialTime);
}

SystemParam _systemParamDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SystemParam(
    id,
    reader.readStringOrNull(offsets[7]),
    reader.readStringOrNull(offsets[1]),
    reader.readStringOrNull(offsets[2]),
    reader.readStringOrNull(offsets[3]),
    reader.readStringOrNull(offsets[9]),
    reader.readStringOrNull(offsets[5]),
    reader.readStringOrNull(offsets[11]),
    reader.readStringOrNull(offsets[0]),
    reader.readStringOrNull(offsets[4]),
    reader.readStringOrNull(offsets[10]),
    reader.readStringOrNull(offsets[6]),
    reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _systemParamDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _systemParamGetId(SystemParam object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _systemParamGetLinks(SystemParam object) {
  return [];
}

void _systemParamAttach(
    IsarCollection<dynamic> col, Id id, SystemParam object) {
  object.isarId = id;
}

extension SystemParamQueryWhereSort
    on QueryBuilder<SystemParam, SystemParam, QWhere> {
  QueryBuilder<SystemParam, SystemParam, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SystemParamQueryWhere
    on QueryBuilder<SystemParam, SystemParam, QWhereClause> {
  QueryBuilder<SystemParam, SystemParam, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SystemParamQueryFilter
    on QueryBuilder<SystemParam, SystemParam, QFilterCondition> {
  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppBackgroundColor',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppBackgroundColor',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppBackgroundColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppBackgroundColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppBackgroundColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppBackgroundColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBackgroundColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppBackgroundColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppBaseUrl',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppBaseUrl',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppBaseUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppBaseUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppBaseUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppBaseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppBaseUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppBaseUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppColor',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppColor',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppEmailMarketing',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppEmailMarketing',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppEmailMarketing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppEmailMarketing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppEmailMarketing',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppEmailMarketing',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailMarketingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppEmailMarketing',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppEmailSupport',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppEmailSupport',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppEmailSupport',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppEmailSupport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppEmailSupport',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppEmailSupport',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppEmailSupportIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppEmailSupport',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemAppName',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemAppName',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemAppName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemAppName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemAppName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemAppName',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemAppNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemAppName',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemPathFileCity',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemPathFileCity',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemPathFileCity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemPathFileCity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemPathFileCity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileCity',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemPathFileCity',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemPathFileCountries',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemPathFileCountries',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemPathFileCountries',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemPathFileCountries',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemPathFileCountries',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileCountries',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileCountriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemPathFileCountries',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemPathFileStates',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemPathFileStates',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemPathFileStates',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemPathFileStates',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemPathFileStates',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemPathFileStates',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemPathFileStatesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemPathFileStates',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemUrlPrivacyPolicy',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemUrlPrivacyPolicy',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemUrlPrivacyPolicy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemUrlPrivacyPolicy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemUrlPrivacyPolicy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemUrlPrivacyPolicy',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlPrivacyPolicyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemUrlPrivacyPolicy',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemUrlTerms',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemUrlTerms',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemUrlTerms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'systemUrlTerms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'systemUrlTerms',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemUrlTerms',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      systemUrlTermsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'systemUrlTerms',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trialTime',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trialTime',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trialTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trialTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trialTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trialTime',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterFilterCondition>
      trialTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trialTime',
        value: '',
      ));
    });
  }
}

extension SystemParamQueryObject
    on QueryBuilder<SystemParam, SystemParam, QFilterCondition> {}

extension SystemParamQueryLinks
    on QueryBuilder<SystemParam, SystemParam, QFilterCondition> {}

extension SystemParamQuerySortBy
    on QueryBuilder<SystemParam, SystemParam, QSortBy> {
  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppBackgroundColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBackgroundColor', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppBackgroundColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBackgroundColor', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBaseUrl', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBaseUrl', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> sortBySystemAppColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppColor', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppColor', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppEmailMarketing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailMarketing', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppEmailMarketingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailMarketing', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppEmailSupport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailSupport', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppEmailSupportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailSupport', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> sortBySystemAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppName', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppName', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCity', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCity', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileCountries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCountries', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileCountriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCountries', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileStates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileStates', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemPathFileStatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileStates', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemUrlPrivacyPolicy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlPrivacyPolicy', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemUrlPrivacyPolicyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlPrivacyPolicy', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> sortBySystemUrlTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlTerms', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      sortBySystemUrlTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlTerms', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> sortByTrialTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialTime', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> sortByTrialTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialTime', Sort.desc);
    });
  }
}

extension SystemParamQuerySortThenBy
    on QueryBuilder<SystemParam, SystemParam, QSortThenBy> {
  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppBackgroundColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBackgroundColor', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppBackgroundColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBackgroundColor', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppBaseUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBaseUrl', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppBaseUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppBaseUrl', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenBySystemAppColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppColor', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppColor', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppEmailMarketing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailMarketing', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppEmailMarketingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailMarketing', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppEmailSupport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailSupport', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppEmailSupportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppEmailSupport', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenBySystemAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppName', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemAppName', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCity', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCity', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileCountries() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCountries', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileCountriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileCountries', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileStates() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileStates', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemPathFileStatesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemPathFileStates', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemUrlPrivacyPolicy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlPrivacyPolicy', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemUrlPrivacyPolicyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlPrivacyPolicy', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenBySystemUrlTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlTerms', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy>
      thenBySystemUrlTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemUrlTerms', Sort.desc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenByTrialTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialTime', Sort.asc);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QAfterSortBy> thenByTrialTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialTime', Sort.desc);
    });
  }
}

extension SystemParamQueryWhereDistinct
    on QueryBuilder<SystemParam, SystemParam, QDistinct> {
  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemAppBackgroundColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppBackgroundColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct> distinctBySystemAppBaseUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppBaseUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct> distinctBySystemAppColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemAppEmailMarketing({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppEmailMarketing',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemAppEmailSupport({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppEmailSupport',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct> distinctBySystemAppName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemAppName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemPathFileCity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemPathFileCity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemPathFileCountries({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemPathFileCountries',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemPathFileStates({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemPathFileStates',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct>
      distinctBySystemUrlPrivacyPolicy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemUrlPrivacyPolicy',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct> distinctBySystemUrlTerms(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemUrlTerms',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SystemParam, SystemParam, QDistinct> distinctByTrialTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialTime', caseSensitive: caseSensitive);
    });
  }
}

extension SystemParamQueryProperty
    on QueryBuilder<SystemParam, SystemParam, QQueryProperty> {
  QueryBuilder<SystemParam, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemAppBackgroundColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppBackgroundColor');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemAppBaseUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppBaseUrl');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemAppColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppColor');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemAppEmailMarketingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppEmailMarketing');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemAppEmailSupportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppEmailSupport');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations> systemAppNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemAppName');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemPathFileCityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemPathFileCity');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemPathFileCountriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemPathFileCountries');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemPathFileStatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemPathFileStates');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemUrlPrivacyPolicyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemUrlPrivacyPolicy');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations>
      systemUrlTermsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemUrlTerms');
    });
  }

  QueryBuilder<SystemParam, String?, QQueryOperations> trialTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialTime');
    });
  }
}
