import 'package:get_it/get_it.dart';
import 'package:water_reminder_app/core/database/hive_storage_service.dart';
import 'package:water_reminder_app/core/network/dio_network_service.dart';
import 'package:water_reminder_app/core/network/network_service.dart';
import 'package:water_reminder_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:water_reminder_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:water_reminder_app/features/home/domain/repositories/home_repository.dart';
import 'package:water_reminder_app/features/home/domain/usecases/home_use_case.dart';
import 'package:water_reminder_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:water_reminder_app/features/week/data/datasources/week_local_data_source.dart';
import 'package:water_reminder_app/features/week/data/repositories/week_repository_impl.dart';
import 'package:water_reminder_app/features/week/domain/repositories/week_repository.dart';
import 'package:water_reminder_app/features/week/domain/usecases/week_use_case.dart';
import 'package:water_reminder_app/features/week/presentation/cubit/week_cubit.dart';
import 'package:water_reminder_app/shared/cubit/theme_cubit.dart';

final injector = GetIt.instance;

Future<void> init() async {
  injector
    ..registerLazySingleton<NetworkService>(DioNetworkService.new)
    ..registerLazySingleton<DioNetworkService>(DioNetworkService.new)
    ..registerLazySingleton<HiveService>(HiveService.new)

    ..registerFactory<ThemeCubit>(() => ThemeCubit())
    /// Login
    ..registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(injector()),)
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(injector()),)
    ..registerLazySingleton<HomeUseCase>(() => HomeUseCase(injector()))
    ..registerFactory<HomeCubit>(() => HomeCubit(injector()))

    ///week
    ..registerLazySingleton<WeekLocalDataSource>(() => WeekLocalDataSourceImpl(injector()),)
    ..registerLazySingleton<WeekRepository>(() => WeekRepositoryImpl(injector()),)
    ..registerLazySingleton<WeekUseCase>(() => WeekUseCase(injector()))
    ..registerFactory<WeekCubit>(() => WeekCubit(injector()));
}
