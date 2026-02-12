class AsmaaModel {
  final int id;
  final String name;
  final String meaning;

  AsmaaModel({
    required this.id,
    required this.name,
    required this.meaning,
  });

  factory AsmaaModel.fromJson(Map<String, dynamic> json) {
    return AsmaaModel(
      id: json['id'],
      name: json['name'],
      meaning: json['meaning'],
    );
  }
}

