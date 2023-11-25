import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';

class CachedNetworkTileProvider extends TileProvider {
    @override
    ImageProvider getImage(Coords coords, TileLayer options) 
    {
     return CachedNetworkImageProvider(getTileUrl(coords, options));
    }
}
