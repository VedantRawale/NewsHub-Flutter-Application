import 'package:http/http.dart' as http;
import 'package:news_hub_app/Provider/country_provider.dart';
import 'dart:developer';
import 'dart:core';
import 'dart:convert';

import 'package:news_hub_app/constants.dart';

class FetchNewsApi {
  List<Articles> articleList = [];
  Future<List<Articles>> getArticles(String countryCode) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=$countryCode',
        ),
        headers: {
          'X-Api-Key': apiKey,
        },
      );
      var data = jsonDecode(response.body.toString());
      NewsModel newsModel = NewsModel.fromJson(data);
      if (newsModel.status == 'ok' && newsModel.articles != null) {
        articleList.clear();
        for (var i in newsModel.articles!) {
          articleList.add(i);
        }
        log('Response Body: ${response.body}');
        print(articleList.length);
        return articleList;
      } else {
        log('Response Body: ${response.body}');
        return articleList;
      }
    } catch (error) {
      log('Error: $error');
      return articleList;
    }
  }
}

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
