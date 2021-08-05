import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import '../widgets/drawer.dart';

class OverlayImagePage extends StatelessWidget {
  static const String route = 'overlay_image';

  @override
  Widget build(BuildContext context) {
    var overlayImages = <OverlayImage>[
      OverlayImage(
          bounds: LatLngBounds(google_maps.LatLng(51.5, -0.09),
              google_maps.LatLng(48.8566, 2.3522)),
          opacity: 0.8,
          imageProvider: NetworkImage(
              'https://images.pexels.com/photos/231009/pexels-photo-231009.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=300&w=600')),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Overlay Image')),
      drawer: buildDrawer(context, route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text('This is a map that is showing (51.5, -0.9).'),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: google_maps.LatLng(51.5, -0.09),
                  zoom: 6.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  OverlayImageLayerOptions(overlayImages: overlayImages)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
