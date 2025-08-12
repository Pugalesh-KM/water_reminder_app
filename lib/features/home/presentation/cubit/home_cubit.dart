import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:water_reminder_app/core/database/hive_storage_service.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/features/home/domain/usecases/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase useCase;
  final HiveService _hiveService;

  HomeCubit(this.useCase)
    : _hiveService = GetIt.instance<HiveService>(),
      super(HomeInitial());

  Future<void> loadTodayLogs() async {
    if (!_hiveService.hasInitialized) {
      log("hasInitialized -- HomeCubit");
      await _hiveService.init();
    }
    emit(HomeLoading());
    try {
      final result = await useCase.getTodayData();
      result.fold(
        (failure) {
          emit(HomeError(failure.message));
        },
        (logs) {
          final total = logs.fold<int>(0, (sum, e) => sum + e.amount);
          emit(
            HomeSuccess(total: total, logs: logs, goalReached: total >= 3000),
          );
        },
      );
    } catch (e) {
      log('catch');
      emit(HomeError(e.toString()));
    }
  }

  Future<void> addWater(int amount) async {
    final log = WaterIntakeModel(amount: amount, timestamp: DateTime.now());

    final result = await useCase.addWaterLog(log);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (success)  =>  loadTodayLogs(),
    );
  }

  Future<void> deleteWaterLog(WaterIntakeModel log) async {
    emit(HomeLoading());
    final result = await useCase.deleteWaterLog(log);
    result.fold(
          (failure) => emit(HomeError(failure.message)),
          (success)  => loadTodayLogs(),
    );
  }


}
