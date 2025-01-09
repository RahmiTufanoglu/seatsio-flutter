import 'package:flutter/foundation.dart';

void kDebugPrint(String message) {
  if (kDebugMode) debugPrint(message);
}
