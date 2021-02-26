import 'package:flutter/cupertino.dart';
import 'package:genta_ios/EGENTA/egentadetail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EGentaPages extends StatelessWidget {
  final EGENTADetail egentadetail;

  const EGentaPages(this.egentadetail);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "http://genta.petra.ac.id/heygenta/lite/assets/majalah/${egentadetail.edisi}/${egentadetail.page}.jpg",
    );
  }
}
