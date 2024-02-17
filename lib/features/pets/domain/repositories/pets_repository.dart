import 'package:dartz/dartz.dart';
import 'package:ilink_task/core/error/failure.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';

abstract class PetsRepository {
  Future<Either<Failure, AnimalsModel>> getPets(int page);
  Future<Either<Failure, AllpetsType>> getAllTypes();
}
