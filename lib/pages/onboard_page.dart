import 'package:flutter/material.dart';
import 'package:musixmatch/constants.dart';
import 'package:musixmatch/pages/dashboard_page.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

typedef Slide = ({String title, String subtitle, String image});

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

    const slides = [
      (title: 'Play with the most enhanced music experience', subtitle: 'Listen to your favorite music with time-synced lyrics and translations', image: 'assets/images/onboard_view_1.png'),
      (title: 'Join our global community of music lovers', subtitle: 'Transcribe, sync, tag, and translate songs lyrics to climb the leaderboards', image: 'assets/images/onboard_view_2.png'),
      (title: 'Make an impact on how people listen to music', subtitle: 'Millions of people will enjoy your contributions within the most popular streaming services', image: 'assets/images/onboard_view_3.png'),
    ];
    return Scaffold(
      body: StoryView(
        controller: controller,
        indicatorColor: AppColors.indicatorBG,
        indicatorForegroundColor: AppColors.indicator,
        storyItems: slides.map((slide) => StoryItem(OnboardSlide(slide: slide), duration: duration)).toList(),
        onComplete: () {
          final route = MaterialPageRoute(builder: (_) => const DashboardPage());
          Navigator.pushReplacement(context, route);
        },
      ),
    );
  }
}

class OnboardSlide extends StatelessWidget {
  const OnboardSlide({super.key, required this.slide});

  final Slide slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            spacing: 24.0,
            children: [
              const SizedBox(),
              Text(
                slide.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                slide.subtitle,
                style: TextStyle(color: AppColors.onboardText1, fontSize: 16.0),
              ),
              Image.asset(slide.image),
            ],
          ),
        ),
      ),
    );
  }
}