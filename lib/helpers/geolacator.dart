import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

const REGIONS_CODES = {
  0: 'RU',
  1: 'UA',
  2: 'KZ'
};

Future<dynamic> getCurrentLocationByApi() async {
    dynamic response = await http.get('http://ip-api.com/json');
    Map<dynamic, dynamic> location = jsonDecode(response.body);
    return location['countryCode'].toString();
}