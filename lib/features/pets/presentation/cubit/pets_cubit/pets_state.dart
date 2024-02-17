part of 'pets_cubit.dart';

abstract class PetsState extends Equatable {
  const PetsState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends PetsState {}

class PetsLoading extends PetsState {}

class PetsLoaded extends PetsState {
  final AnimalsModel animalsModel;

  const PetsLoaded({
    required this.animalsModel,
  });
  @override
  List<Object> get props => [animalsModel];
}

class PetsError extends PetsState {
  final String msg;

  const PetsError({required this.msg});

  @override
  List<Object> get props => [msg];
}
