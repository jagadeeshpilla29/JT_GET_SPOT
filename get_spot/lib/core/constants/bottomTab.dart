import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/constants/img_const.dart';
import 'package:get_spot/presentation/screen/dashboard/dash_board_screen.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ListParkingPage(),
    QRCodePage(),
    BookParkingPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(50),  
        child: Stack(
          children: [
           
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColor.White,
              selectedItemColor: AppColor.Orange,
              unselectedItemColor: AppColor.gray,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              iconSize: 30,  
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: ImageIcon(
                      AssetImage(HOME),
                      size: 30,  // Adjusted icon size
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: ImageIcon(
                      AssetImage(LISTPARKING),
                      size: 30,  // Adjusted icon size
                    ),
                  ),
                  label: 'List Parking',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(), 
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: ImageIcon(
                      AssetImage(PARKING),
                      size: 30, 
                    ),
                  ),
                  label: 'Book Parking',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: ImageIcon(
                      AssetImage(SETTINGS),
                      size: 30,  
                    ),
                  ),
                  label: 'Setting',
                ),
              ],
            ),

            Positioned(
              bottom: 40.0,  
              left: MediaQuery.of(context).size.width / 2 - 22.5, 
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.SecondaryColor,
                  ),
                  child: Center(
                    child: ImageIcon(
                      AssetImage(SCANNER),
                      size: 45,  // Adjusted size of the center icon
                      color: AppColor.Black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example page widgets for each tab

class ListParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List Parking Page'));
  }
}

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('QR Code Page'));
  }
}

class BookParkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Book Parking Page'));
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Page'));
  }
}
