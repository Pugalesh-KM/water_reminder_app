import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';

abstract class HomeRepository {
  Future<Either<AppException, List<WaterIntakeModel>>> getTodayData();
  Future<Either<AppException, bool>> addWaterLog(WaterIntakeModel model);
  Future<Either<AppException, bool>> deleteWaterLog(WaterIntakeModel log);
}