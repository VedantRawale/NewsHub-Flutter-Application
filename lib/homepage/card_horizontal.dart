import 'package:flutter/material.dart';
import '../Services/api_services.dart';
import '../Services/firebase_services.dart';
import '../ShowArticle/show_article.dart';
import '../constants.dart';
class CardHorizontal extends StatefulWidget {
  final Articles articles;

  const CardHorizontal(this.articles, {super.key});

  @override
  State<CardHorizontal> createState() => _CardHorizontalState();
}

class _CardHorizontalState extends State<CardHorizontal> {
  bool favmarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.brown, width: 2.0)),
        width: 250.0,
        height: 130,
        margin: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ShowArticle(articles: widget.articles);
                    }));
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.network(
                              widget.articles.urlToImage ?? lkdnlink,
                              fit: BoxFit.fill)),
                      Material(
                        surfaceTintColor: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.articles.title!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.brown,
                child: SizedBox(
                    height: 25,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.thumb_up, color: Colors.white),
                        // Icon(Icons.favorite, color : Colors.grey),
                        SizedBox(width: 10),
                        Icon(Icons.comment, color: Colors.white),
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            bottom: 7,
            right: 2,
            child: Material(
              color: Colors.grey,
              elevation: 3,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        favmarked = !favmarked;
                      });
                      addarticletofav(widget.articles);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: favmarked ? Colors.red : Colors.white,
                    ),
                    color: Colors.white),
              ),
            ),
          ),
        ]));
  }
}
