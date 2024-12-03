import 'package:flutter/material.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/presentation/screen/rent%20your%20parking%20space/price_and_availability_screen.dart';

class buyParkingSpaceDetailScreen extends StatefulWidget {
  @override
  _ParkingSpaceDetailScreenState createState() => _ParkingSpaceDetailScreenState();
}

class _ParkingSpaceDetailScreenState extends State<buyParkingSpaceDetailScreen> {
  String selectedButton = "Sell"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 355,
                    height: 48,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColor.White,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.Black.withOpacity(0.08),
                          offset: Offset(0, 4),
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedButton = "Buy";
                            });
                          },
                          child: Container(
                            width: 155.5,
                            height: 32,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedButton == "Buy"
                                  ? AppColor.yellow 
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Buy',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    height: 1.5,
                                    color: selectedButton == "Buy"
                                        ? AppColor.Black 
                                        : AppColor.Black1
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedButton = "Sell";
                            });
                          },
                          child: Container(
                            width: 155.5,
                            height: 40,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedButton == "Sell"
                                  ? AppColor.yellow // Yellow when selected
                                  : Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.Black,
                                  offset: Offset(0, -1),
                                  blurRadius: 4,
                                ),
                                BoxShadow(
                                  color: AppColor.Black,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sell',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    height: 1.5,
                                    color: selectedButton == "Sell"
                                        ? AppColor.Black
                                        : AppColor.Black1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Parking Space Detail",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Parking Space Name'),
            const SizedBox(height: 16),
            _buildMapField('Choose on the map'),
            const SizedBox(height: 16),
            _buildTextField('Address'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField('City', 157.5),
                SizedBox(width: 16),
                _buildInputField('State', 157.5),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField('Country', 157.5),
                SizedBox(width: 16),
                _buildInputField('Pin Code', 157.5, showIcon: false),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 86,
              padding: EdgeInsets.symmetric(horizontal: 16),
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
            Text(
              'Space Type',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spaceField(
                    context, AssetImage('assets/images/garage.png'), 'Garage'),
                SizedBox(width: 16),
                _spaceField(context, AssetImage('assets/images/driveway.png'),
                    'Driveway'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _spaceField(context, AssetImage('assets/images/openlot.png'),
                    'Open Lot'),
                SizedBox(width: 16),
                _spaceField(
                    context,
                    AssetImage('assets/images/coveredspace.png'),
                    'Covered Space'),
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
  buttonText: 'Continue',
  onPressed: () {
    ();
  },
),

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
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:  AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 14),
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
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColor.Black,
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
      padding: EdgeInsets.symmetric(horizontal: 16),
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

  Widget _buildMapField(String label) {
    return Container(
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
          IconButton(
            onPressed: () {
              print("Choose on the map pressed");
            },
            icon: Image.asset(
              'assets/images/loc1.png', 
              width: 24, 
              height: 24, 
            ),
            tooltip: "Choose on the map",
          ),
        ],
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
