import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';

class AmenitiesSection extends StatelessWidget {
  final List<bool> selectedAmenities;
  final Function(int, bool) onChanged;

   AmenitiesSection({super.key, 
    required this.selectedAmenities,
    required this.onChanged,
  });

  final List<String> amenities = [
    'Security (CCTV, guard)',
    'Covered Parking',
    'Gated Community',
    'Charging Station',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Amenities', style: TextStyle(fontWeight: FontWeight.bold)),
        Column(
          children: List.generate(amenities.length, (index) {
            return Row(
              children: [
                Transform.scale(
                  scale: 0.8, // Reduce the size of the checkbox
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Adjust radius
                    ),
                    side: BorderSide(color: AppColor.grey),
                    value: selectedAmenities[index],
                    onChanged: (value) {
                      onChanged(index, value ?? false);
                    },
                    activeColor: AppColor.PrimaryColor, // Color for selected state
                    checkColor: AppColor.White, // Color for the check icon
                  ),
                ),
                Expanded(
                  child: Text(
                    amenities[index],
                    style: TextStyle(
                      color: selectedAmenities[index] ? AppColor.PrimaryColor : AppColor.Black, // Text color changes on select
                      fontWeight: selectedAmenities[index] ? FontWeight.bold : FontWeight.normal, // Bold if selected
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
