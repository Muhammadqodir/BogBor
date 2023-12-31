import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({super.key, required this.onTap, required this.color, required this.icon});

  final Color color;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      child: Stack(
        children: [
          Image.asset(
            "res/marker.png",
            color: color,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
