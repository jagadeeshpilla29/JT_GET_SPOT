import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';

class PriceAndAvailabilityScreen extends StatefulWidget {
  @override
  _PriceAndAvailabilityScreenState createState() =>
      _PriceAndAvailabilityScreenState();
}

class _PriceAndAvailabilityScreenState
    extends State<PriceAndAvailabilityScreen> {
  String selectedDuration = ""; // Track the selected duration
  String startDate = ''; // To store the selected start date
  String endDate = ''; // To store the selected end date
  bool _isSwitchOn = false;
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
          "Rent Your Parking Space",
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
              'Price & Availability',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Duration',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCustomDurationOption('Daily', 87),
                SizedBox(
                  width: 17,
                ),
                _buildCustomDurationOption('Weekly', 102),
                SizedBox(
                  width: 17,
                ),
                _buildCustomDurationOption('Monthly', 108),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildDurationInput('Start Date', true),
                const SizedBox(width: 16),
                _buildDurationInput('End Date', false),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Pricing',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            _buildPricingInput('Enter Price'),
            const SizedBox(height: 12),
            _buildRefundableDepositSwitch(),
            const SizedBox(height: 24),
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
            _buildPhotoUploadContainer(),const SizedBox(height: 8,),
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
                border: Border.all(color: AppColor.yellow,),
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
              // This ensures text takes up only available space
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color:AppColor.Black,
                ),
                overflow:
                    TextOverflow.ellipsis, // Truncate if space is insufficient
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationInput(String label, bool isStartDate) {
    return Container(
      width: 160,
      height: 56,
      decoration: BoxDecoration(
        color:AppColor.White2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                isStartDate
                    ? (startDate.isEmpty ? label : startDate)
                    : (endDate.isEmpty ? label : endDate),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color:AppColor.Black,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined,
                color: Color(0xFF777777)),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  String formattedDate =
                      "${pickedDate.toLocal()}".split(' ')[0];
                  if (isStartDate) {
                    startDate = formattedDate;
                  } else {
                    endDate = formattedDate;
                  }
                });
              }
            },
          ),
        ],
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
            color:AppColor.Black1,
          ),
        ),
      ),
    );
  }

  Widget _buildRefundableDepositSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Text(
            'Refundable Deposit Amount',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.Black,
            ),
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
    activeColor: AppColor.yellow, // Color of the track when the switch is ON
    inactiveTrackColor: AppColor.SwitchBgcolor, // Color of the track when the switch is OFF
    inactiveThumbColor: AppColor.White,
  ),
),

      ],
    );
  }

  Widget _buildPhotoUploadContainer() {
    return DottedBorder(
        color: AppColor.yellow, // Set your desired border color
        strokeWidth: 1, // Line width
        radius: Radius.circular(16), // Border radius
        borderType: BorderType.RRect, // Use a rounded rectangle border
        //padding: EdgeInsets.all(50),  // Optional padding inside the border
        child: Container(
          width: 327,
          height: 148,
          decoration: BoxDecoration(
            color: AppColor.White, // Background color inside the border
            borderRadius: BorderRadius.circular(
                16), // Make sure the inner container has rounded corners
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
                    // You can access the selected file(s) path:
                    String? filePath = result.files.single.path;
                    print("Selected file path: $filePath");
                    // Add logic to preview or upload the image
                  } else {
                    // User canceled the picker
                    print("No file selected.");
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/image.png',
                        width: 32, height: 32),
                    const SizedBox(height: 10),
                    const Text(
                      'Drop your image here or Browse',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF333333),
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
