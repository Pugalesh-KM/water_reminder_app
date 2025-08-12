import 'package:flutter/material.dart';
import 'package:water_reminder_app/features/home/data/models/water_intake_model.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';
import 'package:water_reminder_app/shared/theme/app_text_styles.dart';

class WaterLogList extends StatelessWidget {
  final List<WaterIntakeModel> logs;
  final void Function(WaterIntakeModel) onDelete;

  const WaterLogList({super.key, required this.logs, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    if (logs.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(Dimens.standard_16),
        child: Text("No water logs yet"),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.standard_16, vertical: Dimens.standard_2),
          child: Text("Today's Logs", style: AppTextStyles.openSansBold16),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: Dimens.standard_8, vertical: Dimens.standard_3),
                child: ListTile(
                  leading: const Icon(Icons.water_drop, color: Colors.blue),
                  title: Text('${log.amount} ml'),
                  subtitle: Text(
                    TimeOfDay.fromDateTime(log.timestamp).format(context),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete(log),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
