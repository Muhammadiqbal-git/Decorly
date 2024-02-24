import 'dart:convert';

import 'package:decorly/models/featured_item.dart';
import 'package:flutter/services.dart';

class FurnitureAPI {

  String url = "";
  Future<DataFurniture> getData(int indexTop3) async{
    if (indexTop3 == 1) {
      url = "assets/jsons/sample_furniture1.json";
    } else {
      url = "assets/jsons/sample_furniture2.json";
    }
    final String resp = await rootBundle.loadString(url);
    final data = await jsonDecode(resp);
    final DataFurniture dataFurniture = DataFurniture.fromJson(data);
    return dataFurniture;
  }
}