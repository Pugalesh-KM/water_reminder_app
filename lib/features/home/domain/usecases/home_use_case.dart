import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/features/home/domain/repositories/home_repository.dart';

class HomeUseCase {
  HomeRepository repository;

  HomeUseCase(this.repository);

  Future<Either<AppException, List<WaterIntakeModel>>> getTodayData() {
    return repository.getTodayData();
  }

  Future<Either<AppException, bool>> addWaterLog(WaterIntakeModel model) {
    return repository.addWaterLog(model);
  }

  Future<Either<AppException, bool>> deleteWaterLog(WaterIntakeModel log) {
    return repository.deleteWaterLog(log);
  }

}
