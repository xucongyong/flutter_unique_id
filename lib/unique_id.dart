import 'unique_id_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String?> getUniqueId() {
  if (kIsWeb) {
    return Future.value(null);
  } else {
    return UniqueIdPlatform.instance.getUniqueId();
  }
}
