import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islamic_habit_tracker/app/azkar/data/models/azkar_category.dart';

class AzkarService {
  Future<List<ZikrCategory>> loadZikrCategories() async {
    String jsonString =
        await rootBundle.loadString('assets/azkar_json/husnAlmuslim.json');
    List<dynamic> jsonData = json.decode(jsonString);

    List<ZikrCategory> zikrCategories =
        jsonData.map((category) => ZikrCategory.fromJson(category)).toList();
    for (var item in zikrCategories) {
      print(item.category);
    }
    return zikrCategories;
  }
}
