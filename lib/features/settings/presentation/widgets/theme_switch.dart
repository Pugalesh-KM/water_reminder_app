import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_reminder_app/shared/cubit/theme_cubit.dart';


class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;

        return ListTile(
          leading:  isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          title: const Text('Change Theme Mode'),
          trailing: Switch.adaptive(
            value: isDark,
            onChanged: (val) {
              context.read<ThemeCubit>().toggleTheme(val);
            },
            inactiveThumbColor: Theme.of(context).appBarTheme.backgroundColor,
            activeColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
        );
      },
    );
  }
}
