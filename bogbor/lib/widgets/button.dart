import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.text,
      this.icon});

  Color color;
  String text;
  Widget? icon;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OnTapScaleAndFade(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: icon,
              ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
