import 'package:flutter/material.dart';
import 'package:ilink_task/core/utils/app_colors.dart';
import 'package:ilink_task/core/utils/app_size.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSize.s8),
      padding: const EdgeInsets.all(AppSize.s16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : null,
        border: Border.all(
          color: AppColors.primary,
          width: 2.0,
        ),
        borderRadius:
            BorderRadius.circular(AppSize.s8), // Set the border radius here
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: AppSize.s14),
        ),
      ),
    );
  }
}
