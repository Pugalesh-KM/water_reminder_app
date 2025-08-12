import 'package:flutter/material.dart';
import 'package:water_reminder_app/shared/config/dimens.dart';

class WaterAnimation extends StatelessWidget {
  const WaterAnimation({super.key, required this.counter});

  final int counter;
  static const int maxWater = 3000;

  @override
  Widget build(BuildContext context) {
    final double targetHeight = (counter / maxWater) * 250;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 250,
        width: 150,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: targetHeight),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (context, height, child) {
                return Container(
                  height: height,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.standard_12),
                    color: counter <= maxWater ? Colors.blue : Colors.green,
                  ),
                );
              },
            ),
            Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(Dimens.standard_12),
              ),
            ),
            Image.asset(
              'assets/images/water.png',
              height: 250,
              width: 150,
              fit: BoxFit.cover,
              color: Theme.of(context).colorScheme.background,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
            Positioned(
              bottom: Dimens.standard_20,
              child: Text(
                '$counter ml',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
