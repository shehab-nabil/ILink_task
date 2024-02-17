import 'package:flutter/material.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_cubit/pets_cubit.dart';
import 'package:ilink_task/features/pets/presentation/cubit/pets_type_cubit/pets_type_cubit.dart';
import 'package:ilink_task/features/pets/presentation/screens/pets_screen.dart';
import 'package:ilink_task/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsTask extends StatelessWidget {
  const PetsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PetsCubit>(create: (context) => sl<PetsCubit>()),
          BlocProvider<PetsTypeCubit>(create: (context) => sl<PetsTypeCubit>()),
        ],
        child: const PetsScreen(),
      ),
    );
  }
}
