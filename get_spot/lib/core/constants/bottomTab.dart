// import 'package:flutter/material.dart';
// import 'package:scootly/core/constants/colors.dart';
// import 'package:scootly/presentation/screens/Dashboard/DashBoard_page.dart';
// import 'package:scootly/presentation/screens/Profile/Profile_Screen.dart';

// class Bottomtab extends StatefulWidget {
//   @override
//   _BottomtabState createState() => _BottomtabState();
// }

// class _BottomtabState extends State<Bottomtab> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     DashboardScreen(),
//     Center(child: Text('products Page')),
//     Center(child: Text('Wishlist Page')),
//     Center(child: Text('Settings Page')),
//     ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: Container(
//         height: 82,
//         decoration: BoxDecoration(
//           color: AppColor.PrimaryColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(24.0),
//             topRight: Radius.circular(24.0),
//           ),
//         ),
//         child: SafeArea(
//           child: BottomNavigationBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: ImageIcon(
//                     AssetImage('assets/images/Motorcycle.png'),
//                     size: 35,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: ImageIcon(
//                     AssetImage('assets/images/Sales.png'),
//                     size: 30,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: ImageIcon(
//                     AssetImage('assets/images/Qoutations.png'),
//                     size: 30,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: ImageIcon(
//                     AssetImage('assets/images/Enquiry.png'),
//                     size: 30,
//                   ),
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: ImageIcon(
//                     AssetImage('assets/images/myProfile.png'),
//                     size: 30,
//                   ),
//                 ),
//                 label: '',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.black54,
//             onTap: _onItemTapped,
//             type: BottomNavigationBarType.fixed,
//             selectedLabelStyle: TextStyle(fontSize: 0),
//             unselectedLabelStyle: TextStyle(fontSize: 0),
//           ),
//         ),
//       ),
//     );
//   }
// }
