import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselDemo extends StatefulWidget {
  @override
  _CarouselDemoState createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  int _currentIndex = 0;

  final List<String> images = [
    "https://images.pexels.com/photos/4016579/pexels-photo-4016579.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4016579.jpg&fm=jpg",
    "https://th.bing.com/th/id/R.2b05140a776f25a8047c88fbe2bcbdb9?rik=nJGXGox1yqPCMA&riu=http%3a%2f%2fwww.thedesignwork.com%2fwp-content%2fuploads%2f2011%2f10%2fRandom-Pictures-of-Conceptual-and-Creative-Ideas-02.jpg&ehk=IMQIRwGOPtTb7ZAO7L9joTJjtE5D4vBqWQ5F3i5U1cE%3d&risl=&pid=ImgRaw&r=0",
    "https://images.pexels.com/photos/4022082/pexels-photo-4022082.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
    "https://tse3.mm.bing.net/th/id/OIP.J7tqIfETj0cTrXUYPiuVTAHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://media.istockphoto.com/id/104314531/photo/reading-the-bible.jpg?s=612x612&w=0&k=20&c=buPNND8FuSYOIfyulQtVMG4z9jD-m63bxq_zd0taeS4=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carousel Slider Demo")),
      body: Column(
        children: [
          CarouselSlider(
            items: images.map((url) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 250.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              pauseAutoPlayOnTouch: true,
              disableCenter: false,
              padEnds: true,
              scrollPhysics: BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.asMap().entries.map((entry) {
              return Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
