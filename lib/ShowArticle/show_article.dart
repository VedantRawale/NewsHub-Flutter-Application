import 'package:flutter/material.dart';
import 'package:news_hub_app/Services/api_services.dart';
import 'package:news_hub_app/ShowArticle/article_web_view.dart';
import 'package:news_hub_app/constants.dart';

class ShowArticle extends StatelessWidget {
  final Articles articles;
  const ShowArticle({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              child: Stack(
                children: [
                  Image.network(
                    articles.urlToImage ?? lkdnlink,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articles.title ?? ' ',
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.brown,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "Source :    ",
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Flexible(
                          child: Text(
                            articles.source!.name ?? ' ',
                            maxLines: null,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "Author :    ",
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Flexible(
                          child: Text(
                            articles.author ?? ' ',
                            maxLines: null,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "Published at :    ",
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          articles.publishedAt ?? ' ',
                          maxLines: null,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              elevation: 3,
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articles.content ?? '',
                        maxLines: null,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                   Positioned(
                     bottom: 0,
                     left: 150,
                     right : 0,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Flexible(child: Text("Share : ", style: TextStyle(color: Colors.brown,fontSize: 18,fontWeight: FontWeight.w600))),
                      Flexible(child: Icon(Icons.facebook)),
                      SizedBox(width: 10,),
                      Flexible(child: Icon(Icons.messenger)),
                                  
                                     ],),
                   )
                    
                ],
              ),
        
              //  Align(
              //       heightFactor: 12,
              //       alignment: Alignment.bottomRight,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //       Flexible(child: Text("Share : ", style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w600))),
              //       Flexible(child: Icon(Icons.facebook)),
              //       SizedBox(width: 10,),
              //       Flexible(child: Icon(Icons.messenger)),
               
              //     ],),),
                    
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ArticleWebView(url: articles.url!);
              }));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
            child: const Text(
              "View full article",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
      backgroundColor: backGrndClr,
    );
  }
}
