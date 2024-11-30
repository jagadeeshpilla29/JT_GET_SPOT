import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';

class RecentPlacesWidget extends StatelessWidget {
  final List<Map<String, dynamic>> recentPlaces = [
    {
      'title': 'USM Parking Space',
      'distance': '2.5 km',
      'price': '\$3.00/h',
      'image': RECENTPLACE,
    },
    {
      'title': 'Central Park Space',
      'distance': '3.0 km',
      'price': '\$4.00/h',
      'image': RECENTPLACE,
    },
    {
      'title': 'Downtown Garage',
      'distance': '1.8 km',
      'price': '\$2.50/h',
      'image': RECENTPLACE,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Place',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {
                // Add navigation to the "See All" page
              },
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColor.Orange,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200, // Adjust height for larger cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recentPlaces.length,
            itemBuilder: (context, index) {
              final place = recentPlaces[index];
              return Container(
                width: 300, // Adjust card width
                margin: EdgeInsets.only(
                    left: 16, right: index == recentPlaces.length - 1 ? 16 : 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(
                        0.1), // Border color with slight transparency
                    width: 1, // Thickness of the border
                  ),
                  // borderRadius: BorderRadius.circular(
                  //     12), // Optional: Keep rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Text(
                        place['title'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            place['distance'],
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              place['price'],
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image section with reduced width
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: FractionallySizedBox(
                            widthFactor:
                                1, // Reduce the width to 80% of the container
                            child: Image.asset(
                              place['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
