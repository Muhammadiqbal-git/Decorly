import 'dart:convert';

import 'package:decorly/models/designer.dart';
import 'package:flutter/services.dart';

class DesignerAPI {
  //Imitate the REST API call using json assets

  String url = "";
  Future<DataDesigner> getData() async{
    url = "assets/jsons/sample_designer.json";
    final String resp = await rootBundle.loadString(url);
    final data = await jsonDecode(resp);
    final DataDesigner dataDesigner = DataDesigner.fromJson(data);
    return dataDesigner;
  }
}