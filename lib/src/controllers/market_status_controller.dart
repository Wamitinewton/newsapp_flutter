import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flexnews/src/core/utils/http.dart';
import 'package:flexnews/src/core/utils/loading.dart';
import 'package:flexnews/src/models/corestock_model/markets_model.dart';
import 'package:get/get.dart';

class MarketstatusController extends GetxController {
  Future<List<Markets>>? markets;
  final String apiKey = 'MWK9T2B3NJSFY38R';

  Future<List<Markets>> getMarketStatus() async {
    try {
      final response =
          await HttpUtil().get("?function=MARKET_STATUS&apikey=$apiKey");
      final json = jsonDecode(response.body) as List<dynamic>;
      return json.map((e) => Markets.fromJson(e)).toList();
    } on DioException catch (e) {
      Loading.showError(e.message!);
      return [];
    }
  }
}
