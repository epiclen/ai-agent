import 'package:flutter/material.dart';
import 'package:flutter_application_4/entity/news.dart';
import 'package:flutter_application_4/fetch.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key, required this.newsId});

  final int newsId;

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  late Future<News> future;

  @override
  void initState() {
    super.initState();
    future = fetchNews(widget.newsId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return Column(
                children: [
                  Text(asyncSnapshot.data!.title),
                  Text(asyncSnapshot.data!.content!),
                  ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text('Back to main page'),
                  ),
                ],
              );
            } else if (asyncSnapshot.hasError) {
              return Text('${asyncSnapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
