import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';

class VehicleSizeSection extends StatelessWidget {
  final List<bool> selectedSizes;
  final Function(int, bool) onChanged;

  const VehicleSizeSection({super.key, 
    required this.selectedSizes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> vehicleSizes = ['Compact', 'Sedan', 'SUV', 'Truck'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vehicle Size Compatibility',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: Row(
            children: List.generate(vehicleSizes.length, (index) {
              return Row(
                children: [
                  Transform.scale(
                    scale: 0.8, // Reduce the size of the checkbox
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // Adjust radius
                      ),
                      value: selectedSizes[index],
                      side: BorderSide(color: AppColor.grey),
                      onChanged: (value) {
                        onChanged(index, value ?? false);
                      },
                      activeColor: AppColor.PrimaryColor, // Color for selected state
                      checkColor: AppColor.White, // Color for the check icon
                    ),
                  ),
                  Text(
                    vehicleSizes[index],
                    style: TextStyle(
                      color: selectedSizes[index] ? AppColor.PrimaryColor: AppColor.Black, // Change text color when selected
                      fontWeight: selectedSizes[index] ? FontWeight.bold : FontWeight.normal, // Bold if selected
                    ),
                  ),
                  const SizedBox(width: 16), // Space between each checkbox item
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
