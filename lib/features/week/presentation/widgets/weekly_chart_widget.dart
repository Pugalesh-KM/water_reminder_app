import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder_app/features/week/data/models/week_model.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';

class WeeklyChartWidget extends StatelessWidget {
  final List<WeekModel> logs;
  final int dailyGoal;

  const WeeklyChartWidget({super.key, required this.logs, this.dailyGoal = 3000});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final Map<String, int> grouped = {
      for (int i = 6; i >= 0; i--)
        DateFormat('EEE').format(now.subtract(Duration(days: i))): 0
    };

    for (var log in logs) {
      final key = DateFormat('EEE').format(log.date);
      grouped[key] = ((grouped[key] ?? 0) + log.totalMl);
    }

    final barGroups = grouped.entries.mapIndexed((i, e) => BarChartGroupData(
      x: i,
      barRods: [
        BarChartRodData(
          toY: e.value.toDouble(),
          color: e.value >= dailyGoal ? Colors.green : Colors.blue,
          width: Dimens.standard_16,
          borderRadius: BorderRadius.circular(Dimens.standard_4),
        ),
      ],
    )).toList();

    return BarChart(
      BarChartData(
        barGroups: barGroups,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 500,
              getTitlesWidget: (value, meta) => Text('${value.toInt()}ml', style: TextStyle(fontSize: 12)),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < grouped.length) {
                  return Text(
                    grouped.keys.elementAt(index),
                    //style: TextStyle(fontSize: 10),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: false),
        maxY: 3000,
        barTouchData: BarTouchData(enabled: true),
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(
            y: dailyGoal.toDouble(),
            color: Colors.redAccent,
            strokeWidth: 2,
            dashArray: [4, 4],
            label: HorizontalLineLabel(
              show: true,
              alignment: Alignment.topRight,
              style: TextStyle(color: Colors.redAccent, fontSize: 10),
              labelResolver: (line) => 'Goal: ${dailyGoal}ml',
            ),
          )
        ]),
      ),
    );
  }
}

extension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E item) f) {
    var index = 0;
    return map((e) => f(index++, e));
  }
}
