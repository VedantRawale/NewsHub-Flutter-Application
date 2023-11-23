import 'package:flutter/material.dart';

import '../constants.dart';
import '../favourite_articles.dart';
import '../livemarket/livemarket.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.brown,
                onPressed: () {},
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FavouriteArticleScreen();
                    }));
                  },
                ),
              ),
            ),
            Container(
              color: backGrndClr,
              height: 70,
              width: 270,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Image.asset(
                    'android/assets/image_asset/news_hub_fin.png',
                    scale: 0.1),
              ),
            ),
          ],
        ),
        Positioned(
          top: 12,
          right: 0,
          left: 290,
          child: IconButton(
            iconSize: 30, // Adjust the size as needed
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LiveNse();
              }));
            },
            icon: const Icon(Icons.bar_chart),
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
