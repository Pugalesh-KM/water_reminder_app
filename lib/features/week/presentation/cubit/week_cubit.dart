import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:water_reminder_app/core/database/hive_storage_service.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';
import 'package:water_reminder_app/features/week/domain/usecases/week_use_case.dart';

part 'week_state.dart';

class WeekCubit extends Cubit<WeekState> {
  final WeekUseCase useCase;
  final HiveService _hiveService;

  WeekCubit(this.useCase)
    : _hiveService = GetIt.instance<HiveService>(),
      super(WeekInitial());

  Future<void> loadWeeklyLogs() async {
    if (!_hiveService.hasInitialized) {
      log("hasInitialized -- WeekCubit");
      await _hiveService.init();
    }
    emit(WeekLoading());
    final result = await useCase.getWeeklyData();
    result.fold(
      (failure) => emit(WeekError(failure.message)),
      (logs) => emit(WeekSuccess(logs: logs)),
    );
  }
}
