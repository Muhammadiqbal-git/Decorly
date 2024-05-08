import 'dart:convert';

import 'package:decorly/models/furniture_item.dart';
import 'package:flutter/services.dart';

class FurnitureAPI {
  //Imitate the REST API call using json assets

  String url = "";
  Future<DataFurniture> getData(int indexTop3) async {
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

  Future<DataFurniture> updateData(int indexTop3, String id) async {
    if (indexTop3 == 1) {
      url = "assets/jsons/sample_furniture1.json";
    } else {
      url = "assets/jsons/sample_furniture2.json";
    }
    final String resp = await rootBundle.loadString(url);
    final dynamic data = await jsonDecode(resp);
    final List d = data["data"];
    int index = d.indexWhere((element) => element.containsValue(id));
    data["data"][index]["bookmark"] = !data["data"][index]["bookmark"];
    final DataFurniture dataFurniture = DataFurniture.fromJson(data);
    return dataFurniture;
  }

  Future<DataFurniture> getAllData(List<String> filter) async {
    if (filter.contains("modern")) {
      url = "assets/jsons/sample_furniture_filter.json";
    } else {
      url = "assets/jsons/sample_furniture_full.json";
    }
    final String resp = await rootBundle.loadString(url);
    final data = await jsonDecode(resp);
    final DataFurniture dataFurniture = DataFurniture.fromJson(data);
    return dataFurniture;
  }
}
