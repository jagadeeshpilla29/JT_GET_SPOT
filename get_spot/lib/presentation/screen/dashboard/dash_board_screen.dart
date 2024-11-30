import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/widgets/recentPlace_widget.dart';
import 'package:get_spot/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _appBar(),
              Expanded(
                flex: 2,
                child: Container(color:AppColor.Black),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: AppColor.White,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: AppColor.White,
                  child: ListView(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 16.0, right: 16.0),
                    children: [
                      const SizedBox(height: 10),
                      SectionWidget(
                        title: 'Parking Space',
                        options: const [
                          'Rent\nParking',
                          'Buy\nParking',
                          'Book\nParking',
                          'Pay\nParking'
                        ],
                        images: const [
                          RENTPARKING,
                          BUYPARKING,
                          BOOKPARKING,
                          PAYPARKING,
                        ],
                      ),
                      const SizedBox(height: 10),
                      SectionWidget(
                        title: 'Lease Plan',
                        options: const [
                          'Lease new\ncar',
                          'Lease\nBike',
                          'Lease used\ncar',
                          'New\nModels'
                        ],
                        images: const [
                          LEASENEWCAR,
                          LEASEBIKE,
                          LEASEUSEDCAR,
                          NEWMODELS,
                        ],
                      ),
                      const SizedBox(height: 10),
                      SectionWidget(
                        title: 'GetSpot Services',
                        options: const [
                          'Insurance',
                          'Car Washing',
                          'Rent Driver',
                          'EV Rescue'
                        ],
                        images: const [
                          INSURANCE,
                          CARWASHING,
                          RENTDRIVER,
                          EVRESCUE,
                        ],
                      ),
                      const SizedBox(height: 20),
                      PosterWidget(),
                      const SizedBox(height: 20),
                      RecentPlacesWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 180,
            left: 16,
            right: 16,
            child: SliderWidget(),
          ),
        ],
      ),
    );
  }
}

_appBar() {
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
            child: Image.asset(
              'assets/images/profileimg.png',
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColor.black2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  ClipRRect(
                    // borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      SEARCH,
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: AppColor.White2),
                      decoration: InputDecoration(
                        hintText: 'Find Parking',
                        hintStyle: TextStyle(
                          color: AppColor.White2,
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
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
              child: Image.asset(
                NOTIFICATION,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String>? images;

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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See all',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColor.Orange)),
            ),
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 5),
                Text(
                  options[index],
                  textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 12,fontFamily: 'Poppins',),
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
        color: AppColor.Black,
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


