import 'package:flutter/material.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/presentation/screen/profile/refer_a_friend.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'UserProfile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
             
            },
          ),
        ],
      ),body: SingleChildScrollView(
              child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
            
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/profile pic.png', 
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                const SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 8),
                      const Text(
                        'Emery Aminoff',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins"),
                      ),
                      
                      const SizedBox(height:8),
                       Row(
      children: [
        Image.asset(
          'assets/images/location.png',
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4), 
        Text(
          'Los Angeles, USA',
          style: TextStyle(
            fontSize: 14,
            color: AppColor.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
                     
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 85,
                      width: 155,
                      padding: const EdgeInsets.only(top: 14,left: 12,bottom: 14,right: 12),
                      decoration: BoxDecoration(
                        color: AppColor.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '₹ 168.50',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Black),
                            ),
                          ),
                          SizedBox(height: 4),
                          Center(
                            child: Text(
                              'Wallet',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  color: AppColor.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 85,
                      width: 155,
                      padding: const EdgeInsets.only(top: 14,right: 12,left: 12,bottom: 14),
                      decoration: BoxDecoration(
                        color: AppColor.orange1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '14 Dec, 2024',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.Black),
                            ),
                          ),
                         const SizedBox(height: 4),
                          Center(
                            child: Text(
                              'Subscription',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
           
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColor.White,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color:AppColor.boxShadow,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                  const  SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/profile1.png', 
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      const  SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Personal Detail',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColor.Black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon:const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                           
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
         
              Container(
                padding: const EdgeInsets.only(top: 12, left: 16, bottom: 16, right: 16),
                decoration: BoxDecoration(
                  color: AppColor.White,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.boxShadow,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                    const SizedBox(height: 16),
                
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/payments.png', 
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Payments Method',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  color: AppColor.Black,
                                ),
                              ),
                            ),
                         
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios, size: 16),
                              onPressed: () {
                               
                              },
                            ),
                          ],
                        ),

    const SizedBox(height:10),
                        Container(
      height: 1,
      width: double.infinity,
      color: AppColor.line, 
    ),
                       
                     
                        const SizedBox(height: 10), 
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/history.png', 
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                           const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Payment History',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  color: AppColor.Black,
                                ),
                              ),
                            ),
                          
                            IconButton(
                              icon:const Icon(Icons.arrow_forward_ios, size: 16),
                              onPressed: () {
                               
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            
              Container(
                padding: const EdgeInsets.only(top: 12,right: 16,bottom: 16,left: 16),
                decoration: BoxDecoration(
                  color: AppColor.White,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.boxShadow,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order & Vehicles Info',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                    const SizedBox(height: 14),
                  
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/vehiclesinformation.png', 
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Vehicles Information',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColor.Black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon:const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                           
                          },
                        ),
                      ],
                    ),
                    
   const SizedBox(height: 10),
                        Container(
      height: 1, 
      width: double.infinity,
      color: AppColor.line,
    ),
                    const SizedBox(height: 10),
                  
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/orderhistory.png', 
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10,)
                          ),
                        ),
                      const  SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Order History',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColor.Black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon:const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                           
                          },
                        ),
                      ],
                    ),
                    
   const SizedBox(height: 10),
                        Container(
      height: 1, 
      width: double.infinity,
      color:  AppColor.line, 
    ),
                   const SizedBox(height: 10),
                   
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/listing.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      const  SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Listing',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              color: AppColor.Black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon:const Icon(Icons.arrow_forward_ios, size: 16),
                          onPressed: () {
                            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
 Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
      const  SizedBox(height: 16),
      
        Container(
          padding: const EdgeInsets.only(top: 12, right: 16, bottom: 16, left: 16),
          decoration: BoxDecoration(
            color: AppColor.White,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColor.boxShadow,
                spreadRadius: 1,
                blurRadius: 1,
                offset:const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  color: AppColor.Black,
                ),
              ),
           const   SizedBox(height: 14),
            
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage(
                          'assets/images/refer.png', 
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                const  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Refer a Friend',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {
                      Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReferFriendScreen (),
      ),);
                    },
                  ),
                ],
              ),
              
   const SizedBox(height: 10),
                        Container(
      height: 1, 
      width: double.infinity,
      color: AppColor.line,
    ),
           const   SizedBox(height: 10),
           
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage(
                          'assets/images/about.png', 
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                const  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon:const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
  const  SizedBox(height: 10),
                        Container(
      height: 1, 
      width: double.infinity,
      color:AppColor.line,
    ),
             const SizedBox(height: 10),
             
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage(
                          'assets/images/support.png', 
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon:const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {
                     
                    },
                  ),
                ],
              ),
              
   
   const SizedBox(height: 10),
                        Container(
      height: 1,
      width: double.infinity,
      color: AppColor.line,
    ),
            const  SizedBox(height: 10),
             
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage(
                          'assets/images/logout.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                const  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Log out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: AppColor.Black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {
                     
                    },
                  ),




              
                ],),
                        ],
                      ),
        )
         ] ),],),),),
    );
  }
}