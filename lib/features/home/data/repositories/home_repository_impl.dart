
import 'package:water_reminder_app/core/exceptions/http_exception.dart';
import 'package:water_reminder_app/core/network/model/either.dart';
import 'package:water_reminder_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.localDataSource);

  @override
  Future<Either<AppException, List<WaterIntakeModel>>> getTodayData() {
    try{
      final result = localDataSource.getTodayData();
      return result;
    }
    catch(e){
      throw Exception('Failed to load getTodayWaterLogs: $e');
    }
  }

  @override
  Future<Either<AppException, bool>> addWaterLog(WaterIntakeModel model) {
    try{
      final result = localDataSource.addWaterLog(model);
      return result;
    }
    catch(e){
      throw Exception('Failed to load addWaterLog: $e');
    }
  }

  @override
  Future<Either<AppException, bool>> deleteWaterLog(WaterIntakeModel log) {
    try{
      final result = localDataSource.deleteWaterLog(log);
      return result;
    }
    catch(e){
      throw Exception('Failed to load deleteWaterLog: $e');
    }
  }

}