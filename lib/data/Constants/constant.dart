import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/animation.dart';

class Strings {
  static Uri url =
      Uri.parse('https://api.spacex.land/rest/launches-past-result');
  static CarouselOptions carousalOption = CarouselOptions(
    height: 180.0,
    enlargeCenterPage: true,
    autoPlay: true,
    aspectRatio: 16 / 9,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    viewportFraction: 0.8,
  );
}
