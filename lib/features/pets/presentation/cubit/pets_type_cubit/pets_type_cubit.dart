import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ilink_task/core/error/failure.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/usecases/pets_use_cases.dart';
import 'package:ilink_task/features/pets/domain/usecases/usecases.dart';

part 'pets_type_state.dart';

class PetsTypeCubit extends Cubit<PetsTypeState> {
  PetsTypeCubit({required this.getAllPetsTypesUseCase})
      : super(PetsTypeInitial());
  final GetAllPetsTypesUseCase getAllPetsTypesUseCase;

  AllpetsType? allpetsType;

  Future<void> getAllTypes() async {
    emit(PetsTypeLoading());
    Either<Failure, AllpetsType?> response =
        await getAllPetsTypesUseCase(NoParams());
    emit(response.fold((failure) {
      return PetsTypeError(msg: failureMessage(failure));
    }, (allType) {
      allpetsType = allType;
      return PetsTypeLoaded(allpetsType: allType!);
    }));
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
