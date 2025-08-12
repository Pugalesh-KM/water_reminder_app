import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_reminder_app/core/constants/routes.dart';
import 'package:water_reminder_app/features/home/presentation/pages/home_page.dart';
import 'package:water_reminder_app/features/navigation/pages/main_navigation_page.dart';
import 'package:water_reminder_app/features/settings/presentation/pages/settings_page.dart';
import 'package:water_reminder_app/features/week/presentation/pages/week_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: RoutesName.defaultPath,
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesName.defaultPath,
      builder: (BuildContext context, GoRouterState state) {
        return MainNavigationPage();
      },
    ),
    GoRoute(
      path: RoutesName.homePath,
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: RoutesName.weekPath,
      builder: (BuildContext context, GoRouterState state) {
        return WeekPage();
      },
    ),
    GoRoute(
      path: RoutesName.settingsPath,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsPage();
      },
    ),
  ],
);
