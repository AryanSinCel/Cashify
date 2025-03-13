import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> _carouselImageUrls = [
    "https://s3no.cashify.in/cashify/web/5d72a530355a45f093b959dc9c9c506f.webp?p=default&s=lg",
    "https://s3no.cashify.in/cashify/web/753432b9b22448d4950ce1d2f843d2a0.webp?p=default&s=lg",
    "https://s3no.cashify.in/cashify/web/a86132414c264aeea04d15c795177ecd.webp?p=default&s=lg",
    "https://s3no.cashify.in/cashify/web/2dcf9b22fe1749788bb79f79447a96e3.webp?p=default&s=lg"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// **Image Carousel**
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: _carouselImageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Image.network(
                _carouselImageUrls[index],
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 8),

        /// **Carousel Indicator**
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _carouselImageUrls.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.jumpToPage(entry.key),
              child: Container(
                width: _currentIndex == entry.key ? 12 : 8,
                height: _currentIndex == entry.key ? 12 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.black : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
