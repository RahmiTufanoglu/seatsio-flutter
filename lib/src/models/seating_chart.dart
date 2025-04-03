import 'dart:convert';
import 'dart:developer' as developer show log;
import 'package:flutter/services.dart';
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
    if (objects.isEmpty) {
      developer.log("[Seatsio]-> deselectObject: No objects provided.");
      return;
    }

    final objectsJson = jsonEncode(objects);
    final jsString = "deselectObjects('$objectsJson');";

    try {
      seatsioController.evaluateJavascript(jsString);
    } on PlatformException catch (error) {
      developer.log("[Seatsio]-> deselectObject PlatformException: $error");
    } catch (error) {
      developer.log("[Seatsio]-> Unknown error in deselectObject: $error");
    }
  }

  void changeConfig(SeatingConfigChange configChange) {
    final configMap = configChange.toMap();
    String configJson = jsonEncode(configMap);
    configJson = configJson.replaceAll("'", "\\\'");

    final jsString = "changeConfig('$configJson', postMessageToFlutter)";
    developer.log("[Seatsio]-> changeConfig jsString: $jsString");
    seatsioController.evaluateJavascript(jsString);
  }

  void listCategories(CategoryListCallback callback) {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";
    seatsioController.evaluateJavascript(jsString);

    callback([]);
  }

  void requestListCategories() {
    // inject javascript to SeatsioWebView
    // get category from bridge callback

    final jsString = "listCategories(null, postMessageToFlutter);";
    seatsioController.evaluateJavascript(jsString);
  }

  @override
  String toString() => 'SeatingChart(seatsioController: $seatsioController)';
}
