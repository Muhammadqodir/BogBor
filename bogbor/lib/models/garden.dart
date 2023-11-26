// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bogbor/constraints.dart';
import 'package:bogbor/icons.dart';
import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/button.dart';
import 'package:bogbor/widgets/garden_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  double calculatePolygonArea(List<LatLng> polygon) {
    int numberOfPoints = polygon.length;

    double sum = 0.0;
    for (int i = 0; i < numberOfPoints; i++) {
      final currentPoint = polygon[i];
      final nextPoint = polygon[(i + 1) % numberOfPoints];

      sum += (currentPoint.latitude * nextPoint.longitude) -
          (currentPoint.latitude * nextPoint.longitude);
    }

    double area = 0.5 * sum.abs();
    return area;
  }

  double distanceTo() {
    return Geolocator.distanceBetween(calculateCenter().latitude,
        calculateCenter().longitude, 40.364584, 71.774463);
  }

  String getDistanceStr() {
    int km = distanceTo() ~/ 1000;
    if (km == 0) {
      int mertes = (distanceTo() % 1000).round();
      return "$mertes metr";
    }
    return "$km km";
  }

  Widget getWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: filter[type]!["color"] as Color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    filter[type]!["icon"] as String,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text(
                      type,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      sort,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  getDistanceStr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return GardenSheet(garden: this);
                      },
                    );
                  },
                  color: primaryColor,
                  text: "Malumot",
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 12,
              // ),
              // Expanded(
              //   child: CustomButton(
              //     onTap: () {},
              //     color: warning,
              //     icon: const Icon(
              //       Icons.map_outlined,
              //       color: Colors.white,
              //     ),
              //     text: "Yo'l ko'rsat",
              //   ),
              // ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
