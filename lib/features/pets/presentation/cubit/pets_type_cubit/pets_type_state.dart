part of 'pets_type_cubit.dart';

sealed class PetsTypeState extends Equatable {
  const PetsTypeState();

  @override
  List<Object> get props => [];
}

final class PetsTypeInitial extends PetsTypeState {}

class PetsTypeLoading extends PetsTypeState {}

class PetsTypeLoaded extends PetsTypeState {
  final AllpetsType allpetsType;

  const PetsTypeLoaded({required this.allpetsType});
  @override
  List<Object> get props => [allpetsType];
}

class PetsTypeError extends PetsTypeState {
  final String msg;

  const PetsTypeError({required this.msg});

  @override
  List<Object> get props => [msg];
}
