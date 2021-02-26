import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class News {
  News({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.author,
    @required this.date,
    @required this.status,
  });

  final int id;

  final String name;

  final String image;

  final String author;

  final String date;

  final String status;

  News.fromJson(Map jsonMap)
      : name = jsonMap['judul'],
        id = int.parse(jsonMap['id']),
        author = jsonMap['penulis'],
        image = jsonMap['foto'],
        date = jsonMap['tanggal'],
        status = jsonMap['status'];
}
