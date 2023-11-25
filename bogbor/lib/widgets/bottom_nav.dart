import 'dart:ui';

import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).textTheme.bodyLarge!.color!.withAlpha(
                    20,
                  ),
            ),
            borderRadius: BorderRadius.circular(24),
            gradient: primaryGradinet),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        child: Row(
          children: [
            BottomNavBtn(
              icon: CupertinoIcons.compass,
              onTap: () {},
              isSelected: true,
            ),
            BottomNavBtn(
              icon: CupertinoIcons.rectangle_grid_1x2,
              onTap: () {
                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (context) => MeetingsScrean()
                //   ),
                // );
              },
              isSelected: false,
            ),
            BottomNavBtn(
              icon: CupertinoIcons.chat_bubble_2,
              onTap: () {},
              isSelected: false,
            ),
            BottomNavBtn(
              icon: CupertinoIcons.person,
              onTap: () {},
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OnTapScaleAndFade(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.white.withAlpha(150),
            shadows: [
              Shadow(
                color: Colors.white.withAlpha(40),
                blurRadius: 5,
              )
            ],
            size: 38,
          ),
        ),
      ),
    );
  }
}
