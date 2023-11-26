import 'dart:ui';

import 'package:bogbor/cubit/gardens_cubit.dart';
import 'package:bogbor/models/garden.dart';
import 'package:bogbor/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    List<Garden> gardens = context.watch<GardensCubit>().state.gardens;
    return Stack(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 120, bottom: 120),
            children: gardens.map((e) => e.getWidget(context)).toList(),
          ),
        ),
        Positioned(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 9.0,
                sigmaY: 9.0,
              ),
              child: Container(
                height: 120,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
