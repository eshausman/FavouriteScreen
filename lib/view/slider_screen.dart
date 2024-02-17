import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class sliderScreen extends StatelessWidget {
  List images = [
    "images/a.jpg",
    "images/b.jpg",
    "images/c.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CarouselSlider(
          options: CarouselOptions(
              enlargeCenterPage: true,
              height: 400.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 02)),
          items: images.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover)
                    ),
                    // child: Text(
                    //   'text $i',
                    //   style: TextStyle(fontSize: 16.0),
                    // )
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
