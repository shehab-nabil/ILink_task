import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ilink_task/core/error/failure.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';
import 'package:ilink_task/features/pets/domain/usecases/pets_use_cases.dart';

part 'pets_state.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit({
    required this.getPetsUseCase,
  }) : super(PetsInitial());
  final GetPetsUseCase getPetsUseCase;
  AnimalsModel? animalsModel;
  int _currentPage = 1;
  Future<void> getPets(int page) async {
    emit(PetsLoading());
    Either<Failure, AnimalsModel?> response = await getPetsUseCase(page);
    emit(response.fold((failure) => PetsError(msg: failureMessage(failure)),
        (pets) {
      animalsModel = pets;
      return PetsLoaded(animalsModel: pets!);
    }));
  }

  Future<void> loadMoreItems() async {
    _currentPage++;
    final response = await getPetsUseCase(_currentPage);
    emit(response.fold((failure) => PetsError(msg: failureMessage(failure)),
        (pets) {
      animalsModel = pets;
      return PetsLoaded(animalsModel: pets!);
    }));
    // Handle the response and update the state accordingly.
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'unexpected Failure';
    }
  }
}
