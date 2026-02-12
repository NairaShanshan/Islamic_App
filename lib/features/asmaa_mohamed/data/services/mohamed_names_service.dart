import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/features/asma_allah/data/models/asmaa_allah_model.dart';


class MohamedNamesService {

 Future<List<AsmaaModel>> loadNames() async {

  final String jsonReading =await rootBundle.loadString('assets/data/asmaa_mohamed.json');

  final List<dynamic> jsonData = json.decode(jsonReading) ;

  return jsonData.map((item) => AsmaaModel.fromJson(item)).toList() ;
 }
}

