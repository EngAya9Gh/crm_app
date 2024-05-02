import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late final LocationServices locationService;
  late final CameraPosition initialCameraPosition;

  late final GoogleMapController? googleMapController;

  final Set<Marker> markers = {};

  final double zoom = 12;

  @override
  void initState() {
    locationService = getIt<LocationServices>();
    initialCameraPosition = CameraPosition(
      zoom: zoom,
      target: const LatLng(31.187084851056554, 29.928110526889437),
    );
    updateMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        googleMapController = controller;
      },
      initialCameraPosition: initialCameraPosition,
      zoomControlsEnabled: false,
      markers: markers,
    );
  }

  void updateMyLocation() async {
    try {
      final LocationData locationData = await locationService.getLocation();
      setMyLocationMarker(locationData);
      setMyCameraPosition(locationData);
    } on BaseAppException catch (e) {
      AppConstants.showSnakeBar(context, e.message);
    }
  }

  void setMyCameraPosition(LocationData locationData) {
    var cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: zoom,
    );

    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  void setMyLocationMarker(LocationData locationData) {
    final Marker myLocationMarker = Marker(
      markerId: const MarkerId('my_location_marker'),
      position: LatLng(locationData.latitude!, locationData.longitude!),
    );

    markers.add(myLocationMarker);
    setState(() {});
  }
}
