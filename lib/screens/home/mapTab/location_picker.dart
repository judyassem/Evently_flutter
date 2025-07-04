import 'package:evently/common/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_provider.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LocationProvider(),
      child: Consumer<LocationProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Select Location')),
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: (controller) {provider.mapController = controller;},
                    initialCameraPosition: CameraPosition(
                      target: LatLng(29.95375640, 31.53700030),
                      zoom: 14,
                    ),
                    onTap: (latLng) {
                      provider.changeSelectedLocation(latLng);
                    },
                    markers: selectedLocation == null
                        ? {}
                        : {
                      Marker(
                        markerId: const MarkerId("selected-location"),
                        position: selectedLocation!,
                      )
                    },
                  ),
                ),
                CustomElevatedButton(
                    elevation: 0,
                    text: "Tap to select Location",
                    onClick: (){})
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                if (selectedLocation != null) {
                  Navigator.pop(context, selectedLocation);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Please tap on map to select location")),
                  );
                }
              },
              label: const Text("Confirm Location"),
              icon: const Icon(Icons.check),
            ),
          );
        }
      ),
    );
  }
}
