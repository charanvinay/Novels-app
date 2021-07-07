import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatelessWidget {
  const CarouselImageSlider({
    Key? key,
    required this.carouselImages,
  }) : super(key: key);

  final List<String> carouselImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CarouselImage(imgSrc: carouselImages[0]),
        CarouselImage(imgSrc: carouselImages[1]),
        CarouselImage(imgSrc: carouselImages[2]),
        CarouselImage(imgSrc: carouselImages[3]),
        CarouselImage(imgSrc: carouselImages[4]),
      ],
      options: CarouselOptions(
        height: 80.0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}

class CarouselImage extends StatelessWidget {
  final String imgSrc;
  const CarouselImage({
    Key? key,
    required this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgSrc),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
