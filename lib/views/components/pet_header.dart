import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../data/models/pet_model.dart';
import '../../data/types/gender_type.dart';

class PetHeader extends StatelessWidget {
  const PetHeader({
    super.key,
    required this.pet,
  });

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.2,
          height: size.width * 0.2,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(pet.photoUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      pet.gender == GenderType.male ? Icons.male : Icons.female,
                      color: pet.gender == GenderType.male
                          ? AppColors.blueMedium
                          : AppColors.pink,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: size.height * 0.04,
                  ),
                ],
              ),
              Text(
                pet.breed,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_outlined,
              size: size.height * .035,
            ),
          ),
        ),
      ],
    );
  }
}
