// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';
import 'package:drift/internal/migrations.dart';
import '../drift/db/generated/schema_v1.dart' as v1;
import '../drift/db/generated/schema_v3.dart' as v3;
import '../drift/db/generated/schema_v4.dart' as v4;
import '../drift/db/generated/schema_v5.dart' as v5;
import '../drift/db/generated/schema_v6.dart' as v6;
import '../drift/db/generated/schema_v7.dart' as v7;
import '../drift/db/generated/schema_v8.dart' as v8;
import '../drift/db/generated/schema_v9.dart' as v9;
import '../drift/db/generated/schema_v10.dart' as v10;
import '../drift/db/generated/schema_v11.dart' as v11;
import '../drift/db/generated/schema_v12.dart' as v12;
import '../drift/db/generated/schema_v13.dart' as v13;
import '../drift/db/generated/schema_v14.dart' as v14;
import '../drift/db/generated/schema_v15.dart' as v15;
import '../drift/db/generated/schema_v16.dart' as v16;
import '../drift/db/generated/schema_v17.dart' as v17;
import '../drift/db/generated/schema_v18.dart' as v18;
import '../drift/db/generated/schema_v19.dart' as v19;
import '../drift/db/generated/schema_v20.dart' as v20;
import '../drift/db/generated/schema_v21.dart' as v21;
import '../drift/db/generated/schema_v22.dart' as v22;
import '../drift/db/generated/schema_v23.dart' as v23;
import '../drift/db/generated/schema_v24.dart' as v24;
import 'schema_v25.dart' as v25;

class GeneratedHelper implements SchemaInstantiationHelper {
  @override
  GeneratedDatabase databaseForVersion(QueryExecutor db, int version) {
    switch (version) {
      case 1:
        return v1.DatabaseAtV1(db);
      case 3:
        return v3.DatabaseAtV3(db);
      case 4:
        return v4.DatabaseAtV4(db);
      case 5:
        return v5.DatabaseAtV5(db);
      case 6:
        return v6.DatabaseAtV6(db);
      case 7:
        return v7.DatabaseAtV7(db);
      case 8:
        return v8.DatabaseAtV8(db);
      case 9:
        return v9.DatabaseAtV9(db);
      case 10:
        return v10.DatabaseAtV10(db);
      case 11:
        return v11.DatabaseAtV11(db);
      case 12:
        return v12.DatabaseAtV12(db);
      case 13:
        return v13.DatabaseAtV13(db);
      case 14:
        return v14.DatabaseAtV14(db);
      case 15:
        return v15.DatabaseAtV15(db);
      case 16:
        return v16.DatabaseAtV16(db);
      case 17:
        return v17.DatabaseAtV17(db);
      case 18:
        return v18.DatabaseAtV18(db);
      case 19:
        return v19.DatabaseAtV19(db);
      case 20:
        return v20.DatabaseAtV20(db);
      case 21:
        return v21.DatabaseAtV21(db);
      case 22:
        return v22.DatabaseAtV22(db);
      case 23:
        return v23.DatabaseAtV23(db);
      case 24:
        return v24.DatabaseAtV24(db);
      case 25:
        return v25.DatabaseAtV25(db);
      default:
        throw MissingSchemaException(version, const {
          1,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20,
          21,
          22,
          23,
          24,
          25
        });
    }
  }
}
