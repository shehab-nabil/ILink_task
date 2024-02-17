import 'package:dartz/dartz.dart';
import 'package:ilink_task/core/error/failure.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';
import 'package:ilink_task/features/pets/domain/repositories/pets_repository.dart';
import 'package:ilink_task/features/pets/domain/usecases/usecases.dart';

class GetPetsUseCase implements BaseUseCases<AnimalsModel, int> {
  final PetsRepository petsRepository;

  GetPetsUseCase({required this.petsRepository});

  @override
  Future<Either<Failure, AnimalsModel?>> call(int page) {
    return petsRepository.getPets(page);
  }
}

class GetAllPetsTypesUseCase implements BaseUseCases<AllpetsType, NoParams> {
  final PetsRepository petsRepository;

  GetAllPetsTypesUseCase({required this.petsRepository});

  @override
  Future<Either<Failure, AllpetsType?>> call(NoParams params) {
    return petsRepository.getAllTypes();
  }
}
