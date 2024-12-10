import 'package:flutter/material.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Refer a Friend',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true, // Centers the title
        backgroundColor: Colors.blue, // Customize your app bar color
      ),
      body: const Center(
        child: Text(
          'Refer a Friend Page Content',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
