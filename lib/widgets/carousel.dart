import 'package:auto_atendimento/ui/size_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> images = [
    "assets/images/promo1.png",
    "assets/images/promo2.png",
  ];
  
  // Usando o novo CarouselSliderController para evitar conflitos
  final CarouselSliderController _controller = CarouselSliderController();

  CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: context.percentHeigth(1) / 850,
          viewportFraction: 0.9,
        ),
        items: images.map((img) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(img, fit: BoxFit.cover, width: double.infinity),
          );
        }).toList(),
      ),
    );
  }
}
