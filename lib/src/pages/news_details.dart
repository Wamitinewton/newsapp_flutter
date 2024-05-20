import 'package:flexnews/src/models/everything_model/all_news.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final AllArticals article;

  NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? 'No title',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                article.publishedAt ?? '',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  image: DecorationImage(image: NetworkImage(article.imageUrl ?? ''), fit: BoxFit.cover)
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                article.content ?? 'No content',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
