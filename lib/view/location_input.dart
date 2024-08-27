import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geoloc;

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'palce.dart'; // Added permission_handler
// import 'package:location/location.dart';

class Location_input extends StatefulWidget {
  const Location_input({super.key, required this.onselectedlocation});
  final void Function(Location_class location) onselectedlocation;
  @override
  State<Location_input> createState() => _Location_inputState();
}

class _Location_inputState extends State<Location_input> {
  String currentlocation = "No location yet";
  double lat=0;
  double long=0;
  List place_location = [];
  Position? location_input;

  Future picklocation() async {
    PermissionStatus? permission;

    // Check and request location permission
    permission = await Permission.locationWhenInUse.request();
    if (permission == PermissionStatus.denied) {
      Permission.location.request();
      // Explain why location is needed and request again
      permission = await Permission.locationWhenInUse.request();
      if (permission == PermissionStatus.denied) {
        // return Future.error('Location permissions are denied. App cannot access your location.');
      }
    }
    if (permission == PermissionStatus.permanentlyDenied) {
      // Open app settings for user to allow permission
      await openAppSettings();
      // return Future.error('Location permissions are permanently denied. Please allow them in app settings.');
    }

    // When we reach here, permissions are granted

    final position = await Geolocator.getCurrentPosition();
    List<geoloc.Placemark> placemarks = await geoloc.placemarkFromCoordinates(position.latitude,position.longitude);

    setState(() {
      currentlocation = "${position.latitude} ${position.longitude}";
      lat=position.latitude;
      long=position.longitude;
      place_location.addAll(placemarks);
    });
    final instane =
        Location_class(lat: position.latitude, long: position.longitude);
    widget.onselectedlocation(instane);

    print("the palce location is : ${place_location[1]}");
    print("${position.latitude}");
    // return position;
  }

  //   picklocation()async{
  //   Location location = new Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //
  //   // List<geoloc.Placemark> placemarks = await geoloc.placemarkFromCoordinates(31.155852,31.938419);
  //   // print(placemarks);
  //   print("lat:${_locationData.longitude},long:${_locationData.latitude}");
  //
  //   setState((){
  //   currentlocation="${_locationData.latitude} ${_locationData.longitude}";
  // });
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              border: const Border()),
          alignment: Alignment.center,

          child: place_location.isEmpty
              ? Text(currentlocation)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("location: ${currentlocation}"),
                      Text("Country: ${place_location[0].country}"),
                      Text("State: ${place_location[0].administrativeArea}"),
                      Text("SubState: ${place_location[0].locality}"),
                      Text("Street: ${place_location[0].name}"),
                    ],
                  ),
                ), // Use const Text for better performance
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: picklocation,
                icon: const Icon(Icons.location_on),
                label: const Text("Choose current location"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

////////////////////////

// the location package/

//////////////

// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   PermissionStatus permission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled, inform the user
//     print("Location services are disabled.");
//     return Future.error('Please enable location services to access your current location.');
//   }
//
//   // Check and request location permission
//   permission = await Permission.locationWhenInUse.request();
//   if (permission == PermissionStatus.denied) {
//     // Explain why location is needed and request again
//     permission = await Permission.locationWhenInUse.request();
//     if (permission == PermissionStatus.denied) {
//       print("Location permissions are denied");
//       return Future.error('Location permissions are denied. App cannot access your location.');
//     }
//   }
//
//   if (permission == PermissionStatus.permanentlyDenied) {
//     // Open app settings for user to allow permission
//     await openAppSettings();
//     return Future.error('Location permissions are permanently denied. Please allow them in app settings.');
//   }
//
//   // When we reach here, permissions are granted
//   final position = await Geolocator.getCurrentPosition();
//   print("Current location: ${position.latitude}, ${position.longitude}");
//   return position;
// }

////////////////////////////////

// the geolocator package

//////////////////////////////////

// Future picklocation() async {
//   bool serviceEnabled;
//   PermissionStatus? permission;
//
//   // Test if location services are enabled.
//   // serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   // if (!serviceEnabled) {
//   //   // Location services are not enabled, inform the user
//   //   print("Location services are disabled.");
//   //   return Future.error('Please enable location services to access your current location.');
//   // }
//
//   // Check and request location permission
//   permission = await Permission.locationWhenInUse.request();
//   if (permission == PermissionStatus.denied) {
//     Permission.location.request();
//     // Explain why location is needed and request again
//     permission = await Permission.locationWhenInUse.request();
//     if (permission == PermissionStatus.denied) {
//       // return Future.error('Location permissions are denied. App cannot access your location.');
//     }
//   }
//   if (permission == PermissionStatus.permanentlyDenied) {
//     // Open app settings for user to allow permission
//     await openAppSettings();
//     // return Future.error('Location permissions are permanently denied. Please allow them in app settings.');
//   }
//
//   // When we reach here, permissions are granted
//
//   final position = await Geolocator.getCurrentPosition();
//   // List<geoloc.Placemark> placemarks = await geoloc.placemarkFromCoordinates(31.155852,31.938419);
//
//   print("Current location:lat ${position.latitude},long ${position.longitude}");
//   setState((){
//     currentlocation="${position.latitude} ${position.longitude}";
//   });
//
//   // return position;
// }
