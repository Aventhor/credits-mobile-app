import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

const REGIONS_CODES = {
  0: 'RU',
  1: 'UA',
  2: 'KZ'
};

Future<dynamic> getCurrentLocation() async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
  return placemark[0].isoCountryCode;
}

Future<dynamic> getCurrentLocationByApi() async {
    dynamic response = await http.get('http://ip-api.com/json');
    Map<dynamic, dynamic> location = jsonDecode(response.body);
    return location['countryCode'].toString();
}