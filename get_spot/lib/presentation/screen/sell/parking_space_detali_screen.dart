import 'package:flutter/material.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';

class ParkingSpaceDetailScreen extends StatelessWidget {
  const ParkingSpaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Rent Your Parking Space",
          style: TextStyle(
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColor.White,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Parking Space Detail",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins',
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Parking Space Name'),
            const SizedBox(height: 16),
            _buildTextField('Choose on the map'),
            const SizedBox(height: 16),
            _buildTextField('Address'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField('City', 157.5, showIcon: true),
                const SizedBox(width: 16),
                _buildInputField('State', 157.5, showIcon: true),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField('Country', 157.5, showIcon: true),
                const SizedBox(width: 16),
                _buildInputField('Pin Code', 157.5, showIcon: false),
              ],
            ),

            const SizedBox(height: 16),
            Container(
              height: 86,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.White2,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColor.Black,
                  ),
                ),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              child: const Text(
                'Space Type',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spaceField(
                    context, const AssetImage('assets/images/garage.png'), 'Garage'),
                const SizedBox(width: 16),
                _spaceField(context, const AssetImage('assets/images/driveway.png'),
                    'Driveway'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spaceField(context, const AssetImage('assets/images/openlot.png'),
                    'Open Lot'),
                const SizedBox(width: 16),
                _spaceField(
                    context,
                    const AssetImage('assets/images/coveredspace.png'),
                    'Covered Space'),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
                buttonText: 'Continue', onPressed: () {  }, ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _spaceField(BuildContext context, ImageProvider image, String text) {
    return Container(
      width: 155.5,
      height: 113,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildInputField(String label, double width, {bool showIcon = true}) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            Icon(
              Icons.arrow_drop_down_outlined,
              size: 24,
              color: AppColor.Black,
            ),
        ],
      ),
    );
  }
}
