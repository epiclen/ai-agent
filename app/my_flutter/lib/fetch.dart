import 'package:flutter_application_4/common/const.dart';
import 'package:flutter_application_4/entity/news.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<News> fetchNews(int id) async {
  final response = await http.get(Uri.parse('$SERVICE_URL$NEWS_PATH/$id'));

  if (response.statusCode == 200) {
    News result;
    result = News.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load News:${response.statusCode}');
  }
}

Future<List<News>> fetchNewsList() async {
  final response = await http.get(
    Uri.parse('$SERVICE_URL$NEWS_PATH?start=0&end=10'),
  );

  if (response.statusCode == 200) {
    List<News> result = [];
    for (var i in jsonDecode(response.body) as List<dynamic>) {
      result.add(News.fromJson(i));
    }

    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load News:${response.statusCode}');
  }
}
