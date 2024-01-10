import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../util/seatsio_web_view_controller.dart';
import 'seating_config_change.dart';
import 'seatsio_category.dart';

typedef CategoryListCallback = void Function(List<SeatsioCategory>?);

class SeatingChart {
  const SeatingChart(this.seatsioController);

  final SeatsioWebViewController seatsioController;

  void rerender() {
    // inject javascript to SeatsioWebView
  }

  void selectObject(List<String> objects) {
    // inject javascript to SeatsioWebView
  }

  void deselectObject(List<String> objects) {
    final objectsJson = jsonEncode(objects);
    final jsString = "deselectObjects('$objectsJson');";

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      debugPrint("[Seatsio]-> deselectObject error: $error");
    }
  }

  void changeConfig(SeatingConfigChange configChange) {
    final configMap = configChange.toMap();
    String configJson = jsonEncode(configMap);
    configJson = configJson.replaceAll("'", "\\\'");

    final jsString = "changeConfig('$configJson', postMessageToFlutter)";
    debugPrint("[Seatsio]-> changeConfig jsString: $jsString");

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      debugPrint("[Seatsio]-> changeConfig error: $error");
    }
  }

  void listCategories(CategoryListCallback callback) {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      debugPrint("[Seatsio]-> listCategories error: $error");
    }

    callback([]);
  }

  void requestListCategories() {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      debugPrint("[Seatsio]-> listCategories error: $error");
    }
  }

  @override
  String toString() => 'SeatingChart(seatsioController: $seatsioController)';
}
