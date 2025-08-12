part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeSuccess extends HomeState {
  final int total;
  final List<WaterIntakeModel> logs;
  final bool goalReached;

  const HomeSuccess({
    required this.total,
    required this.logs,
    required this.goalReached,
  });
  @override
  List<Object?> get props => [total,logs,goalReached];

}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
