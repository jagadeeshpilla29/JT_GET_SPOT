import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_spot/core/constants/img_const.dart'; 

class SliderWidget extends StatelessWidget {
  final List<String> imageList = [
    SLIDER1, 
    SLIDER1,
    SLIDER1,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageList.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10), 
          child: Image.asset(
            imageList[index], 
            fit: BoxFit.cover, 
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 18 / 9, 
        viewportFraction: 0.95,
      ),
    );
  }
}
