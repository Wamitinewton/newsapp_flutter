import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexnews/src/core/utils/http.dart';
import 'package:flexnews/src/core/utils/loading.dart';
import 'package:flexnews/src/models/corestock_model/corestock_model.dart';
import 'package:get/get.dart';

class CoreStockController extends GetxController{
    final String apiKey = 'MWK9T2B3NJSFY38R';
  Future<List<MetaData>>? metaData;

  Future<List<MetaData>> getIntradayData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaData.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaData>> getDailyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaData.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaData>> getWeeklyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaData.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaData>> getMonthlyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaData.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

  
}