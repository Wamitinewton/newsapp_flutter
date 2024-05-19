import 'package:flexnews/src/controllers/all_news.dart';
import 'package:get/get.dart';

void init(){
  Get.lazyPut(() => CoreStockController());
}