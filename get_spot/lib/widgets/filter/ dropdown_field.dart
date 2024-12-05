import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';

class DropdownField extends StatelessWidget {
  final String hintText;
  final List<String>? options;
  final String? dropdownIconPath;
  final String? value;
  final Function(String?)? onChanged;

  const DropdownField({
    required this.hintText, 
    this.options, 
    this.dropdownIconPath,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value?.isNotEmpty == true ? value : null, // Safe null check
      items: (options ?? ['Option 1', 'Option 2', 'Option 3']).map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged, // Call the passed onChanged callback
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.White2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Image.asset(
          DROPDOWN , // Keep the dropdown icon image
          width: 10,
          height: 5.65,
        ),
      ),
      icon: SizedBox.shrink(), // Remove the default arrow
      hint: Center(
        child: Text(
          hintText,
          style: TextStyle(
            color: AppColor.grey, // Customize the hint text color
          ),
        ),
      ),
    );
  }
}
