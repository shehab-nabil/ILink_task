import 'package:dartz/dartz.dart';
import 'package:ilink_task/features/pets/data/datasources/response.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';
import 'package:ilink_task/features/pets/domain/repositories/pets_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';

class PetsRepositoryImpl implements PetsRepository {
  final PetsRemoteDataSource petsRemoteDataSource;

  PetsRepositoryImpl({required this.petsRemoteDataSource});

  @override
  Future<Either<Failure, AllpetsType>> getAllTypes() async {
    try {
      final respose = await petsRemoteDataSource.getPetsAllTypes();
      return Right(respose);
    } on ServerException {
      print('error ');
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AnimalsModel>> getPets(int page) async {
    try {
      final respose = await petsRemoteDataSource.getPets(page);
      return Right(respose);
    } on ServerException {
      print('error ');
      return left(ServerFailure());
    }
  }
}
