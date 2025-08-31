import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryController controller = StoryController();

  @override
  void dispose() {
    controller.dispose(); // always dispose to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
      /// 1. TEXT STORY
      StoryItem.text(
        title: "Hello 👋\nThis is a text story!",
        backgroundColor: Colors.deepPurple,
        textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),

      /// 2. IMAGE STORY
      StoryItem.pageImage(
        url:
            "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce", // Apple image
        controller: controller,
        caption: Text("Fresh Apple 🍎"),
      ),

      /// 3. GIF STORY
      StoryItem.pageImage(
        url:
            "https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif", // funny gif
        controller: controller,
        caption: Text("Fun GIF 🎉"),
      ),

      /// 4. VIDEO STORY
      StoryItem.pageVideo(
        "https://sample-videos.com/video123/mp4/480/asdasdas.mp4", // sample video
        controller: controller,
        caption: Text("Cool Video 🎥"),
      ),
    ];

    return Scaffold(
      body: StoryView(
        storyItems: storyItems,
        controller: controller,
        repeat: true, // keep looping stories
        onStoryShow: (storyItem, index) {
          debugPrint("Showing story: ${storyItem.view} at index $index");
        },
        onComplete: () {
          debugPrint("All stories completed!");
        },
      ),
    );
  }
}
