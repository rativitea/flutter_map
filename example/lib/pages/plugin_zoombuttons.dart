import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong2/latlong.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import '../widgets/drawer.dart';
import 'zoombuttons_plugin_option.dart';

class PluginZoomButtons extends StatelessWidget {
  static const String route = '/plugin_zoombuttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ZoomButtonsPlugins')),
      drawer: buildDrawer(context, PluginZoomButtons.route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: google_maps.LatLng(51.5, -0.09),
                  zoom: 5.0,
                  plugins: [
                    ZoomButtonsPlugin(),
                  ],
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    tileProvider: NonCachingNetworkTileProvider(),
                  ),
                ],
                nonRotatedLayers: [
                  ZoomButtonsPluginOption(
                    minZoom: 4,
                    maxZoom: 19,
                    mini: true,
                    padding: 10,
                    alignment: Alignment.bottomRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
