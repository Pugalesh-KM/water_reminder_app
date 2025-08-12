class WaterIntakeModel {
  final int amount;
  final DateTime timestamp;

  WaterIntakeModel({required this.amount, required this.timestamp});

  factory WaterIntakeModel.fromJson(Map<String, dynamic> json) {
    return WaterIntakeModel(
      amount: json['amount'] ?? 0,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'timestamp': timestamp.toIso8601String()};
  }
}
