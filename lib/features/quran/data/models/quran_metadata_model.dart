class QuranMetadataModel {
  final String place;

  final String type;

  final String title;

  final String titleAr;

  final String titleEn;

  final String index;

  final String page;

  final int count;

  QuranMetadataModel({
    required this.place,
    required this.type,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.index,
    required this.page,
    required this.count,
  });

  factory QuranMetadataModel.fromJson(Map<String, dynamic> json) {
    return QuranMetadataModel(
      place: json['place'],
      type: json['type'],
      title: json['title'],
      titleAr: json['titleAr'],
      titleEn: json['titleEn'],
      index: json['index'],
      page: json['page'],
      count: json['count'],
    );
  }
}
