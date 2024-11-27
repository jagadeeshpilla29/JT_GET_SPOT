import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/injection.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_state.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleTap(String label) {
    // print('Tapped on $label');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CurrentCustomerCubit>()..GetCurrentCustomer(),
      child: BlocBuilder<CurrentCustomerCubit, CurrentCustomerState>(
        builder: (context, state) {
          String userName = 'Unknown';
          if (state is CurrentCustomerLoaded) {
            userName = state.currentCustomerEntity.data?.primaryContact ?? 'Unknown';
          }

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(220.0),
              child: AppBar(
                backgroundColor: AppColor.Black,
                leading: IconButton(
                  icon: Icon(Icons.account_circle, color: AppColor.White, size: 50.0),
                  onPressed: () {},
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning', style: TextStyle(fontSize: 16, color: AppColor.White)),
                      SizedBox(height: 4),
                      Text(userName, style: TextStyle(fontSize: 20, color: AppColor.White)),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      backgroundColor: AppColor.gray,
                      child: IconButton(
                        icon: Icon(Icons.notification_add_outlined, color: AppColor.White),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Let\'s find the best', style: TextStyle(fontSize: 18, color: AppColor.White)),
                              const SizedBox(height: 4),
                              Text('Parking space', style: TextStyle(fontSize: 16, color: AppColor.White)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                style: TextStyle(color: AppColor.White),
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: AppColor.White),
                                  prefixIcon: Icon(Icons.search, color: AppColor.White),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.filter_list, color: AppColor.White),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: state is CurrentCustomerLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBannerSection(),
                          const SizedBox(height: 20),
                          _buildGridSection(),
                          const SizedBox(height: 20),
                          _buildVehicleTypeSection(),
                          const SizedBox(height: 20),
                          _buildRecentPlacesSection(),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.red,
              unselectedItemColor: AppColor.Black,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_parking),
                  label: 'Book Parking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.car_repair),
                  label: 'Use Parking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBannerSection() {
    return Center(
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Special Offer: 20% Off on Parking Spaces!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridSection() {
    List<Map<String, dynamic>> items = [
      {'icon': Icons.payment, 'label': 'Pay', 'onPressed': () => _handleTap('Pay')},
      {'icon': Icons.format_list_bulleted, 'label': 'List', 'onPressed': () => _handleTap('List')},
      {'icon': Icons.map, 'label': 'Rent', 'onPressed': () => _handleTap('Rent')},
      {'icon': Icons.more_horiz, 'label': 'More', 'onPressed': () => _handleTap('More')},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: items[index]['onPressed'],
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.blue.withOpacity(0.3),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(items[index]['icon'], color: Colors.white, size: 25),
              ),
            ),
            const SizedBox(height: 8),
            Text(items[index]['label'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        );
      },
    );
  }

  Widget _buildVehicleTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Vehicle Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text('See All', style: TextStyle(fontSize: 16, color: Colors.red)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.9,
          children: [
            _buildVehicleTypeCard('Car', '120 Locations', Icons.directions_car),
            _buildVehicleTypeCard('Bike', '120 Locations', Icons.pedal_bike),
            _buildVehicleTypeCard('Bus', '120 Locations', Icons.directions_bus),
            _buildVehicleTypeCard('Van', '120 Locations', Icons.local_shipping),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentPlacesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Places', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
                title:  Text('Location $index'),
                subtitle:  Text('Details of location $index'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildVehicleTypeCard(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
