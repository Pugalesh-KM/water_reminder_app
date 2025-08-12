import 'package:flutter/material.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';

class MlButtons extends StatelessWidget {
  const MlButtons({
    super.key,
    required this.onPressed120ml,
    required this.onPressed250ml,
    required this.onPressed500ml,
  });

  final VoidCallback onPressed120ml;
  final VoidCallback onPressed250ml;
  final VoidCallback onPressed500ml;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.standard_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onPressed120ml,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            child: Image.asset(
              "assets/images/120.png",
              height: 90,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: onPressed250ml,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            child: Image.asset(
              "assets/images/250.png",
              height: 90,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: onPressed500ml,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            child: Image.asset(
              "assets/images/500.png",
              height: 90,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
