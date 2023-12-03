import 'dart:math';

import 'package:bogbor/constraints.dart';
import 'package:bogbor/icons.dart';
import 'package:bogbor/models/garden.dart';
import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GardenSheet extends StatelessWidget {
  const GardenSheet({super.key, required this.garden});
  final Garden garden;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: filter[garden.type]!["color"] as Color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    filter[garden.type]!["icon"] as String,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Text(
                      garden.type,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      garden.sort,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  garden.getDistanceStr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manzil:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Bog maydoni:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Kochatlar soni:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Kochatlar yoshi:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Xosil xajmi:",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        garden.city,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        garden.calculateArea().toStringAsFixed(0) + " kv. m.",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        garden.count.toString() + " ta",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        garden.age.toString() + " yosh",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        (garden.calculateArea() + garden.count * garden.age)
                                .toStringAsFixed(0) +
                            " kg",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    launchUrlString("tel:" + garden.phone);
                  },
                  color: primaryColor,
                  text: "Qo'ngiroq",
                  icon: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomButton(
                  onTap: () async {
                    final availableMaps = await MapLauncher.installedMaps;

                    await availableMaps.first.showMarker(
                      coords: Coords(garden.calculateCenter().latitude,
                          garden.calculateCenter().longitude),
                      title: "${garden.type} bog'i",
                    );
                  },
                  color: warning,
                  icon: const Icon(
                    Icons.map_outlined,
                    color: Colors.white,
                  ),
                  text: "Yo'l ko'rsat",
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
