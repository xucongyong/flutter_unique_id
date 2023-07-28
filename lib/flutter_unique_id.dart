import 'flutter_unique_id_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String?> getUniqueId() {
  if (kIsWeb) {
    return Future.value("");
  } else {
    return FlutterUniqueIdPlatform.instance.getUniqueId();
  }
}
