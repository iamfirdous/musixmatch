import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> with TickerProviderStateMixin {
  final controller = StoryController();

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 6);
    Widget getView(int i) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: switch (i) {
          0 => Colors.red,
          1 => Colors.green,
          2 => Colors.blue,
          _ => Colors.black,
        },
        child: Text('Hello $i'),
      );
    }

    final storyItems = [
      StoryItem(getView(0), duration: duration),
      StoryItem(getView(1), duration: duration),
      StoryItem(getView(2), duration: duration),
      StoryItem(getView(3), duration: duration),
    ];
    return Scaffold(
      body: StoryView(
        controller: controller,
        inline: true,
        storyItems: storyItems,
        onComplete: () => print('Helllllllloooo'),
      ),
    );
  }
}