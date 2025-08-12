part of 'week_cubit.dart';

abstract class WeekState extends Equatable {
  const WeekState();

  @override
  List<Object?> get props => [];
}

class WeekInitial extends WeekState {
  const WeekInitial();
}

class WeekLoading extends WeekState {
  const WeekLoading();
}

class WeekSuccess extends WeekState {
  final List<WeekModel> logs;

  const WeekSuccess({required this.logs});

  @override
  List<Object> get props => [logs];
}

class WeekError extends WeekState {
  final String message;

  const WeekError(this.message);

  @override
  List<Object?> get props => [message];
}
