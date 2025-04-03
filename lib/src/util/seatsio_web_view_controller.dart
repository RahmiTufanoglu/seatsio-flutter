import 'dart:convert';
import 'dart:developer' as developer show log;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/seating_chart_config.dart';
import '../util/seatsio_js_bridge.dart';
import '../assets/seatsio_html.dart';

typedef SeatsioWebViewCreatedCallback = void Function(SeatsioWebViewController controller);

class SeatsioWebViewController {
  SeatsioWebViewController({
    required WebViewController webViewController,
  }) : _webViewController = webViewController;

  final WebViewController _webViewController;

  SeatingChartConfig? _chartConfig;

  void reload(SeatingChartConfig? newChartConfig) {
    if (newChartConfig != null) {
      _chartConfig = newChartConfig;
    } else {
      return;
    }

    if (_chartConfig != null) {
      final url = _generateHtmlContent(_chartConfig!);
      _webViewController
        ..setBackgroundColor(Colors.transparent)
        ..loadRequest(Uri.parse(url));
    } else {
      developer.log("[Seatsio]-> Not found seatsio chart config info.");
    }
  }

  void reloadChart({
    required String token,
    required String session,
  }) {
    if (_chartConfig != null) {
      final newChartInfo = _chartConfig!.rebuild((b) {
        return b
          ..holdToken = token
          ..session = session;
      });
      final url = _generateHtmlContent(newChartInfo);
      try {
        _webViewController.loadRequest(Uri.parse(url));
      } catch (e) {
        developer.log("[Seatsio]-> Error while reloading chart: $e");
      }
    } else {
      developer.log("[Seatsio]-> Not found seatsio chart config info.");
    }
  }

  /// Generate html for seatsio webview
  String _generateHtmlContent(SeatingChartConfig chartConfig) {
    // Convert chart configs to map
    final chartConfigMap = chartConfig.toMap();

    // Convert map to json string
    var chartConfigJson = jsonEncode(chartConfigMap);

    // Append callback string to json string.
    final callbacks = SeatsioJsBridge.buildCallbacksConfiguration(chartConfig);
    final sb = StringBuffer(chartConfigJson.substring(0, chartConfigJson.length - 1));
    callbacks.forEach((e) => sb.write(', $e'));

    // Add the price formatter if it exists in chartConfig
    if (chartConfig.priceFormatter != null) {
      sb.write(', "priceFormatter": ${chartConfig.priceFormatter}');
    }

    sb.write('}');
    chartConfigJson = sb.toString();

    // Insert json string of chart config to the seatsio HTML template.
    final htmlString = seatsioHTML //
        .replaceFirst("%region%", chartConfig.region ?? "eu")
        .replaceFirst("%configAsJs%", chartConfigJson);

    developer.log("[Seatsio]-> _generateHtmlContent: $htmlString");

    // Encode HTML string with utf8
    final url = Uri.dataFromString(
      htmlString,
      mimeType: "text/html",
      encoding: utf8,
    );

    return url.toString();
  }

  Future<void> evaluateJavascript(String javascriptString) {
    return _webViewController.runJavaScript(javascriptString);
  }
}
