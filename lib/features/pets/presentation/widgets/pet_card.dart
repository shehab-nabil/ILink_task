import 'package:flutter/material.dart';
import 'package:ilink_task/core/utils/app_size.dart';
import 'package:ilink_task/core/utils/app_strings.dart';

class PetCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String gender;
  final String type;

  const PetCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s6),
      ),
      elevation: 3.0,
      margin: const EdgeInsets.all(AppSize.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Container(
              height: AppSize.s100,
              width: AppSize.s100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/paw-1.png', // Replace with your placeholder image path
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/paw-1.png', // Replace with your placeholder image path
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.isNotEmpty ? name : AppStrings.pet,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s18,
                    ),
                  ),
                  const SizedBox(height: AppSize.s6),
                  Text(
                      'Gender: ${gender.isNotEmpty ? gender : AppStrings.unknown}'),
                  Text('Type: ${type.isNotEmpty ? type : AppStrings.animal}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
