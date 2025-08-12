import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_reminder_app/features/week/presentation/cubit/week_cubit.dart';
import 'package:water_reminder_app/features/week/presentation/widgets/weekly_chart_widget.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';

class WeekPage extends StatelessWidget {
  const WeekPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekCubit = context.read<WeekCubit>();
    if (weekCubit.state is WeekInitial || weekCubit.state is WeekSuccess) {
      weekCubit.loadWeeklyLogs();
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Weekly Water Intake")),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.standard_16),
        child: BlocBuilder<WeekCubit, WeekState>(
          builder: (context, state) {
            if (state is WeekLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeekError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is WeekSuccess) {
              return WeeklyChartWidget(logs: state.logs);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}