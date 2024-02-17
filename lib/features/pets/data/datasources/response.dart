import 'package:dio/dio.dart';
import 'package:ilink_task/core/apis/api_services.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/apis/api.dart';

abstract class PetsRemoteDataSource {
  Future<AnimalsModel> getPets(int page);
  Future<AllpetsType> getPetsAllTypes();
}

class PetsRemoteDataSourceImpl implements PetsRemoteDataSource {
  PetfinderApiClient client = PetfinderApiClient();
  // @override
  // Future<MainDataModel> getProgram() async {
  //   final response = await Dio().get(Api.apiUrl);
  //   if (response.statusCode == 200) {
  //     return MainDataModel.fromJson(response.data);
  //   } else {
  //     throw const ServerException();
  //   }
  // }

  @override
  Future<AnimalsModel> getPets(int page) async {
    final response = await client.getAllAnimals(page);
    if (response.statusCode == 200) {
      return AnimalsModel.fromJson(response.data);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<AllpetsType> getPetsAllTypes() async {
    final response = await client.getAllTypes();

    if (response.statusCode == 200) {
      return AllpetsType.fromJson(response.data);
    } else {
      throw const ServerException();
    }
  }
}
