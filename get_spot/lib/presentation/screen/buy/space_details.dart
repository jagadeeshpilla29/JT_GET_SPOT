import 'package:flutter/material.dart';

class SpaceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Space Details'),
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
      ),
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
  // Current selected image
  String selectedImage = 'assets/images/garage1.png';

  // List of thumbnail image paths
  final List<String> thumbnails = [
    'assets/images/garage0.png',
    'assets/images/garage1.png',
    'assets/images/garage2.png',
    'assets/images/garage3.png',
    'assets/images/garage4.png',
    'assets/images/garage5.png',
    'assets/images/garage6.png',
    'assets/images/garage7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none, // Allows thumbnails to overflow
        alignment: Alignment.bottomCenter, // Align thumbnails to the bottom of the large image
        children: [
          // Large Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Rounded corners for large image
            child: Image.asset(
              selectedImage,
              height: 274, // Height for large image
              width: 327,  // Width for large image
              fit: BoxFit.cover,
            ),
          ),

          // Thumbnail Row Positioned Below the Large Image
          Positioned(
            bottom: 10, // Position below the large image
            child: Container(
              width: 303, // Width for thumbnail container
              padding: EdgeInsets.symmetric(vertical: 10), // Padding for thumbnails
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(15), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Subtle shadow for elevation
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
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
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
                            color: Colors.black.withOpacity(0.7), // Semi-transparent background
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Downtown Garage', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.yellow[800]),
              SizedBox(width: 5),
              Text('New York, USA', style: TextStyle(color: Colors.grey)),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map, size: 16),
                label: Text('View on Map'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('For Sale', style: TextStyle(color: Colors.grey)),
              Spacer(),
              Text('\$10,000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.yellow[800]),
              SizedBox(width: 5),
              Text('532 819 4770'),
              Spacer(),
              Icon(Icons.email, color: Colors.yellow[800]),
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amenities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ...amenities.map((amenity) => Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Text(amenity),
                ],
              )),
        ],
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry... Read More'),
          SizedBox(height: 15),
          Text('Lease Terms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry... Read More'),
        ],
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Row(
        children: [
          Text('\$10,000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.chat_bubble_outline),
            label: Text('Chat'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[800],
              foregroundColor: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Book Visit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
