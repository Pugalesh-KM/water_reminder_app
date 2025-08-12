import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';
import 'package:water_reminder_app/features/week/domain/repositories/week_repository.dart';

class WeekUseCase {
  WeekRepository repository;

  WeekUseCase(this.repository);

  Future<Either<AppException, List<WeekModel>>> getWeeklyData() {
    return repository.getWeeklyData();
  }
}
