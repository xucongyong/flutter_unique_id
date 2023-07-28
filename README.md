# flutter_unique_id

A new Flutter plugin project.

# use

```dart
import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:flutter_unique_id/flutter_unique_id.dart' as flutter_unique_id;
import 'package:flutter/services.dart';

Future<String?> get_only_unique_device_id() async {
  String? UniqueDeviceId = await flutter_unique_id.getUniqueId();
  print(UniqueDeviceId);
  return UniqueDeviceId;
}

```



## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

