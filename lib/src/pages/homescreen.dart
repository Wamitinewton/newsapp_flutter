import 'package:flexnews/src/controllers/market_status_controller.dart';
import 'package:flexnews/src/models/everything_model/all_news.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<AllNewsResponse> futureAllNews;

  @override
  void initState() {
    super.initState();
    // futureAllNews = fetchAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ethereum News'),
      ),
      body: Center(
        child: FutureBuilder<AllNewsResponse>(
          future: futureAllNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.allArticals?.length ?? 0,
                itemBuilder: (context, index) {
                  final article = snapshot.data!.allArticals![index];
                  return ListTile(
                    title: Text(article.title ?? 'No title'),
                    subtitle: Text(article.description ?? 'No description'),
                    onTap: () {
                      // Handle tap, perhaps open the URL in a browser
                    },
                  );
                },
              );
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
