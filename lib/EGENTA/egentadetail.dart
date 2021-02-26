import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class EGENTADetail {
  EGENTADetail({
    @required this.id,
    @required this.edisi,
    @required this.page,
    @required this.image,
  });

  final int id;

  final int edisi;

  final int page;

  final String image;

  EGENTADetail.fromJson(Map jsonMap)
      : id = int.parse(jsonMap['id_detail']),
        edisi = int.parse(jsonMap['edisi']),
        page = int.parse(jsonMap['halaman']),
        image = jsonMap['gambar'];
}
