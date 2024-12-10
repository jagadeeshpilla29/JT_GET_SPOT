import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/filter/%20dropdown_field.dart';
import 'package:get_spot/widgets/filter/amenities_section.dart';
import 'package:get_spot/widgets/filter/location_radius_slider.dart';
import 'package:get_spot/widgets/filter/price_slider.dart';
import 'package:get_spot/widgets/filter/searchbylocation.dart';
import 'package:get_spot/widgets/filter/vehicle_size_section.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _amenitiesController = TextEditingController();

  double _locationRadius = 0; // Location Radius Slider state
  double _priceRange = 0; // Price Slider state
  String? _selectedCity = ''; // City dropdown state
  String? _selectedState = ''; // State dropdown state
  String? _selectedCountry = ''; // Country dropdown state
  String? _selectedSpaceType = ''; // Space Type dropdown state
  List<bool> _selectedAmenities = [false, false, false, false]; // Amenity states
  List<bool> _selectedVehicleSizes = [false, false, false, false]; // Vehicle size states

  // Reset filters to their default state
  void _resetFilters() {
    setState(() {
      _locationController.clear();
      _pincodeController.clear();
      _amenitiesController.clear();
      _locationRadius = 0;
      _priceRange = 0;
      _selectedCity = '';
      _selectedState = '';
      _selectedCountry = '';
      _selectedSpaceType = '';
      _selectedAmenities = List<bool>.filled(_selectedAmenities.length, false);
      _selectedVehicleSizes = List<bool>.filled(_selectedVehicleSizes.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: AppColor.White,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColor.White,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Radius Slider
            LocationRadiusSlider(
              radius: _locationRadius,
              onChanged: (value) => setState(() => _locationRadius = value),
            ),
            const SizedBox(height: 16),
            
            // Location Search Field
            LocationSearchField(
              hintText: 'Search by Location',
              controller: _locationController,
            ),
            const SizedBox(height: 16),
            
            // City and State Dropdowns in a Row
            Row(
              children: [
                Expanded(
                  child: DropdownField(
                    hintText: 'City',
                    value: _selectedCity,
                    onChanged: (value) => setState(() => _selectedCity = value),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownField(
                    hintText: 'State',
                    value: _selectedState,
                    onChanged: (value) => setState(() => _selectedState = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Country and Pincode Dropdowns in a Row
            Row(
              children: [
                Expanded(
                  child: DropdownField(
                    hintText: 'Country',
                    value: _selectedCountry,
                    onChanged: (value) => setState(() => _selectedCountry = value),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: LocationSearchField(
                    hintText: 'Pincode',
                    controller: _pincodeController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Price Slider
            PriceSlider(
              values: RangeValues(0, _priceRange),
              onChanged: (values) => setState(() => _priceRange = values.end),
            ),
            const SizedBox(height: 16),
            
            // Space Type Dropdown
            DropdownField(
              hintText: 'Space Type',
              value: _selectedSpaceType,
              onChanged: (value) => setState(() => _selectedSpaceType = value),
            ),
            const SizedBox(height: 16),
            
            // Amenities Section
            AmenitiesSection(
              selectedAmenities: _selectedAmenities,
              onChanged: (index, value) {
                setState(() => _selectedAmenities[index] = value);
              },
            ),
            const SizedBox(height: 16),
            
            // Other Amenities Search Field
            LocationSearchField(
              hintText: 'Enter Other Amenities',
              controller: _amenitiesController,
            ),
            const SizedBox(height: 16),
            
            // Vehicle Size Section
            VehicleSizeSection(
              selectedSizes: _selectedVehicleSizes,
              onChanged: (index, value) {
                setState(() => _selectedVehicleSizes[index] = value);
              },
            ),
            const SizedBox(height: 32),
            
            // Reset and Apply Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _resetFilters,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.PrimaryColor,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Reset Filter'),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {
                    // Logic to apply filters goes here
                  },
                  child: Image.asset(
                    APPLYBUTTON,
                    width: 100,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
