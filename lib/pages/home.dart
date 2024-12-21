import 'package:flutter/material.dart';
import 'package:musixmatch/constants.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      color: AppColors.indicator,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.settings_outlined, color: Colors.white),
                ],
              ),
            ),
            const Banners(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.0,
                children: [
                  Text(
                    'The FloatingLyrics',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Get lyrics instantly on top of Youtube, Spotify, Play Music and more.',
                    style: TextStyle(color: AppColors.onboardText1, fontSize: 16.0),
                  ),
                  Image.asset('assets/images/home_banner_big.png'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Open FloatingLyrics',
                      style: TextStyle(
                        color: AppColors.indicator,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    const banners = [
      (title: 'For artists\n', image: 'assets/images/home_banner_1.png'),
      (title: 'Try Performer tags!\n', image: 'assets/images/home_banner_2.png'),
      (title: 'Hurry up and save 50% on Premium', image: 'assets/images/home_banner_3.png'),
      (title: 'Attend the Academy and Graduate', image: 'assets/images/home_banner_4.png'),
      (title: 'Podcasts available now!\n', image: 'assets/images/home_banner_5.png'),
      (title: 'Explore our amazind community', image: 'assets/images/home_banner_6.png'),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 24.0,
        children: [
          for (final banner in banners) ...[
            SizedBox(
              width: MediaQuery.sizeOf(context).width - (24.0 * 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 24.0,
                children: [
                  Flexible(
                    child: Text(
                      banner.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(banner.image),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}