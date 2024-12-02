import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';

class RentParkingSpaceScreen extends StatefulWidget {
  @override
  _RentParkingSpaceScreenState createState() => _RentParkingSpaceScreenState();
}

class _RentParkingSpaceScreenState extends State<RentParkingSpaceScreen> {
  final Map<String, dynamic> parkingSpace = {
    'name': 'Downtown Garage',
    'location': '47 W 13th St, New York',
    'price': 1000,
    'image': 'assets/images/garage1.png',
    'isFavorited': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.White,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Rent Parking Space',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.White2,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search box
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45, // Set the height of the search box
                    decoration: BoxDecoration(
                      color: AppColor.White, // Set background color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                            color: Colors
                                .grey), // Optional: to style the hint text
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(
                              12.0), // Add padding for better alignment
                          child: Image.asset(
                            SEARCH, // Replace with your custom filter icon image
                            width: 20, // Set the width of the icon
                            height: 20, // Set the height of the icon
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Handle the filter icon tap event
                  },
                  child: Image.asset(
                    FILTER, // Replace with your custom filter icon image
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            // "List" text
            Text(
              'List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.Black,
              ),
            ),
            const SizedBox(height: 16),
            // Parking space card
            Card(
              color: AppColor.White2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                height: 138, // Set a fixed height for the card
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image covering full card height
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.asset(
                        parkingSpace['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Parking Space Name and Favorite Icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    parkingSpace['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    parkingSpace['isFavorited']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: parkingSpace['isFavorited']
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      parkingSpace['isFavorited'] =
                                          !parkingSpace['isFavorited'];
                                    });
                                  },
                                ),
                              ],
                            ),
                            // Location Text
                            Row(
                              children: [
                                Image.asset(
                                  RENTLOCATION, // Path to your custom image icon
                                  height:
                                      16, // Adjust the size to match the text
                                  width: 16,
                                  fit: BoxFit
                                      .contain, // Ensure the image fits properly
                                ),
                                const SizedBox(
                                    width: 4), // Space between image and text
                                Expanded(
                                  child: Text(
                                    parkingSpace['location'],
                                    style: TextStyle(
                                      color: AppColor.Black,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Price as RichText
                            RichText(
                              text: TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.PrimaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${parkingSpace['price']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.PrimaryColor,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '/week',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            // Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Book Visit'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.PrimaryColor,
                                    foregroundColor: AppColor.Black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    minimumSize: const Size(82, 32),
                                    padding:
                                        EdgeInsets.zero, // Remove extra padding
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View Contact',
                                    style:
                                        TextStyle(color: AppColor.PrimaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
