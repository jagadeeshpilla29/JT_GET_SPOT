import 'package:flutter/material.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';

class AdditionalFeaturesScreen extends StatefulWidget {
  @override
  _AdditionalFeaturesScreenState createState() =>
      _AdditionalFeaturesScreenState();
}

class _AdditionalFeaturesScreenState extends State<AdditionalFeaturesScreen> {
  final Map<String, bool> _featuresState = {
    'Security (CCTV, guard)': true,
    'Covered Parking': true,
    'Gated Community': true,
    'Charging Station': true,
  };

  final Map<String, bool> _promote = {
    'Promote my listing for ₹99/month': false,
  };

  final Map<String, bool> _vehicleSizeCompatibility = {
    'Compact': false,
    'Sedan': false,
    'SUV': false,
    'Truck': false,
  };

  String selectedDuration = '';
  TextEditingController _otherAmenitiesController = TextEditingController();
  List<String> dynamicAmenities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Buy Sell Parking Space",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColor.White,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Additional Features',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Amenities',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            ...dynamicAmenities.map((amenity) {
              return Column(
                children: [
                  CustomFrame(
                    label: amenity,
                    isChecked: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                ],
              );
            }).toList(),
            ..._featuresState.keys.map((label) {
              return Column(
                children: [
                  CustomFrame(
                    label: label,
                    isChecked: _featuresState[label] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _featuresState[label] = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              );
            }).toList(),
            TextFormField(
              controller: _otherAmenitiesController,
              decoration: InputDecoration(
                labelText: "Enter Other Amenities",
                filled: true,
                fillColor: AppColor.containergray,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              ),
              onChanged: (text) {},
              onFieldSubmitted: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    dynamicAmenities.add(text.trim());
                    _otherAmenitiesController.clear();
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Vehicle Size Compatibility',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColor.Black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _vehicleSizeCompatibility.keys.map((label) {
                int index =
                    _vehicleSizeCompatibility.keys.toList().indexOf(label);
                return Row(
                  children: [
                    CustomFrame(
                      label: label,
                      isChecked: _vehicleSizeCompatibility[label] ?? false,
                      onChanged: (value) {
                        setState(() {
                          _vehicleSizeCompatibility[label] = value;
                        });
                      },
                    ),
                    if (index < _vehicleSizeCompatibility.keys.length - 1)
                      const SizedBox(width: 17.67),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Dimension',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColor.Black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField('Height', 157.5, showIcon: true),
                SizedBox(width: 12),
                _buildInputField('Width', 157.5, showIcon: true),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildCustomDurationOption('Broker', 104),
                SizedBox(width: 20),
                _buildCustomDurationOption('Owner', 106),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: 226,
              height: 41,
              decoration: BoxDecoration(
                color: Color(0xFFFFFCF4),
                border: Border.all(
                  color:AppColor.yellow,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Free trial ends in 3 months',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.5,
                      color: AppColor.yellow,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Huge-icon.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '₹20 per listing after the trial period ends.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.5,
                        color: AppColor.Black1
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ..._promote.keys.map((label) {
              return Column(
                children: [
                  CustomFrame(
                    label: label,
                    isChecked: _promote[label] ?? false,
                    onChanged: (value) {
                      setState(() {
                        _promote[label] = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              );
            }),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'List My Space',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomDurationOption(String label, double width) {
    bool isSelected = selectedDuration == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDuration = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: .0),
        width: width,
        height: 42,
        decoration: BoxDecoration(
          color: AppColor.White,
          border: Border.all(
            color: isSelected ? AppColor.yellow : AppColor.GreyShadow,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.yellow),
              ),
              child: isSelected
                  ? Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.yellow,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.Black,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double width, {bool showIcon = true}) {
    return Container(
      width: width,
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
              ),
            ),
          ),
          if (showIcon)
            Image.asset(
              'assets/images/down_arrow_drop.png',
              height: 24,
              width: 24,
            ),
        ],
      ),
    );
  }
}

class CustomFrame extends StatelessWidget {
  final String label;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomFrame({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            child: Icon(
              isChecked ? Icons.check : Icons.check_box_outline_blank,
              size: 16.0,
              color: const Color(0xFF8C8C8C),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.5,
              color: AppColor.Black,
            ),
          ),
        ],
      ),
    );
  }
}
