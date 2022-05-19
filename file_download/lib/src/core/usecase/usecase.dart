import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<T, P> {
  Future<Either<Exception, T>> call(P p);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
