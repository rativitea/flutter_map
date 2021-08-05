// import 'package:latlong2/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class CenterZoom {
  final google_maps.LatLng center;
  final double zoom;
  CenterZoom({required this.center, required this.zoom});
}
