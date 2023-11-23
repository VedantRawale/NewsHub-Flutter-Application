import 'package:flutter/material.dart';
import 'package:news_hub_app/Services/api_services.dart';
import 'package:news_hub_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_hub_app/favourite_articles.dart';
import 'package:news_hub_app/homepage/toprow.dart';
import 'package:news_hub_app/livemarket/livemarket.dart';
import 'package:provider/provider.dart';
import '../Provider/country_provider.dart';
import '../Services/firebase_services.dart';
import '../ShowArticle/show_article.dart';
import 'card_horizontal.dart';
import 'card_vertical.dart';
import 'country_dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGrndClr,
      body: ListView(
        children: [
          const SizedBox(height: 5),
          const TopRow(),
          const SizedBox(height: 5),
          const SearchBar(),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                child: Text(
                  'Trending',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 100),
              const CountryDropDown(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 270,
              color: backGrndClr,
              child: Center(child: Consumer<CountryProvider>(
                  builder: (context, countryProvider, child) {
                return FutureBuilder<List<Articles>>(
                    future: FetchNewsApi().getArticles(countryProvider.country),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No articles available');
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (builder, index) {
                            return CardHorizontal(snapshot.data![index]);
                          },
                        );
                      }
                    }));
              }))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                child: Text(
                  'Breaking News',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            color: backGrndClr,
            child: Center(child: Consumer<CountryProvider>(
                builder: (context, countryProvider, child) {
              return FutureBuilder<List<Articles>>(
                  future: FetchNewsApi().getArticles(countryProvider.country),
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
                  }));
            })),
          ),
        ],
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
              fillColor: Colors.white,
              hintText: 'Search..',
              prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)))),
    );
  }
}
