import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:genta_ios/API/api.dart';
import 'package:genta_ios/News/news.dart';
import 'package:genta_ios/News/widgets/headline.dart';
import 'package:genta_ios/News/widgets/search-bar.dart';
import 'package:genta_ios/styles.dart';

class NewsPageScreen extends StatefulWidget {
  @override
  NewsPageScreenState createState() => NewsPageScreenState();
}

class NewsPageScreenState extends State<NewsPageScreen> {
  List<News> _articleList = <News>[];

  List<News> searchNews(String string) => _articleList
      .where((counter) =>
          counter.name.toLowerCase().contains(string.toLowerCase()) ||
          counter.author.toLowerCase().contains(string.toLowerCase()) ||
          counter.date.toLowerCase().contains(string.toLowerCase()))
      .toList();

  final controller = TextEditingController();
  final focusNode = FocusNode();
  String string = '';

  Future<void> _fetchArticle(int articleIndex) async {
    final api = Api();
    final newsJSON = await api.getNewsList(articleIndex);
    final List<News> newsList = _articleList;
    for (var article in newsJSON) {
      newsList.add(News.fromJson(article));
    }
    setState(() => _articleList = newsList);
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => string = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(controller: controller, focusNode: focusNode),
    );
  }

  Widget _buildSearchResults(List<News> newslist) {
    /*if (newslist.isEmpty) {
      if (string == '') {
        _fetchArticle(0);
        return Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CupertinoActivityIndicator()),
        );
      } else {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'No Data',
              style: Styles.headlineNothingness,
            ),
          ),
        );
      }
    }*/

    return ListView.builder(
      reverse: false,
      itemBuilder: (context, i) {
        if (i >= newslist.length) {
          _fetchArticle(i);
        } else {
          return Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
            child: NewsHeadline(newslist[i]),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Styles.scaffoldBackground,
          ),
          child: SafeArea(
            child: Column(
              children: [
                _createSearchBox(),
                SizedBox(height: 8.0),
                Expanded(
                  child: _buildSearchResults(searchNews(string)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
