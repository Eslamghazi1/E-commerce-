import 'package:ecommerce/view/location_input.dart';
import 'package:ecommerce/view/palce.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Location_class? place_location;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [

       const Text("setting "),
        Location_input(onselectedlocation: (Location_class location) {
          place_location = location;
        }),
        ElevatedButton(onPressed: (){

        }, child: Text("Confirm"))
      ],
    ));
  }
}
