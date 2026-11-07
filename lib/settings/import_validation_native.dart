import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

QueryExecutor createImportValidationExecutor(String filePath) =>
    NativeDatabase(File(filePath));
