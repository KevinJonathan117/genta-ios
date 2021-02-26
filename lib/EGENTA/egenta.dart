import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class EGENTA {
  EGENTA({
    @required this.id,
    @required this.edisi,
    @required this.image,
    @required this.shortDescription,
  });

  final int id;

  final int edisi;

  final String image;

  final String shortDescription;

  EGENTA.fromJson(Map jsonMap)
      : id = int.parse(jsonMap['id_majalah']),
        edisi = int.parse(jsonMap['edisi']),
        image = jsonMap['cover'],
        shortDescription = jsonMap['tema'];
}
