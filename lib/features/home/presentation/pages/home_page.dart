import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:water_reminder_app/core/constants/routes.dart';
import 'package:water_reminder_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:water_reminder_app/features/home/presentation/widgets/ml_button.dart';
import 'package:water_reminder_app/features/home/presentation/widgets/water_animation.dart';
import 'package:water_reminder_app/features/home/presentation/widgets/water_log_list.dart';
import 'package:water_reminder_app/shared/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HydroTrack"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(RoutesName.weekPath);
            },
            icon: Icon(Icons.bar_chart),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeError) {
            return Center(child: Text(state.message));
          }

          if (state is HomeSuccess) {

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WaterAnimation(counter: state.total),
                  Text(
                    '${state.total} / 3000 ml',
                    style: AppTextStyles.openSansBold24
                  ),
                  MlButtons(
                    onPressed120ml: () {
                      context.read<HomeCubit>().addWater(120);
                    },
                    onPressed250ml: () {
                      context.read<HomeCubit>().addWater(250);
                    },
                    onPressed500ml: () {
                      context.read<HomeCubit>().addWater(500);
                    },
                  ),
                  Divider(),
                  Expanded(
                    child: WaterLogList(
                      logs: state.logs,
                      onDelete: (log) {
                        context.read<HomeCubit>().deleteWaterLog(log);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
