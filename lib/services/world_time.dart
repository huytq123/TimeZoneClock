import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:developer';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime = true;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      // Call api
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'Error';
    }

  }
}
