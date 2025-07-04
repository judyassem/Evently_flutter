import 'package:evently/firebase_helpers/firestore_helper.dart';
import 'package:evently/model/eventDM.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_provider.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  GoogleMapController? googleMapController;
  late LocationProvider locationProvider;

  @override
  void initState() {
    locationProvider = Provider.of<LocationProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    locationProvider = Provider.of<LocationProvider>(context);
    return Consumer<LocationProvider>(
        builder: (context, provider, child) {
          return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(29.95375640, 31.53700030),
                zoom: 15,
              ),
          );
        }
    );
  }
}

// Scaffold(
// body: StreamBuilder<List<EventDM>>(
// stream: getEventFromFirestore(),
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return Center(child: Text('Error: ${snapshot.error}'));
// }
//
// if (!snapshot.hasData) {
// return Center(child: CircularProgressIndicator());
// }
//
// final events = snapshot.data!;
// final markers = events
//     .where((e) => e.lat != null && e.lng != null)
//     .map((event) {
// return Marker(
// markerId: MarkerId(event.id),
// position: LatLng(event.lat!.toDouble(), event.lng!.toDouble()),
// infoWindow: InfoWindow(title: event.name),
// );
// })
//     .toSet();
//
// return GoogleMap(
// initialCameraPosition: CameraPosition(
// target: LatLng(29.95375640, 31.53700030),
// zoom: 15,
// ),
// markers: markers,
// onMapCreated: (controller) => googleMapController = controller,
// );
// },
// ),
// );