import 'package:flutter/material.dart';
import 'package:test/list_view_builder_animation/list_view_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home:Animate()
    );
  }
}