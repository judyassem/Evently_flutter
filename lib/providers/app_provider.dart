import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocale = "en";

  bool get isAr => currentLocale == "ar";

  void updateLocale(String locale) {
    currentLocale = locale;
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  bool get isDark => theme == ThemeMode.dark;

  void updateTheme(ThemeMode newTheme) {
    theme = newTheme;
    notifyListeners();
  }
}


class LocationProvider extends ChangeNotifier {
  Location location = Location();
  String message = '';

  getLocation() async {
    bool isPermissionEnabled = await _checkPermission();
    if (!isPermissionEnabled) {
      message = 'Permission denied';
      notifyListeners();
      return;
    }
    bool isServiceEnabled = await _checkService();
    if (!isServiceEnabled) {
      message = 'Location service disabled';
      notifyListeners();
      return;
    }
    LocationData locationData = await location.getLocation();
  }

  Future<bool> _checkPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    bool isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
    return isServiceEnabled;
  }

  late GoogleMapController mapController;

  goToLocation(LatLng location) {
    mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(location.latitude, location.longitude),
              zoom: 15
            )
        )
    );
  }

  LatLng? selectedLocation;

  changeSelectedLocation(LatLng newLocation) {
    selectedLocation = newLocation;
    goToLocation(newLocation);
    notifyListeners();
  }
}