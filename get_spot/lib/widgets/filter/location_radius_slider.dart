import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';

class LocationRadiusSlider extends StatelessWidget {
  final double radius;
  final Function(double) onChanged;

  const LocationRadiusSlider({super.key, 
    required this.radius,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location Radius',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Slider(
          value: radius,
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: AppColor.PrimaryColor,
          label: '${radius.round()}km',
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('0km'),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${radius.round()}km',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.PrimaryColor,
                  ),
                ),
              ),
            ),
            const Text('10km'),
          ],
        ),
      ],
    );
  }
}
