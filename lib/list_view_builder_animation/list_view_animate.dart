import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Animate extends StatefulWidget {
  const Animate({super.key});

  @override
  State<Animate> createState() => _AnimateState();
}

List<List<String>> fruits = [
  [
    "assets/images/apple.jpeg",
    "Apple",
    "A sweet red or green fruit rich in fiber and vitamins."
  ],
  [
    "assets/images/orange.jpg",
    "Orange",
    "A juicy citrus fruit full of vitamin C."
  ],
  [
    "assets/images/pineapple.jpg",
    "Pineapple",
    "A tropical fruit with a tangy-sweet taste and spiky skin."
  ],
  [
    "assets/images/banana.jpg",
    "Banana",
    "A soft, sweet fruit that is rich in potassium."
  ],
  [
    "assets/images/strawberry.jpeg",
    "Strawberry",
    "A small red fruit with tiny seeds and a sweet flavor."
  ]
];

class _AnimateState extends State<Animate> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              horizontalOffset: 300.0,
              duration: const Duration(milliseconds: 400),
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 400),
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(fruits[index][0]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fruits[index][1],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                fruits[index][2],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
