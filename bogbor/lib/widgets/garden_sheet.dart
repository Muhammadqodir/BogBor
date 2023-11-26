import 'package:bogbor/icons.dart';
import 'package:bogbor/models/garden.dart';
import 'package:flutter/material.dart';

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
                const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
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
          
        ],
      ),
    );
  }
}
