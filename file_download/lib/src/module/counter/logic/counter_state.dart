part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {}

class CounterInitial extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterProgress extends CounterState {
  CounterProgress(this.total, {this.counter = 0});
  final double counter;
  final double total;

  @override
  List<Object?> get props => [counter];
}

class CounterSuccess extends CounterState {
  CounterSuccess(this.file);
  final File file;

  @override
  List<Object?> get props => [file];
}
