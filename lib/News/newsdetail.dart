import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class NewsDetail {
  NewsDetail({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.author,
    @required this.photographer,
    @required this.status,
    @required this.date,
    @required this.description,
    @required this.link,
  });

  final int id;

  final String name;

  final String image;

  final String author;

  final String photographer;

  final String description;

  final String date;

  final String link;

  final String status;

  factory NewsDetail.fromJson(Map<String, dynamic> jsonMap) {
    return NewsDetail(
      name: jsonMap['judul'],
      id: int.parse(jsonMap['id']),
      author: jsonMap['penulis'],
      image: jsonMap['foto'],
      date: jsonMap['tanggal'],
      photographer: jsonMap['fotografer'],
      description: jsonMap['isi'],
      link: jsonMap['link'],
      status: jsonMap['status'],
    );
  }
}
