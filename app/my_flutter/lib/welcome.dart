import 'package:flutter/material.dart';
import 'package:flutter_application_4/entity/news.dart';
import 'package:flutter_application_4/fetch.dart';
import 'package:flutter_application_4/news.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: [Text('News', style: TextStyle(fontSize: 20))]),
        NewsList(),
        Row(children: [Text('Discounrt', style: TextStyle(fontSize: 20))]),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                      child: DiscountCard(
                        icon: Icons.shopping_basket_sharp,
                        title: 'Shopping',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                      child: DiscountCard(
                        icon: Icons.food_bank_sharp,
                        title: 'Foods',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                      child: DiscountCard(
                        icon: Icons.airplane_ticket_sharp,
                        title: 'Travel',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2,
                    height: screenHeight / 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 10, 10),
                      child: DiscountCard(
                        icon: Icons.house_sharp,
                        title: 'House',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [Icon(icon), Text(title)]),
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.title,
    required this.content,
    required this.newsId,
  });

  final String title;
  final String content;
  final int newsId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewsDetail(newsId: newsId)),
      ),
      child: Card(
        color: const Color.fromARGB(255, 54, 121, 209),
        // 可选：让卡片边距更紧凑
        // margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 让文字靠左
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17, color: Color(0xFFFFFFFF)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 7),
              Text(
                content,
                style: TextStyle(color: Color(0xFFFFFFFF)),
                softWrap: true,
                maxLines: 4, // 兜底，最多 4 行
                overflow: TextOverflow.ellipsis, // 超出省略
              ),
              // SizedBox(height: 20),
              // ElevatedButton 不是 const，因为有 onPressed
            ],
          ),
        ),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late Future<List<News>> future;

  @override
  void initState() {
    super.initState();
    future = fetchNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in asyncSnapshot.data!)
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: OfferCard(
                      title: item.title,
                      content: item.content!,
                      newsId: item.newsId!,
                    ),
                  ),
              ],
            ),
          );
        } else if (asyncSnapshot.hasError) {
          return Text('${asyncSnapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
