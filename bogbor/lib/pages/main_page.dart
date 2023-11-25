import 'package:bogbor/cached_tile_provider.dart';
import 'package:bogbor/themes.dart';
import 'package:bogbor/widgets/bottom_nav.dart';
import 'package:bogbor/widgets/ontapscale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MapController controller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            ],
          ),
          Positioned(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavigation(),
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
      center: LatLng(40.385708, 71.783266),
      interactiveFlags: InteractiveFlag.pinchZoom |
          InteractiveFlag.drag |
          InteractiveFlag.pinchMove,
      minZoom: 10,
      rotation: 0,
      onMapReady: () async {},
    );
  }
}
