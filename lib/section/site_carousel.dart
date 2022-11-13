import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gbc_landing/widgets/carosuel_item.dart';

class SiteCarousel extends StatelessWidget {
  const SiteCarousel({
    Key? key,
    required CarouselController carouselController,
    required this.appConstraints,
  })  : _carouselController = carouselController,
        super(key: key);
  final BoxConstraints appConstraints;
  final CarouselController _carouselController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          autoPlay: true,
          aspectRatio: 16 / 6.5,
          viewportFraction: 1,
        ),
        carouselController: _carouselController,
        items: [
          CarosuelItem(
            asset: "assets/slider/1.png",
            label_1: "LEADING THE WORLD INTO",
            label_2: "A MORE SUSTINABLE MOBILITY",
            fontSize: appConstraints.maxWidth > 450 ? 36 : 18,
            padding: appConstraints.maxWidth > 450 ? 100 : 50,
          ),
          CarosuelItem(
            asset: "assets/slider/2.png",
            label_1: "FAMES CONDIMENTUM TELLUS",
            label_2: "TINCIDUNT ID FERMENTUM",
            fontSize: appConstraints.maxWidth > 450 ? 36 : 18,
            padding: appConstraints.maxWidth > 450 ? 100 : 50,
          ),
          CarosuelItem(
            asset: "assets/slider/3.png",
            label_1: "CURSUS MOLLIS DUI LACUS",
            label_2: "MAURIS MORBI ORNARE LESTIE",
            fontSize: appConstraints.maxWidth > 450 ? 36 : 18,
            padding: appConstraints.maxWidth > 450 ? 100 : 50,
          ),
        ],
      ),
    );
  }
}
