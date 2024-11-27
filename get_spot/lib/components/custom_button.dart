import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed; 
  final Widget? destinationPage; 

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.destinationPage,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          onPressed();

          if (destinationPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinationPage!),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE3B54A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
