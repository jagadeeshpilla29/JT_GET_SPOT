import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';

class PriceSlider extends StatelessWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;

  const PriceSlider({super.key, 
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
        RangeSlider(
          values: values,
          min: 0,
          max: 10000,
          divisions: 10,
          activeColor: AppColor.PrimaryColor,
          labels: RangeLabels(
            '\$${RangeValues(0, values.end).start.round()}',
            '\$${RangeValues(0, values.end).end.round()}',
          ),
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('\$0'), // Minimum value
            Text(
              '\$${RangeValues(0, values.end).start.round()}', // Current start value
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${RangeValues(0, values.end).end.round()}', // Current end value
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('\$10,000'), // Maximum value
          ],
        ),
      ],
    );
  }
}
