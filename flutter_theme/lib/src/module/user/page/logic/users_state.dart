part of 'users_cubit.dart';

abstract class UsersState extends Equatable {}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersSuccess extends UsersState {
  final User user;

  UsersSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class UsersError extends UsersState {
  final Exception exception;

  UsersError(this.exception);
  @override
  List<Object?> get props => [exception];
}
