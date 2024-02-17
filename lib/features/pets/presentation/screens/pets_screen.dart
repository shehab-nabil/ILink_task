import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilink_task/core/utils/app_colors.dart';
import 'package:ilink_task/core/utils/app_size.dart';
import 'package:ilink_task/core/utils/app_strings.dart';
import 'package:ilink_task/features/pets/domain/models/all_pets_type.dart';
import 'package:ilink_task/features/pets/domain/models/pet_model.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_cubit/pets_cubit.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_type_cubit/pets_type_cubit.dart';
import 'package:ilink_task/features/pets/presentation/screens/pet_details_screen.dart';
import 'package:ilink_task/features/pets/presentation/widgets/pet_card.dart';
import 'package:ilink_task/features/pets/presentation/widgets/type_card.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  int selectedIndex = 0;
  String type = '';
  int currentPage = 1;
  bool isLoading = false;
  List<Pet> petsList = [];
  final ScrollController _scrollController = ScrollController();

  _getTypes() => BlocProvider.of<PetsTypeCubit>(context).getAllTypes();
  // _getPets() => BlocProvider.of<PetsCubit>(context).getPets(currentPage);
  void _onScroll() {
    if (_scrollController.position.atEdge &&
        !_scrollController.position.outOfRange) {
      // At the top of the list, load the previous page
      if (_scrollController.position.pixels == 0 && currentPage > 1) {
        currentPage--;
        _getPetsAndUpdateList();
      }
      // Reached the end of the list, load the next page
      else if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentPage++;
        _getPetsAndUpdateList();
      }
    }
  }

  Future<void> _getPetsAndUpdateList() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final newPets = await _getPets();

      setState(() {
        if (currentPage == 1) {
          // If loading the first page, replace the existing data
          petsList = newPets;
          // petsList = getFilteredPets(newPets);
        } else {
          // If loading subsequent pages, append to the existing data
          petsList.addAll(newPets);
          // petsList.addAll(getFilteredPets(newPets));
        }
        petsList = getFilteredPets(petsList);
        if (petsList.isEmpty && newPets.isNotEmpty) {
          currentPage++;
          _getPetsAndUpdateList();
        }

        isLoading = false;
      });
    }
  }

  Future<List<Pet>> _getPets() async {
    BlocProvider.of<PetsCubit>(context).getPets(currentPage);
    final response = BlocProvider.of<PetsCubit>(context).animalsModel;
    return response?.pets ?? [];
  }

  List<Pet> getFilteredPets(List<Pet> pets) {
    if (type.isEmpty || type == AppStrings.all) {
      return pets;
    } else {
      return pets.where((pet) => pet.type == type).toList();
    }
  }

  @override
  void initState() {
    super.initState();
    _getTypes();
    _getPets();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.pet,
            style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          BlocBuilder<PetsTypeCubit, PetsTypeState>(
            builder: (context, state) {
              if (state is PetsTypeLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              } else if (state is PetsTypeLoaded) {
                List<Types> typesList = state.allpetsType.types!;
                return SizedBox(
                  height: AppSize.s70,
                  child: ListView.builder(
                      itemCount: typesList.length + 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            type = index == 0
                                ? AppStrings.all
                                : typesList[index - 1].name!;
                            print(type);
                          },
                          child: TypeCard(
                            isSelected: selectedIndex == index,
                            title: index == 0
                                ? AppStrings.all
                                : typesList[index - 1].name ??
                                    AppStrings.unknown,
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal),
                );
              } else {
                return Center(
                  child: Text(AppStrings.error,
                      style: TextStyle(
                          color: AppColors.red, fontSize: AppSize.s20)),
                );
              }
            },
          ),
          const Divider(),
          BlocBuilder<PetsCubit, PetsState>(
            builder: (context, state) {
              if (state is PetsLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              } else if (state is PetsLoaded) {
                final filteredPets = getFilteredPets(state.animalsModel.pets!);

                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: filteredPets.length,
                    itemBuilder: (context, index) {
                      if (index == filteredPets.length) {
                        // Loading indicator or end message
                        return isLoading
                            ? const CircularProgressIndicator()
                            : const SizedBox(); // Adjust based on your UI
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetDetailsScreen(
                                        imageUrl: filteredPets[index]
                                                    .primaryPhotoCropped ==
                                                null
                                            ? ''
                                            : filteredPets[index]
                                                .primaryPhotoCropped!
                                                .medium!,
                                        name: filteredPets[index].name ??
                                            AppStrings.pet,
                                        size: filteredPets[index].size ??
                                            AppStrings.unknown,
                                        city: filteredPets[index]
                                                .contact!
                                                .address!
                                                .city ??
                                            '',
                                        country: filteredPets[index]
                                                .contact!
                                                .address!
                                                .country ??
                                            '',
                                        state: filteredPets[index]
                                                .contact!
                                                .address!
                                                .state ??
                                            '',
                                        color: filteredPets[index]
                                                .colors!
                                                .primary ??
                                            AppStrings.unknown,
                                        link: filteredPets[index].url ??
                                            AppStrings.pet,
                                      )),
                            );
                          },
                          child: PetCard(
                            imageUrl:
                                filteredPets[index].primaryPhotoCropped == null
                                    ? ''
                                    : filteredPets[index]
                                        .primaryPhotoCropped!
                                        .small!,
                            name: filteredPets[index].name ?? AppStrings.pet,
                            gender: filteredPets[index].gender ??
                                AppStrings.unknown,
                            type: filteredPets[index].type ?? AppStrings.animal,
                          ),
                        );
                      }
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(AppStrings.error,
                      style: TextStyle(
                          color: AppColors.red, fontSize: AppSize.s20)),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
