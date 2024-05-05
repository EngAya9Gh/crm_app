import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({
    super.key,
    required this.locationController,
  });

  final TextEditingController locationController;

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late final LocationServices locationService;
  late final CameraPosition initialCameraPosition;

  late final GoogleMapController? googleMapController;

  final Set<Marker> markers = {};

  final double zoom = 12;

  LatLng? selectedLocation; // default value is current location

  @override
  void initState() {
    locationService = getIt<LocationServices>();
    initialCameraPosition = CameraPosition(
      zoom: zoom,
      target: const LatLng(0, 0),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          googleMapController = controller;
          initLocation();
        },
        onTap: (LatLng latLng) {
          selectedLocation = latLng;
          _updateMap();
        },
        initialCameraPosition: initialCameraPosition,
        zoomControlsEnabled: false,
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.locationController.text =
              '${selectedLocation!.latitude},${selectedLocation!.longitude}';
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  void initLocation() async {
    try {
      if (widget.locationController.text.isNotEmpty) {
        _loadSelectedLocation();
        return;
      }
      await _loadMyLocation();
    } catch (e) {
      AppConstants.showSnakeBar(context, e.toString());
    }
  }

  Future<void> _loadMyLocation() async {
    final LocationData locationData = await locationService.getLocation();
    final LatLng myLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    selectedLocation = myLocation;

    _updateMap();
  }

  void _loadSelectedLocation() {
    final List<String> location = widget.locationController.text.split(',');
    selectedLocation = LatLng(
      double.parse(location.first),
      double.parse(location.last),
    );
    _updateMap();
  }

  // change camera position

  void _updateMap() {
    _changeMarker();
    _changeLatLng();
  }

  void _changeLatLng() {
    googleMapController
        ?.animateCamera(CameraUpdate.newLatLng(selectedLocation!));
  }

  void _changeMarker() {
    markers.clear();
    final Marker marker = Marker(
      markerId: const MarkerId('selected_location_marker'),
      position: selectedLocation!,
    );
    markers.add(marker);
    setState(() {});
  }
}
