import 'dart:convert';

import 'package:water_reminder_app/core/database/hive_storage_service.dart';
import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';

abstract class WeekLocalDataSource {
  Future<Either<AppException, List<WeekModel>>> getWeeklyData();
}

class WeekLocalDataSourceImpl extends WeekLocalDataSource {
  final HiveService hiveService;

  WeekLocalDataSourceImpl(this.hiveService);

  @override
  Future<Either<AppException, List<WeekModel>>> getWeeklyData() async {
    try {
      final now = DateTime.now();
      final List<WeekModel> result = [];

      for (int i = 0; i < 7; i++) {
        final date = now.subtract(Duration(days: i));
        final key = 'logs_${date.year}_${date.month}_${date.day}';
        final data = await hiveService.get(key);

        if (data != null) {
          final List decoded = jsonDecode(data.toString());
          final logs = decoded
              .map((e) => WaterIntakeModel.fromJson(e))
              .map((e) => WeekModel(date: e.timestamp, totalMl: e.amount))
              .toList();
          result.addAll(logs);
        } else {
          result.add(WeekModel(date: date, totalMl: 0));
        }
      }

      return Right(result);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to fetch past 7 days data',
          identifier: '${e.toString()}\nWeekLocalDataSourceImpl.getWeeklyData',
          statusCode: 1,
        ),
      );
    }
  }
}
