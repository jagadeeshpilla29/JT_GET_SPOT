import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';

class UploadPhotosScreen extends StatefulWidget {
  @override
  _PriceAndAvailabilityScreenState createState() =>
      _PriceAndAvailabilityScreenState();
}

class _PriceAndAvailabilityScreenState
    extends State<UploadPhotosScreen> {
  String selectedDuration = ""; 
  String startDate = ''; 
  String endDate = ''; 
  bool _isSwitchOn = false;
  TextEditingController _depositController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  get mobileNumberController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.White,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Buy Sell Parking Space",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: AppColor.White,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Upload Photos',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            const SizedBox(
              height: 8,
            ),
            _buildPhotoUploadContainer(),
            const SizedBox(height: 8,),
            Text(
              'Ensure clear images of the parking spot, entrance, and surroundings',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Pricing',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            _buildPricingInput('Enter Sell Price'),
            const SizedBox(height: 12),
            _buildRefundableDepositSwitch(),
            const SizedBox(height: 24),
            Text(
              'Contact Information',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                counterText: '',
                fillColor: AppColor.White2,
                filled: true,
                border: InputBorder.none,
                hintText: 'Enter Phone Number',
                hintStyle: TextStyle(
                  color: AppColor.grey,
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/phone.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
              style: TextStyle(color: AppColor.Black),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                counterText: '',
                fillColor: AppColor.White2,
                filled: true,
                border: InputBorder.none,
                hintText: 'Enter Email Address',
                hintStyle: TextStyle(
                  color: AppColor.grey,
                  fontSize: 16,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/mail2.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
              style: TextStyle(color: AppColor.Black),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                final emailRegex =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              buttonText: 'Continue',
              onPressed: () {},
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingInput(String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      decoration: BoxDecoration(
        color: AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hintText,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.Black1,
          ),
        ),
      ),
    );
  }

  Widget _buildRefundableDepositSwitch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Refundable Deposit Amount',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                value: _isSwitchOn,
                onChanged: (newValue) {
                  setState(() {
                    _isSwitchOn = newValue;
                  });
                },
                activeColor: AppColor.yellow,
                inactiveTrackColor: AppColor.SwitchBgcolor,
                inactiveThumbColor: Colors.white,
                thumbColor: MaterialStateProperty.all(Colors.white),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
        if (_isSwitchOn)
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: double.infinity,
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _depositController,
                    decoration: InputDecoration(
                      hintText: 'Enter Refundable Deposit Amount',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF777777),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_isSwitchOn)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Advance amount is kept safe with GetSpot App, Only users confirm it is released to Renter',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: Color(0xFF777777),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPhotoUploadContainer() {
    return DottedBorder(
        color: AppColor.yellow,
        strokeWidth: 1,
        radius: Radius.circular(16),
        borderType: BorderType.RRect,
        child: Container(
          width: 327,
          height: 148,
          decoration: BoxDecoration(
            color: AppColor.White,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );

                  if (result != null) {
                    String? filePath = result.files.single.path;
                    print("Selected file path: $filePath");
                  } else {
                    print("No file selected.");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/image.png',
                        width: 32, height: 32),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Drop your image here or ',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF333333),
                            ),
                          ),
                          TextSpan(
                            text: 'Browse',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColor.yellow,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Supported: JPG, PNG',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColor.Black1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
