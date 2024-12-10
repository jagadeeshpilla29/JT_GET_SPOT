import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class DialerButton extends StatelessWidget {
  final String phoneNumber;

  // Constructor to accept the phone number
  const DialerButton({super.key, required this.phoneNumber});

  // Function to launch the dialer with the provided phone number
  _launchDialer() async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    
    try {
      // Check if the dialer can be launched
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch dialer with phone number $phoneNumber';
      }
    } catch (e) {
      // Show an error message if something goes wrong
      print('Error launching dialer: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.phone, color: AppColor.grey), // Phone icon
      onPressed: _launchDialer, // Trigger dialer launch
    );
  }
}
