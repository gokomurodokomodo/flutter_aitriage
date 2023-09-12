// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_sync_date.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTableSyncDateCollection on Isar {
  IsarCollection<TableSyncDate> get tableSyncDates => this.collection();
}

const TableSyncDateSchema = CollectionSchema(
  name: r'TableSyncDate',
  id: 6415151548002347618,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.long,
    ),
    r'country': PropertySchema(
      id: 1,
      name: r'country',
      type: IsarType.long,
    ),
    r'paramType': PropertySchema(
      id: 2,
      name: r'paramType',
      type: IsarType.long,
    ),
    r'race': PropertySchema(
      id: 3,
      name: r'race',
      type: IsarType.long,
    ),
    r'role': PropertySchema(
      id: 4,
      name: r'role',
      type: IsarType.long,
    ),
    r'state': PropertySchema(
      id: 5,
      name: r'state',
      type: IsarType.long,
    ),
    r'systemParam': PropertySchema(
      id: 6,
      name: r'systemParam',
      type: IsarType.long,
    )
  },
  estimateSize: _tableSyncDateEstimateSize,
  serialize: _tableSyncDateSerialize,
  deserialize: _tableSyncDateDeserialize,
  deserializeProp: _tableSyncDateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tableSyncDateGetId,
  getLinks: _tableSyncDateGetLinks,
  attach: _tableSyncDateAttach,
  version: '3.1.0+1',
);

int _tableSyncDateEstimateSize(
  TableSyncDate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tableSyncDateSerialize(
  TableSyncDate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.city);
  writer.writeLong(offsets[1], object.country);
  writer.writeLong(offsets[2], object.paramType);
  writer.writeLong(offsets[3], object.race);
  writer.writeLong(offsets[4], object.role);
  writer.writeLong(offsets[5], object.state);
  writer.writeLong(offsets[6], object.systemParam);
}

TableSyncDate _tableSyncDateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TableSyncDate(
    reader.readLongOrNull(offsets[0]),
    reader.readLongOrNull(offsets[1]),
    reader.readLongOrNull(offsets[2]),
    reader.readLongOrNull(offsets[3]),
    reader.readLongOrNull(offsets[4]),
    reader.readLongOrNull(offsets[5]),
    reader.readLongOrNull(offsets[6]),
  );
  object.id = id;
  return object;
}

P _tableSyncDateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tableSyncDateGetId(TableSyncDate object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tableSyncDateGetLinks(TableSyncDate object) {
  return [];
}

void _tableSyncDateAttach(
    IsarCollection<dynamic> col, Id id, TableSyncDate object) {
  object.id = id;
}

extension TableSyncDateQueryWhereSort
    on QueryBuilder<TableSyncDate, TableSyncDate, QWhere> {
  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TableSyncDateQueryWhere
    on QueryBuilder<TableSyncDate, TableSyncDate, QWhereClause> {
  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TableSyncDateQueryFilter
    on QueryBuilder<TableSyncDate, TableSyncDate, QFilterCondition> {
  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> cityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      cityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      cityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> cityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      countryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paramType',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paramType',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paramType',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paramType',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paramType',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      paramTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paramType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      raceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'race',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      raceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'race',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> raceEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'race',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      raceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'race',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      raceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'race',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> raceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'race',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> roleEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      roleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      roleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition> roleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      stateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'systemParam',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'systemParam',
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systemParam',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systemParam',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systemParam',
        value: value,
      ));
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterFilterCondition>
      systemParamBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systemParam',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TableSyncDateQueryObject
    on QueryBuilder<TableSyncDate, TableSyncDate, QFilterCondition> {}

extension TableSyncDateQueryLinks
    on QueryBuilder<TableSyncDate, TableSyncDate, QFilterCondition> {}

extension TableSyncDateQuerySortBy
    on QueryBuilder<TableSyncDate, TableSyncDate, QSortBy> {
  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByParamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paramType', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy>
      sortByParamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paramType', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByRace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByRaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> sortBySystemParam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemParam', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy>
      sortBySystemParamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemParam', Sort.desc);
    });
  }
}

extension TableSyncDateQuerySortThenBy
    on QueryBuilder<TableSyncDate, TableSyncDate, QSortThenBy> {
  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByParamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paramType', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy>
      thenByParamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paramType', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByRace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByRaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy> thenBySystemParam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemParam', Sort.asc);
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QAfterSortBy>
      thenBySystemParamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systemParam', Sort.desc);
    });
  }
}

extension TableSyncDateQueryWhereDistinct
    on QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> {
  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByParamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paramType');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByRace() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'race');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state');
    });
  }

  QueryBuilder<TableSyncDate, TableSyncDate, QDistinct>
      distinctBySystemParam() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systemParam');
    });
  }
}

extension TableSyncDateQueryProperty
    on QueryBuilder<TableSyncDate, TableSyncDate, QQueryProperty> {
  QueryBuilder<TableSyncDate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> paramTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paramType');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> raceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'race');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }

  QueryBuilder<TableSyncDate, int?, QQueryOperations> systemParamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systemParam');
    });
  }
}
