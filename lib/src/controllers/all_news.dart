import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexnews/src/core/utils/http.dart';
import 'package:flexnews/src/core/utils/loading.dart';
import 'package:flexnews/src/models/everything_model/corestock_model.dart';
import 'package:get/get.dart';

class CoreStockController extends GetxController{
    final String apiKey = 'demo';
  Future<List<MetaDataModel>>? metaData;

  Future<List<MetaDataModel>> getIntradayData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaDataModel.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaDataModel>> getDailyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_DAILY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaDataModel.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaDataModel>> getWeeklyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_WEEKLY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaDataModel.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

   Future<List<MetaDataModel>> getMonthlyData() async {
    try {
      final response = await HttpUtil().get(
        "?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=IBM&apikey=$apiKey"
      );
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => MetaDataModel.fromJson(e)).toList();
    } on DioException catch (e){
      Loading.showError(e.message!);
      return [];
    }
  }

  
}