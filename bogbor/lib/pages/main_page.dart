import 'package:bogbor/cached_tile_provider.dart';
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
      body: FlutterMap(
        mapController: controller,
        options: getMapOptions(),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            fallbackUrl: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ["a", "b", "c"],
            userAgentPackageName: 'com.ayoltaxi.client',
            errorTileCallback: (tile, error) {},
            tileProvider: CachedNetworkTileProvider(),
          ),
        ],
      ),
    );
  }

  MapOptions getMapOptions() {
    return MapOptions(
      onPointerDown: (event, point) {},
      zoom: 14,
      maxZoom: 16,
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
