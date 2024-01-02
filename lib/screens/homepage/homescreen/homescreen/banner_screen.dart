// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannersScreen extends StatefulWidget {
  const BannersScreen({Key key}) : super(key: key);

  @override
  State<BannersScreen> createState() => _BannersScreenState();
}

class _BannersScreenState extends State<BannersScreen> {
  final controller = CarouselController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.4,
        child: Stack(fit: StackFit.expand, children: [
          CarouselSlider(
            items: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/slider1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/slider2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/slider3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/slider4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            carouselController: controller,
            options: CarouselOptions(
              //height: 130,
              //enlargeCenterPage: true,
              //enlargeStrategy: CenterPageEnlargeStrategy.height,
              //pageSnapping: false,
              //enableInfiniteScroll: false,
              //reverse: true,
              autoPlay: true,
              reverse: false,
              aspectRatio: 21 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 790),
              viewportFraction: 1,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 4,
                // onDotClicked: animateToSlide,
                effect: SlideEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  activeDotColor: Colors.white,
                  dotColor: Color(0x33FFFFFF),
                ),
              )
            ]),
          ),
        ]),
      ),
      SizedBox(height: 5),
    ]);
  }
}
