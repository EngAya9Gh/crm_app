import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
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

  LatLng selectedLocation = const LatLng(0, 0);

  @override
  void initState() {
    locationService = getIt<LocationServices>();
    initialCameraPosition = CameraPosition(
      zoom: zoom,
      target: selectedLocation,
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
        backgroundColor: kMainColor,
        onPressed: () {
          widget.locationController.text = _latLangToString(selectedLocation);
          AppNavigator.pop();
        },
        child: const Icon(
          Icons.check,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  void initLocation() async {
    // widget.locationController.text = "28.66319520608456, 39.66127845266464";
    if (!LocationServices.isValidLatLang(widget.locationController.text)) {
      widget.locationController.clear();
    }

    try {
      if (widget.locationController.text.isEmpty) {
        await _loadMyLocation();
        return;
      }
      _loadSelectedLocation();
    } catch (e) {
      AppConstants.showSnakeBar(
        context,
        "يجب تفعيل خدمة الموقع والصلاحية للوصول للموقع",
      );
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

  String _latLangToString(LatLng latLng) {
    return '${latLng.latitude},${latLng.longitude}';
  }

  void _changeLatLng() {
    googleMapController
        ?.animateCamera(CameraUpdate.newLatLng(selectedLocation));
  }

  void _changeMarker() {
    markers.clear();
    final Marker marker = Marker(
      markerId: const MarkerId('selected_location_marker'),
      position: selectedLocation,
    );
    markers.add(marker);
    setState(() {});
  }
}
