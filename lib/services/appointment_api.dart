import 'dart:convert';

import 'package:decorly/models/appointment.dart';
import 'package:flutter/services.dart';

class AppointmentAPI {
  //Imitate the REST API call using json assets
  String url = "";
  Future<DataAppointment?> getData(int month, int day) async{
    if (month == 5 && day == 6) {
      url = "assets/jsons/sample_appointment.json";
    } else {
      return null;
        }
    final String resp = await rootBundle.loadString(url);
    final data = await jsonDecode(resp);
    final DataAppointment dataAppointment = DataAppointment.fromJson(data);
    return dataAppointment;
  }
}