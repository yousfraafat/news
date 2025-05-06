import 'dart:convert';

import 'package:news/api/models/Source.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Wes Davis"
/// title : "Roku is looking into complaints about washed-out HDR streams"
/// description : "Roku is investigating user reports of washed-out colors when streaming HDR content from Disney Plus, according to a thread on the Roku issue tracking board. However, the issue seems to go beyond that, affecting almost any app for Roku TVs, suggest user commen…"
/// url : "https://www.theverge.com/news/660950/roku-hdr-issues-washed-out-colors-gray"
/// urlToImage : "https://platform.theverge.com/wp-content/uploads/sites/2/2025/05/Roku.jpeg?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200"
/// publishedAt : "2025-05-04T22:17:05Z"
/// content : "The problem seems to stem from a recent software update.\r\nThe problem seems to stem from a recent software update.\r\nRoku is investigating user reports of washed-out colors when streaming HDR content … [+2089 chars]"

News articlesFromJson(String str) => News.fromJson(json.decode(str));

String articlesToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
