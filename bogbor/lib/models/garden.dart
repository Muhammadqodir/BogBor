// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:latlong2/latlong.dart';

class Garden {
  String city;
  List<LatLng> area;
  int count;
  String type;
  String sort;
  String status;
  String description;
  String price;
  String picture;
  String phone;
  Garden({
    required this.city,
    required this.area,
    required this.count,
    required this.type,
    required this.sort,
    required this.status,
    required this.description,
    required this.price,
    required this.picture,
    required this.phone,
  });

  LatLng calculateCenter() {
    int numberOfPoints = area.length;
    double totalLatitude = 0.0;
    double totalLongitude = 0.0;

    for (int i = 0; i < numberOfPoints; i++) {
      totalLatitude += area[i].latitude;
      totalLongitude += area[i].longitude;
    }

    double centerLatitude = totalLatitude / numberOfPoints;
    double centerLongitude = totalLongitude / numberOfPoints;

    return LatLng(centerLatitude, centerLongitude);
  }
}
