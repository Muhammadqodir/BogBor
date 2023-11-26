import 'dart:convert';

import 'package:bogbor/capitalize.dart';
import 'package:bogbor/models/garden.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Garden>> getGardens() async {
    List<Garden> list = [];
    http.Response res = await http.get(
        Uri.parse('https://m3574.myxvest.ru/bogbor/index.php/get-gardens'));
    if (res.statusCode == 200) {
      List<dynamic> parsedJson = jsonDecode(res.body);
      for (var element in parsedJson) {
        print(element["location"]);
        List<LatLng> area = [];
        for (var coords in jsonDecode(element["area"])["coordinates"][0]) {
          area.add(LatLng(double.parse(coords[1]), double.parse(coords[0])));
        }
        list.add(Garden(
          city: element["location"] ?? "undefined",
          area: area,
          count: int.parse(element["count"]) ?? 0,
          type: (element["title"] as String).capitalize(),
          sort: element["sort"] ?? "",
          status: element["status"] ?? "undefined",
          description: element["description"] ?? "undefined",
          price: element["price_for_kg"],
          picture: element["pictures"],
          phone: element["user_phone"],
        ));
      }
    }
    return list;
  }
}
