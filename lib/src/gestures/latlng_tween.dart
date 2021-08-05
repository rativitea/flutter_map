import 'package:flutter/animation.dart';
// import 'package:latlong2/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;

class LatLngTween extends Tween<google_maps.LatLng> {
  LatLngTween(
      {required google_maps.LatLng begin, required google_maps.LatLng end})
      : super(begin: begin, end: end);

  @override
  google_maps.LatLng lerp(double t) => google_maps.LatLng(
        begin!.latitude + (end!.latitude - begin!.latitude) * t,
        begin!.longitude + (end!.longitude - begin!.longitude) * t,
      );
}
