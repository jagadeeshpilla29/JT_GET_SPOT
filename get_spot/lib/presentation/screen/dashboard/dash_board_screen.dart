import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/presentation/screen/buy/buy_sell_parking_space_list.dart';
import 'package:get_spot/presentation/screen/sell/parking_space_detali_screen.dart';
import 'package:get_spot/widgets/recentPlace_widget.dart';
import 'package:get_spot/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: _appBar(),
      ),
      body: Scaffold(
        backgroundColor: AppColor.White,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(height: 100, color: AppColor.Black),
                  Container(height: 100, color: AppColor.White),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: AppColor.White,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16.0),
                      shrinkWrap: true,
                      children: [
                        _buildSection('Parking Space', ['Rent\nParking', 'Buy\nParking', 'Book\nParking', 'Pay\nParking'], [RENTPARKING, BUYPARKING, BOOKPARKING, PAYPARKING], context),
                        _buildSection('Lease Plan', ['Lease new\ncar', 'Lease\nBike', 'Lease used\ncar', 'New\nModels'], [LEASENEWCAR, LEASEBIKE, LEASEUSEDCAR, NEWMODELS], context),
                        _buildSection('GetSpot Services', ['Insurance', 'Car Washing', 'Rent Driver', 'EV Rescue'], [INSURANCE, CARWASHING, RENTDRIVER, EVRESCUE], context),
                        const SizedBox(height: 20),
                        PosterWidget(),
                        const SizedBox(height: 20),
                        RecentPlacesWidget(),
                         const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(left: 16, right: 16, child: SliderWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: AppColor.Black,
      elevation: 0,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(PROFILEIMG, width: 45, height: 45, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(color: AppColor.black2, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    ClipRRect(
                      child: Image.asset(SEARCH, width: 16, height: 16, fit: BoxFit.cover),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: AppColor.White2),
                        decoration: InputDecoration(
                          hintText: 'Find Parking',
                          hintStyle: TextStyle(color: AppColor.White2, fontFamily: 'Poppins', fontSize: 16.0),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(NOTIFICATION, width: 45, height: 45, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> options, List<String> images, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyle(fontSize: 13, fontFamily: 'Poppins', fontWeight: FontWeight.w600, color: AppColor.Orange)),
            ),
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToScreen(context, options[index]);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  index < images.length
                      ? Image.asset(images[index], height: 60, width: 60, fit: BoxFit.cover)
                      : Icon(Icons.local_parking, size: 60, color: AppColor.Black),
                  const SizedBox(height: 5),
                  Text(options[index], textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontFamily: 'Poppins')),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  void _navigateToScreen(BuildContext context, String option) {
    switch (option) {
      case 'Rent\nParking':
      print('RentParking');
        Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingSpaceDetailScreen()));
        break;
      case 'Buy\nParking':
            print('BuyParking');
        Navigator.push(context, MaterialPageRoute(builder: (context) => BuySellParkingSpaceListScreen()));
        break;
      case 'Book\nParking':
      print('BookParking');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Pay\nParking':
      print('PayParking');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Lease new\ncar':
      print('Lease new car');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Lease\nBike':
      print('lease bike ');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Lease used\ncar':
      print('lease used car');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'New\nModels':
      print('new models');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Insurance':
      print('insurance');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Car Washing':
      print('car washing');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'Rent Driver':
      print('rent driver');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      case 'EV Rescue':
      print('ev rescue');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => RentParkingScreen()));
        break;
      default:
        print('No screen defined for $option');
    }
  }
}


class PosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: AppColor.Black, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              POSTER,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enjoy 50% off on\nParking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.White,
                  ),
                ),
                   Text(
                  'Don\'t miss out-book\nyour spot today',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey,
                    
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your button action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.White, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Book now',
                    style: TextStyle(
                      fontSize: 16,
                      color:AppColor.Black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

