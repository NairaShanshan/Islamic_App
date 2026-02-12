import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/features/asma_allah/data/models/asmaa_allah_model.dart';

class AsmaaService {
  Future<List<AsmaaModel>> loadAsmaa() async {
    final String jsonReading = await rootBundle.loadString(
      'assets/data/asmaa_allah_al_husna.json',
    );

    final List<dynamic> jsonData = json.decode(jsonReading);

    return jsonData.map((item) => AsmaaModel.fromJson(item)).toList();
  }
}
