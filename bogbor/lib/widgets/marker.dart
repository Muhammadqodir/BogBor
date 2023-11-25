import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;

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
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}
