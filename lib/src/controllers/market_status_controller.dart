import 'dart:convert';
import 'package:flexnews/src/models/everything_model/all_news.dart';
import 'package:http/http.dart' as http;


Future<AllNewsResponse> fetchAllNews(String query) async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$query&apiKey=53ea041b1e1c4c659b41767532da63f2'));

  if (response.statusCode == 200) {
    return AllNewsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load news');
  }
}

Future<AllNewsResponse> fetchHeadlines(String category) async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=53ea041b1e1c4c659b41767532da63f2'));

  if (response.statusCode == 200) {
    return AllNewsResponse.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Failed');
  }
}
