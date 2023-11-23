import 'package:flutter/material.dart';

import 'Services/api_services.dart';
import 'Services/firebase_services.dart';
import 'constants.dart';
import 'homepage/card_vertical.dart';
import 'homepage/homepage.dart';

class FavouriteArticleScreen extends StatefulWidget {
  const FavouriteArticleScreen({super.key});

  @override
  State<FavouriteArticleScreen> createState() => _FavouriteArticleScreenState();
}

class _FavouriteArticleScreenState extends State<FavouriteArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text('Favourite Articles'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: backGrndClr,
          child: Center(
            child: FutureBuilder<List<Articles>>(
                future: getFavArticles(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No articles available');
                  } else {
                    return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: false,
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (builder, index) {
                        return CardVertical(snapshot.data![index]);
                      },
                    );
                  }
                })),
          ),
        ),
      ),
    );
  }
}
