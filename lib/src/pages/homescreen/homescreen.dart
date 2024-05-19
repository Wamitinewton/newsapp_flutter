import 'dart:convert';

import 'package:flexnews/src/models/everything_model/corestock_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<MetaDataModel>? _metaData;
  @override
  void initState() {
    super.initState();
    _metaData = fetchDailyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder<MetaDataModel>(
      future: _metaData,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Text(
                      data?.information ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    )));
  }

  Future<MetaDataModel> fetchDailyData() async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=UURWNRCCQHNP5KA4'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return MetaDataModel.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
