import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:seatsio/src/util/constants.dart';
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

  Future<void> deselectObject(List<String> objects) async {
    if (objects.isEmpty) {
      kDebugPrint("[Seatsio]-> deselectObject: No objects provided.");
      return;
    }

    final objectsJson = jsonEncode(objects);
    final jsString = "deselectObjects('$objectsJson');";

    try {
      seatsioController.evaluateJavascript(jsString);
    } on PlatformException catch (error) {
      kDebugPrint("[Seatsio]-> deselectObject PlatformException: $error");
    } catch (error) {
      kDebugPrint("[Seatsio]-> Unknown error in deselectObject: $error");
    }
  }

  void changeConfig(SeatingConfigChange configChange) {
    final configMap = configChange.toMap();
    String configJson = jsonEncode(configMap);
    configJson = configJson.replaceAll("'", "\\\'");

    final jsString = "changeConfig('$configJson', postMessageToFlutter)";
    kDebugPrint("[Seatsio]-> changeConfig jsString: $jsString");

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      kDebugPrint("[Seatsio]-> changeConfig error: $error");
    }
  }

  void listCategories(CategoryListCallback callback) {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";

    try {
      seatsioController.evaluateJavascript(jsString);
    } catch (error) {
      kDebugPrint("[Seatsio]-> listCategories error: $error");
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
      kDebugPrint("[Seatsio]-> listCategories error: $error");
    }
  }

  @override
  String toString() => 'SeatingChart(seatsioController: $seatsioController)';
}
