import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';

abstract class WeekRepository{
  Future<Either<AppException, List<WeekModel>>> getWeeklyData();
}