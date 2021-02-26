import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:genta_ios/News/newsdetail.dart';
import 'package:genta_ios/API/api.dart';
import 'package:genta_ios/styles.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Future<NewsDetail> newsdetail;

  @override
  void initState() {
    super.initState();
    newsdetail = Api().getNewsDetail(widget.id);
  }

  void dispose() {
    super.dispose();
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 285.0,
      child: Stack(
        children: [
          Positioned(
              right: 0.0,
              left: 0.0,
              child: FutureBuilder<NewsDetail>(
                  future: newsdetail,
                  builder: (BuildContext context,
                      AsyncSnapshot<NewsDetail> snapshot) {
                    if (snapshot.hasData) {
                      return CachedNetworkImage(
                          imageUrl:
                              "http://genta.petra.ac.id/heygenta/lite/assets/${snapshot.data.image}",
                          fit: BoxFit.cover);
                      //return Image.network(
                      //  'http://genta.petra.ac.id/heygenta/lite/assets/${snapshot.data.image}',
                      //  fit: BoxFit.cover,
                      //  semanticLabel: 'image of news detail',
                      //);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return SizedBox(height: 1);
                  })),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("genta".toUpperCase() + " News",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 67.5),
            _buildHeader(context),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FutureBuilder<NewsDetail>(
                        future: newsdetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data.name,
                              style: Styles.detailsTitleText,
                              textAlign: TextAlign.center,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return SizedBox(height: 1);
                        }),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: FutureBuilder<NewsDetail>(
                        future: newsdetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data.author +
                                  " / " +
                                  snapshot.data.photographer,
                              style: Styles.detailsAuthorText,
                              textAlign: TextAlign.center,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return SizedBox(height: 1);
                        }),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    child: FutureBuilder<NewsDetail>(
                        future: newsdetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            String _markdownData = snapshot.data.description;
                            return Html(
                              data: _markdownData,
                              defaultTextStyle: Styles.detailsDescriptionText,
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return CupertinoActivityIndicator();
                        }),
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(height: 50.0),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
