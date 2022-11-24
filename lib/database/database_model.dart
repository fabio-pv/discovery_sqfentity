import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'database_model.g.dart';

const tableCategory = SqfEntityTable(
  tableName: 'category',
  modelName: 'CategoryDB',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField(
      'name',
      DbType.text,
      isIndex: true,
      isNotNull: true,
    ),
    SqfEntityField(
      'lastName',
      DbType.text,
    ),
  ],
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'MyDbModel',
  databaseName: 'sampleORM.db',
  databaseTables: [
    tableCategory,
  ],
  sequences: [seqIdentity],
  bundledDatabasePath: null,
);
