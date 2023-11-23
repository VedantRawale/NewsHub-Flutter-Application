import 'package:flutter/material.dart';

import '../Services/api_services.dart';
import '../ShowArticle/show_article.dart';


class CardVertical extends StatelessWidget {
  final Articles articles;

  const CardVertical(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ShowArticle(articles: articles);
        }));
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.brown, width: 2.0)),
          width: 250.0,
          margin: const EdgeInsets.only(
              right: 8.0, left: 8.0, bottom: 8.0, top: 8.0),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          articles.title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.network(
                          articles.urlToImage ??
                              "https://media.licdn.com/dms/image/C5603AQGCdybUf9XRZA/profile-displayphoto-shrink_400_400/0/1668067929170?e=1706140800&v=beta&t=S24oCi1EHdKC2hJu1afz2Ce_BFrXU4hU_qkrcOBzS1E",
                          fit: BoxFit.fill),
                    ),
                  ],
                ),
                Material(
                  color: Colors.brown,
                  child: SizedBox(
                      height: 25,
                      width: 340,
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
          )),
    );
  }
}