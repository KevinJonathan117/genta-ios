import 'package:flutter/cupertino.dart';
import 'package:genta_ios/News/newsdetailscreen.dart';
import 'package:genta_ios/News/news.dart';
import 'package:genta_ios/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsHeadline extends StatelessWidget {
  final News news;

  const NewsHeadline(this.news);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DetailsScreen(news.id),
            fullscreenDialog: false,
          )),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80.0,
              height: 80.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                      imageUrl:
                          "https://genta.petra.ac.id/heygenta/lite/assets/${news.image}",
                      fit: BoxFit.fitHeight)
                  //Image.network(
                  //'http://genta.petra.ac.id/heygenta/lite/assets/${news.image}',
                  // semanticLabel: 'An icon showing ${news.name}',
                  //fit: BoxFit.fitHeight,
                  // ),
                  ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(news.name, style: Styles.headlineName),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(news.author, style: Styles.headlineAuthor),
                  ),
                  Container(
                    child: Text(news.date, style: Styles.headlineDate),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
