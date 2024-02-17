import 'package:get_it/get_it.dart';
import 'package:ilink_task/features/pets/data/datasources/response.dart';
import 'package:ilink_task/features/pets/data/repositories/pet_repo_impl.dart';
import 'package:ilink_task/features/pets/domain/repositories/pets_repository.dart';
import 'package:ilink_task/features/pets/domain/usecases/pets_use_cases.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_cubit/pets_cubit.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_type_cubit/pets_type_cubit.dart';

GetIt sl = GetIt.instance;
Future<void> initSL() async {
//Bloc
  sl.registerFactory(() => PetsCubit(getPetsUseCase: sl()));
  sl.registerFactory(() => PetsTypeCubit(getAllPetsTypesUseCase: sl()));
//Use Cases
  sl.registerLazySingleton<GetPetsUseCase>(
      () => GetPetsUseCase(petsRepository: sl()));
  sl.registerLazySingleton<GetAllPetsTypesUseCase>(
      () => GetAllPetsTypesUseCase(petsRepository: sl()));

//Repository
  sl.registerLazySingleton<PetsRepository>(
      () => PetsRepositoryImpl(petsRemoteDataSource: sl()));

//Data Source
  sl.registerLazySingleton<PetsRemoteDataSource>(
      () => PetsRemoteDataSourceImpl());
}
