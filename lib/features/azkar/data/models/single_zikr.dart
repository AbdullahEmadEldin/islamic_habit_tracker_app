class Zikr {
  int id;
  String text;
  int count;
  String audio;
  String filename;

  Zikr(
      {required this.id,
      required this.text,
      required this.count,
      required this.audio,
      required this.filename});

  factory Zikr.fromJson(Map<String, dynamic> json) {
    return Zikr(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['count'] = count;
    data['audio'] = audio;
    data['filename'] = filename;
    return data;
  }
}
