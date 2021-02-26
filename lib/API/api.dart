import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

import 'package:genta_ios/News/newsdetail.dart';

class Api {
  final HttpClient _httpClient = HttpClient();

  final String _url = 'genta.petra.ac.id';

  Future<List> getNewsList(int start) async {
    final uri = Uri.http(
        _url, '/heygenta/API/v1/news/getnews.php', {'start': start.toString()});
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['data'] == null) {
      print('Error retrieving news list.');
      return null;
    }
    return jsonResponse['data'];
  }

  Future<NewsDetail> getNewsDetail(int id) async {
    final uri = Uri.http(
        _url, '/heygenta/API/v1/news/getdetailnews.php', {'id': id.toString()});
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['data'] == null) {
      print('Error retrieving news detail.');
      return null;
    }
    return NewsDetail.fromJson(jsonResponse['data'][0]);
  }

  Future<List> getEgentaList(int start) async {
    final uri = Uri.http(_url, '/heygenta/API/v1/egenta/getegenta.php',
        {'start': start.toString()});
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['data'] == null) {
      print('Error retrieving egenta list.');
      return null;
    }
    return jsonResponse['data'];
  }

  Future<List> getEgentaDetailList(int edisi) async {
    final uri = Uri.http(_url, '/heygenta/API/v1/egenta/getdetailegenta.php',
        {'edisi': edisi.toString()});
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse['data'] == null) {
      print('Error retrieving egenta detail list.');
      return null;
    }
    return jsonResponse['data'];
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != 200) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
