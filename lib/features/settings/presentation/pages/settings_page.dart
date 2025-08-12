import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:water_reminder_app/core/services/notification_service.dart';
import 'package:water_reminder_app/features/settings/presentation/widgets/theme_switch.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Duration? _selectedInterval; // Current selected interval

  void _showIntervalSelectionBottomSheet(BuildContext context) {
    final options = <String, Duration>{
      '2 min': const Duration(minutes: 2),
      '5 min': const Duration(minutes: 5),
      '15 min': const Duration(minutes: 15),
      '30 min': const Duration(minutes: 30),
      '45 min': const Duration(minutes: 45),
      '1 hour': const Duration(hours: 1),
    };

    Duration? tempSelected = _selectedInterval;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimens.standard_16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateBottom) {
            return Padding(
              padding: const EdgeInsets.all(Dimens.standard_16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select Reminder Interval',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: Dimens.standard_10),
                  ...options.entries.map((entry) {
                    final isSelected = tempSelected == entry.value;
                    return ListTile(
                      title: Text(entry.key),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.blue)
                          : const Icon(Icons.circle_outlined),
                      onTap: () async {
                        await NotificationService.showCustomPeriodicNotification(
                          id: 300,
                          title: 'Hydration Check-In',
                          body: 'Drink some water 💧 and stay refreshed!',
                          repeatInterval: entry.value,
                          displayDuration: const Duration(seconds: 10),
                        );
                        log("Started hydration reminder every ${entry.key}");
                        setState(() => _selectedInterval = entry.value);
                        setStateBottom(() => tempSelected = entry.value);
                        Navigator.pop(context); // Close bottom sheet
                      },
                    );
                  }).toList(),
                  const SizedBox(height: Dimens.standard_10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _stopHydrationReminder() {
    NotificationService.cancel(300);
    log("Stopped hydration reminder");
    setState(() => _selectedInterval = null);
  }

  @override
  Widget build(BuildContext context) {
    final intervalText = _selectedInterval != null
        ? "Current: ${_selectedInterval!.inMinutes} min"
        : "Not set";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimens.standard_16),
        children: [
          const Text('Theme Settings'),
          const SizedBox(height: Dimens.standard_10),
          const ThemeSwitch(),
          const SizedBox(height: Dimens.standard_20),
          const Text('Reminder Settings'),
          const SizedBox(height: Dimens.standard_10),
          ElevatedButton.icon(
            icon: const Icon(Icons.repeat),
            label: Text("Reminder Interval  •  $intervalText"),
            onPressed: () => _showIntervalSelectionBottomSheet(context),
          ),
          const SizedBox(height: Dimens.standard_10),
          ElevatedButton.icon(
            icon: const Icon(Icons.cancel),
            label: const Text("Stop Hydration Reminder"),
            onPressed: _stopHydrationReminder,
          ),
        ],
      ),
    );
  }
}
