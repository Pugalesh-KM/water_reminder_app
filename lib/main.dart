import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_reminder_app/core/dependency_injection/injector.dart';
import 'package:water_reminder_app/features/week/presentation/cubit/week_cubit.dart';
import 'package:water_reminder_app/routes/app_routes.dart';
import 'package:water_reminder_app/shared/cubit/theme_cubit.dart';
import 'package:water_reminder_app/shared/theme/app_theme.dart';

import 'core/services/notification_service.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<ThemeCubit>()),
        BlocProvider(create: (_) => injector<HomeCubit>()..loadTodayLogs()),
        BlocProvider(create: (_) => injector<WeekCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'HydroTrack',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
