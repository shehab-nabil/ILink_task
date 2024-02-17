import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ilink_task/core/error/failure.dart';

abstract class BaseUseCases<T, Params> {
  Future<Either<Failure, T?>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
