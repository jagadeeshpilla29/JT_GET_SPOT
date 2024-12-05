import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';

class LocationSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  LocationSearchField({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.grey),
        filled: true,
        fillColor: AppColor.White2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
