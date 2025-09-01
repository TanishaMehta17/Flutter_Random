import 'package:flutter/material.dart';
import 'package:test/carousel_slider/carousel_slider.dart';
import 'package:test/flutter_story_view/flutter_story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CarouselDemo());
  }
}
