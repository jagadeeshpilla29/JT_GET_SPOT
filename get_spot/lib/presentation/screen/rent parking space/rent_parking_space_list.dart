import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';

class RentParkingSpaceScreen extends StatefulWidget {
  @override
  _RentParkingSpaceScreenState createState() => _RentParkingSpaceScreenState();
}

class _RentParkingSpaceScreenState extends State<RentParkingSpaceScreen> {
  final List<Map<String, dynamic>> parkingSpaces = [
    {
      'name': 'Downtown Garage',
      'location': '47 W 13th St, New York',
      'status': 'Available',
      'price': 10000,
      'image': 'assets/images/garage1.png',
      'isFavorited': false,
    },
    {
      'name': 'Uptown Parking',
      'location': '123 Main St, New York',
      'status': 'Occupied',
      'price': 12000,
      'image': 'assets/images/garage1.png',
      'isFavorited': true,
    },
    // Add more parking space data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.White,
        elevation: 1,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: Text('Buy Sell Parking Space', style: TextStyle(color: AppColor.Black, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      backgroundColor: AppColor.White,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(color: AppColor.White, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          hintStyle: TextStyle(color: AppColor.grey),
                          prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset(SEARCH, width: 20, height: 20, color: AppColor.Black)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                          filled: true,
                          fillColor: AppColor.White2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(onTap: () {}, child: Image.asset(FILTER)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('List', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.Black)),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: parkingSpaces.length,
                itemBuilder: (context, index) {
                  final parkingSpace = parkingSpaces[index];
                  
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    color: AppColor.White,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: 
                    SizedBox(
                      height: 138,

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                              child: Image.asset(parkingSpace['image'], fit: BoxFit.cover)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Text(parkingSpace['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), overflow: TextOverflow.ellipsis)),
                                      IconButton(
                                        icon: Icon(parkingSpace['isFavorited'] ? Icons.favorite : Icons.favorite_border, color: parkingSpace['isFavorited'] ? Colors.red : Colors.grey, size: 16),
                                        onPressed: () {
                                          setState(() {
                                            parkingSpace['isFavorited'] = !parkingSpace['isFavorited'];
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(RENTLOCATION, height: 16, width: 16, fit: BoxFit.contain),
                                      SizedBox(width: 4),
                                      Expanded(child: Text(parkingSpace['location'], style: TextStyle(color: AppColor.Black, fontSize: 12), overflow: TextOverflow.ellipsis)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(parkingSpace['status'], style: const TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: '\$',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.PrimaryColor),
                                            children: [TextSpan(text: '${parkingSpace['price']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.PrimaryColor))],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Book Visit', style: TextStyle(fontSize: 10)),
                                        style: ElevatedButton.styleFrom(backgroundColor: AppColor.PrimaryColor, foregroundColor: AppColor.Black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), minimumSize: Size(82, 32), padding: EdgeInsets.zero),
                                      ),
                                      SizedBox(
                                        width: 101,
                                        height: 32,
                                        child: TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                          child: Text('View Contact', style: TextStyle(color: AppColor.PrimaryColor, fontSize: 10)),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
