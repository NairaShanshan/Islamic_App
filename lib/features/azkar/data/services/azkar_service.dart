import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/features/azkar/data/models/azkar_model.dart';

class AzkarService {

  Future<List<AzkarModel>> loadAzkar () async {

    final String jsonReading = await rootBundle.loadString('assets/data/azkar.json') ;

    final List<dynamic> jsonData = json.decode(jsonReading) ;

    return jsonData.map((item) => AzkarModel.fromJson(item)).toList() ;
  }
}