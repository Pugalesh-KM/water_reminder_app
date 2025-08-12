import 'dart:convert';

import 'package:water_reminder_app/core/database/hive_storage_service.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/core/exceptions/http_exception.dart';

abstract class HomeLocalDataSource {
  Future<Either<AppException, List<WaterIntakeModel>>> getTodayData();
  Future<Either<AppException, bool>> addWaterLog(WaterIntakeModel model);
  Future<Either<AppException, bool>> deleteWaterLog(WaterIntakeModel model);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final HiveService hiveService;

  HomeLocalDataSourceImpl(this.hiveService);

  @override
  Future<Either<AppException, List<WaterIntakeModel>>> getTodayData() async {
    try {
      final todayKey = _getTodayKey();
      final data = await hiveService.get(todayKey);
      if (data == null) return Right([]);

      final List decoded = jsonDecode(data.toString());
      final logs = decoded.map((e) => WaterIntakeModel.fromJson(e)).toList();
      return Right(logs);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to load logs',
        identifier: '${e.toString()}\nHomeLocalDataSource.getTodayWaterLogs',
        statusCode: 1,
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> addWaterLog(WaterIntakeModel model) async {
    try {
      final todayKey = _getTodayKey();
      final existingData = await hiveService.get(todayKey);
      List logs = [];

      if (existingData != null) {
        logs = jsonDecode(existingData.toString());
      }

      logs.add(model.toJson());

      await hiveService.set(todayKey, jsonEncode(logs));
      return Right(true);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to save log',
        identifier: '${e.toString()}\nHomeLocalDataSource.addWaterLog',
        statusCode: 1,
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> deleteWaterLog(WaterIntakeModel log) async {
    try {
      final todayKey = _getTodayKey();
      final existingData = await hiveService.get(todayKey);

      if (existingData == null) return Right(false);

      final List decoded = jsonDecode(existingData.toString());
      decoded.removeWhere((e) => e['timestamp'] == log.timestamp.toIso8601String());

      await hiveService.set(todayKey, jsonEncode(decoded));
      return Right(true);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to delete log',
        identifier: '${e.toString()}\nHomeLocalDataSource.deleteWaterLog',
        statusCode: 1,
      ));
    }
  }



  String _getTodayKey() {
    final now = DateTime.now();
    return 'logs_${now.year}_${now.month}_${now.day}';
  }
}
