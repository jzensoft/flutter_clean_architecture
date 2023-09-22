import 'dart:async';

import 'package:floor/floor.dart';
import 'package:photo_clean_architecture/features/photo/data/data_sources/local/dao/photo_dao.dart';
import 'package:photo_clean_architecture/features/photo/data/models/photo_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [PhotoModel])
abstract class AppDatabase extends FloorDatabase {
  PhotoDao get photoDao;
}
