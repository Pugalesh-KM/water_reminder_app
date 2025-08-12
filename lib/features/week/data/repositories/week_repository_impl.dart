import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/week/data/datasources/week_local_data_source.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';
import 'package:water_reminder_app/features/week/domain/repositories/week_repository.dart';

class WeekRepositoryImpl extends WeekRepository{
  WeekLocalDataSource localDataSource;

  WeekRepositoryImpl(this.localDataSource);

  @override
  Future<Either<AppException, List<WeekModel>>> getWeeklyData() {
    try{
      final result = localDataSource.getWeeklyData();
      return result;
    }
    catch(e){
      throw Exception('Failed to load getPast7Days: $e');
    }
  }
}