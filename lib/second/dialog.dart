import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitdialog() {
  Get.defaultDialog(
    title: 'Delete',
    middleText: 'DoYou really wanna exit',
    actions: [
      TextButton(
        onPressed: () {
          exit(0);
        },
        child: const Text('Yes'),
      ),
      TextButton(
        onPressed: () => Get.back(),
        child: const Text('No'),
      ),
    ],
  );
  return Future.value(true);
}
