import 'package:islamic_habit_tracker/app/azkar/data/models/single_zikr.dart';

class ZikrCategory {
  int id;
  String category;
  String audio;
  String filename;
  List<Zikr> azkar;

  ZikrCategory(
      {required this.id,
      required this.category,
      required this.audio,
      required this.filename,
      required this.azkar});

  factory ZikrCategory.fromJson(Map<String, dynamic> json) {
    final List<dynamic> azkarJson = json['array'];
    final List<Zikr> azkar =
        azkarJson.map((zikr) => Zikr.fromJson(zikr)).toList();
    return ZikrCategory(
      id: json['id'],
      category: json['category'],
      audio: json['audio'],
      filename: json['filename'],
      azkar: azkar,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['audio'] = audio;
    data['filename'] = filename;
    data['array'] = azkar.map((v) => v.toJson()).toList();

    return data;
  }
}
