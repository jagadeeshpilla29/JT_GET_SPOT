import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/recentPlace_widget.dart';
import 'package:get_spot/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                    CARWASHING), // Replace with your image
              ),
              SizedBox(width: 15),
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.search, color: Colors.grey),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Find Parking',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  // Notification tap handler
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    shape: BoxShape.circle,
                  ),
                  child:
                      Icon(Icons.notifications_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Black 10% section
          Expanded(
            flex: 2, // 1 part for black (10%)
            child: Container(color: Colors.black),
          ),
          // White 90% section
          Expanded(
            flex: 9, // 9 parts for white (90%)
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  SliderWidget(),
                  SizedBox(height: 20),
                  SectionWidget(
                    title: 'Parking Space',
                    options: [
                      'Rent Parking',
                      'Buy Parking',
                      'Book Parking',
                      'Pay Parking'
                    ],
                    images: [
                      RENTPARKING,
                      BUYPARKING,
                      BOOKPARKING,
                      PAYPARKING,
                    ],
                  ),
                  SizedBox(height: 20),
                  SectionWidget(
                    title: 'Lease Plan',
                    options: [
                      'Lease new car',
                      'Lease Bike',
                      'Lease used car',
                      'New Models'
                    ],
                    images: [
                      LEASEBIKE,
                      LEASEBIKE,
                      LEASEUSEDCAR,
                      NEWMODELS,
                    ],
                  ),
                  SizedBox(height: 20),
                  SectionWidget(
                    title: 'GetSpot Services',
                    options: [
                      'Insurance',
                      'Car Washing',
                      'Rent Driver',
                      'EV Rescue'
                    ],
                    images: [
                      INSURANCE,
                      CARWASHING,
                      RENTDRIVER,
                      EVRESCUE,
                    ],
                  ),
                  SizedBox(height: 20),
                  PosterWidget(),
                  SizedBox(height: 20),
                  RecentPlacesWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String>? images; // Optional list of image paths

  SectionWidget({required this.title, required this.options, this.images});

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.Orange)),
             
            ),
        ],
      ),
      GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              images != null && index < images!.length
                  ? Image.asset(
                      images![index],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.local_parking,
                      size: 60,
                      color: AppColor.Black,
                    ),
              SizedBox(height: 5),
              Text(
                options[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    ],
  );
}

}

class PosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          POSTER, 
          fit: BoxFit.cover, 
          width: double.infinity, 
        ),
      ),
    );
  }
}


// class RecentPlacesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Recent Place',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text('See all', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColor.Orange)),
             
//             ),
//           ],
//         ),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Container(
//                 height: 50,
//                 width: 50,
//                 color: Colors.grey[300],
//               ),
//               title: Text('USM Parking Space'),
//               subtitle: Text('2.5 km - \$3.00/h'),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking')),
      body: Center(child: Text('Booking Screen')),
    );
  }
}
