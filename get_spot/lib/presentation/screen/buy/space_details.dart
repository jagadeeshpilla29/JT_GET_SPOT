import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/presentation/screen/buy/chat_screen.dart';
import 'package:get_spot/presentation/screen/buy/filter_screen.dart';

class SpaceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Details'),
        backgroundColor: AppColor.White,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: SizedBox(height: 20),
        ),
      ),
      backgroundColor: AppColor.White,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageGallery(),
            DetailsSection(),
            AmenitiesList(),
            DescriptionSection(),
            BottomButtons(),
          ],
        ),
      ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  String selectedImage = 'assets/images/garage1.png';

  final List<String> thumbnails = [
    'assets/images/garage0.png',
    CARWASHING,
    'assets/images/garage2.png',
    'assets/images/garage3.png',
    'assets/images/garage4.png',
    'assets/images/garage5.png',
    'assets/images/garage6.png',
    CARWASHING,
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              selectedImage,
              height: 274,
              width: 327,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 66,
              width: 303,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5, // Show only the first 5 thumbnails
                  (index) {
                    if (index < 4) {
                      // Display regular thumbnails
                      return GestureDetector(
                        onTap: () {
                          // Update selected image on tap
                          setState(() {
                            selectedImage = thumbnails[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                            child: Image.asset(
                              thumbnails[index],
                              height: 54,
                              width: 53.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Display the "number" for additional thumbnails
                      return GestureDetector(
                        onTap: () {
                          // Show a dialog or handle action for remaining images
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 10,
                                  children: thumbnails.sublist(5).map((image) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Update selected image on tap
                                        setState(() {
                                          selectedImage = image;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          image,
                                          height: 54,
                                          width: 53.4,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 54,
                          width: 53.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                                0.7), // Semi-transparent background
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '+${thumbnails.length - 5}', // Remaining image count
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Downtown Garage',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(60, 27),
                  side: BorderSide(color: AppColor.PrimaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      RENTLOCATION,
                      height: 16,
                      width: 16,
                      color: AppColor.PrimaryColor,
                    ),
                    SizedBox(width: 20),
                    Center(
                      child: Text(
                        'View on Map',
                        style: TextStyle(
                            color: AppColor.PrimaryColor,
                            fontSize: 10,
                            fontFamily: 'Poppins'), // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              // Replace the Icon with an image
              Image.asset(
                RENTLOCATION, // Your location icon image
                height: 16, // Adjust size as needed
                width: 16,
                color: AppColor.PrimaryColor,
              ),
              SizedBox(width: 5),
              Text(
                'New York, USA',
                style: TextStyle(color: AppColor.Black),
              ),
              // Spacer(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('For Sale', style: TextStyle(color: AppColor.Black)),
              Spacer(),
              Text('\$10,000',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.PrimaryColor)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                CALL, // Your location icon image
                height: 16, // Adjust size as needed
                width: 16,
                color: AppColor.PrimaryColor,
              ),
              SizedBox(width: 5),
              Text('532 819 4770'),
              Spacer(),
              Image.asset(
                SMS, // Your location icon image
                height: 16, // Adjust size as needed
                width: 16,
                color: AppColor.PrimaryColor,
              ),
              SizedBox(width: 5),
              Text('floydmiles48@gmail.com'),
            ],
          ),
        ],
      ),
    );
  }
}

class AmenitiesList extends StatelessWidget {
  final List<String> amenities = [
    'Security (CCTV, guard)',
    'Covered Parking',
    'Charging Station',
    'Compact, Sedan, SUV & Truck Compatibility',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amenities',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins')),
          SizedBox(height: 10),
          Column(
            children: amenities.map((amenity) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 10.0), // Add spacing below each item
                child: Row(
                  children: [
                    Image.asset(
                      CHECKCIRCLE, // Your location icon image
                      height: 16, // Adjust size as needed
                      width: 16,
                    ),
                    SizedBox(width: 10), // Space between icon and text
                    Text(
                      amenity,
                      style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}



class DescriptionSection extends StatefulWidget {
  @override
  _DescriptionSectionState createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  bool isDescriptionExpanded = false;
  bool isLeaseTermsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Description',
            content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            isExpanded: isDescriptionExpanded,
            onToggle: () => setState(() => isDescriptionExpanded = !isDescriptionExpanded),
          ),
          SizedBox(height: 20),
          _buildSection(
            title: 'Lease Terms',
            content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
            isExpanded: isLeaseTermsExpanded,
            onToggle: () => setState(() => isLeaseTermsExpanded = !isLeaseTermsExpanded),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
        SizedBox(height: 5),
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 12, fontFamily: 'Poppins', color: Colors.black),
            children: [
              TextSpan(
                text: isExpanded ? content : '${content.substring(0, 50)}...', // Show truncated content
              ),
              TextSpan(
                text: isExpanded ? ' Show Less' : ' Read More',
                style: TextStyle(color: AppColor.PrimaryColor, fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = onToggle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: AppColor.White,
      child: Row(
        children: [
          Text(
            '\$10,000',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: AppColor.PrimaryColor,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: Image.asset(CHATBUTTON),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
            },
            child: Image.asset(BOOKVISITBUTTON),
          ),
        ],
      ),
    );
  }
}

