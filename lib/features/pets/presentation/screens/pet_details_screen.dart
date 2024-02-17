import 'package:flutter/material.dart';
import 'package:ilink_task/core/utils/app_colors.dart';
import 'package:ilink_task/core/utils/app_size.dart';
import 'package:ilink_task/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class PetDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String size;
  final String city;
  final String state;
  final String country;
  final String color;
  final String link;

  const PetDetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.size,
      required this.color,
      required this.link,
      required this.city,
      required this.state,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.petDetails,
            style: TextStyle(fontWeight: FontWeight.w700)),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(AppSize.s16),
              height: AppSize.s300,
              width: AppSize.s300,
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
            Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name.isNotEmpty ? name : AppStrings.pet,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s18,
                    ),
                  ),
                  const SizedBox(height: AppSize.s8),
                  Text(
                    'Size: ${size.isNotEmpty ? size : AppStrings.unknown}',
                  ),
                  Text('Address: $city , $state, $country'),
                  Text(
                      'Color: ${color.isNotEmpty ? color : AppStrings.unknown}'),
                  const SizedBox(height: AppSize.s16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await canLaunch(link)) {
                          await launch(link);
                        } else {
                          // Handle error, for example, show an alert
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not launch $link'),
                            ),
                          );
                        }
                      },
                      child: const Text("Pet's Website"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
