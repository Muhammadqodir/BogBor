import 'dart:io';

import 'package:bogbor/cached_tile_provider.dart';
import 'package:bogbor/constraints.dart';
import 'package:bogbor/cubit/gardens_cubit.dart';
import 'package:bogbor/icons.dart';
import 'package:bogbor/models/garden.dart';
import 'package:bogbor/pages/list_page.dart';
import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/bottom_nav.dart';
import 'package:bogbor/widgets/fadeindexed.dart';
import 'package:bogbor/widgets/garden_sheet.dart';
import 'package:bogbor/widgets/marker.dart';
import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MapController controller = MapController();

  int selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GardensCubit>().update();
  }

  @override
  Widget build(BuildContext context) {
    List<Garden> gardens = context.watch<GardensCubit>().state.gardens;
    return Scaffold(
      body: Stack(
        children: [
          FadeIndexedStack(
            index: selected,
            children: [
              FlutterMap(
                mapController: controller,
                options: getMapOptions(),
                children: [
                  TileLayer(
                    urlTemplate:
                        'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga',
                    fallbackUrl:
                        'http://mt0.google.com/vt/lyrs=y&hl=en&x={x}&y={y}&z={z}&s=Ga',
                    userAgentPackageName: 'com.ayoltaxi.client',
                    errorTileCallback: (tile, error) {},
                    tileProvider: CachedNetworkTileProvider(),
                  ),
                  PolygonLayer(
                    polygons: gardens
                        .map(
                          (e) => Polygon(
                            color: filter[e.type] != null
                                ? (filter[e.type]!["color"] as Color)
                                    .withAlpha(100)
                                : Colors.grey.withAlpha(100),
                            borderStrokeWidth: 3,
                            borderColor: filter[e.type]!["color"] as Color,
                            isFilled: true,
                            strokeCap: StrokeCap.square,
                            points: e.area,
                          ),
                        )
                        .toList(),
                  ),
                  MarkerLayer(
                    markers: gardens
                        .map(
                          (e) => Marker(
                            point: e.calculateCenter(),
                            width: 50,
                            height: 50,
                            anchorPos: AnchorPos.align(AnchorAlign.top),
                            rotate: true,
                            builder: (ctx) => MarkerWidget(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return GardenSheet(garden: e);
                                  },
                                );
                              },
                              color: filter[e.type]!["color"] as Color,
                              icon: filter[e.type]!["icon"] as String,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const ListPage()
            ],
          ),
          Positioned(
            child: SafeArea(
              child: Padding(
                padding: Platform.isAndroid
                    ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                    : const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        "res/logo.png",
                        width: 58,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        "Bog'Bor",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color:
                                  selected == 0 ? Colors.white : textColorLight,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    OnTapScaleAndFade(
                      child: Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                            gradient: primaryGradinet,
                            borderRadius: BorderRadius.circular(24)),
                        child: const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        context.read<GardensCubit>().update();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: Platform.isAndroid
                    ? const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                    : const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavigation(
                    selected: selected,
                    onSelect: (p0) {
                      setState(() {
                        selected = p0;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  MapOptions getMapOptions() {
    return MapOptions(
      onPointerDown: (event, point) {},
      zoom: 14,
      maxZoom: 18,
      center: LatLng(40.532626, 71.7158532),
      interactiveFlags: InteractiveFlag.pinchZoom |
          InteractiveFlag.drag |
          InteractiveFlag.pinchMove,
      minZoom: 10,
      rotation: 0,
      onMapReady: () async {},
    );
  }
}
