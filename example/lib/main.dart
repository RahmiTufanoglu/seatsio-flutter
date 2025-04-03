import 'package:example/my_pricing.dart';
import 'package:flutter/material.dart';
import 'package:seatsio/seatsio.dart';

const String yourWorkspaceKey = '';
const String yourEventKey = '';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seatsio Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Seatsio Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const myPricingList = [
  MyPricing('Standard', 12.0),
];

class _MyHomePageState extends State<MyHomePage> {
  late final SeatsioWebViewController? _seatsioController;
  late final SeatingChartConfig _chartConfig;

  final _selectedObjectLabels = [];

  static const _myPricingList = [
    MyPricing('Standard', 12.0),
  ];

  @override
  void initState() {
    super.initState();

    _chartConfig = SeatingChartConfig.init().rebuild(
      (builder) => builder
        ..workspaceKey = yourWorkspaceKey
        ..eventKey = yourEventKey
        ..language = 'de'
        ..region = 'eu'
        ..colorScheme = 'dark'
        ..stylePreset = 'bubblegum'
        ..colors = SeatsioConfigColors(
          colorSelected: '#E5FF00',
          colorTitle: '#E5FF00',
        )
        ..pricing = myPricingList
            .map((tickets) => PricingForCategory(category: tickets.name, price: tickets.grossPrice))
            .toList()
        ..objectTooltip = () {
          return ObjectTooltipBuilder()
            ..showActionHint = true
            ..showAvailability = false
            ..showCategory = true
            ..showLabel = true
            ..showPricing = true
            ..showUnavailableNotice = true
            ..stylizedLabel = true
            ..confirmSelectionOnMobile = true;
        }()
        ..enableHoldSucceededCallback = true
        ..enableHoldFailedCallback = true
        ..enableSessionInitializedCallback = true
        ..enableObjectClickedCallback = false
        ..enableObjectSelectedCallback = true
        ..enableObjectDeselectedCallback = true
        ..showFullScreenButton = false
        ..showLegend = false
        ..showMinimap = false
        ..inputDevice = 'touch'
        ..session = 'continue',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: SeatsioWebView(
                onWebViewCreated: (controller) {
                  debugPrint("[Seatsio]->[example]-> onWebViewCreated");
                  _seatsioController = controller;
                  _loadSeatsio();
                },
                onChartRendered: (_) {
                  debugPrint("[Seatsio]->[example]-> onChartRendered");
                },
                onChartRenderingFailed: () {
                  debugPrint("[Seatsio]->[example]-> onChartRenderingFailed");
                },
                onChartRenderingStarted: () {
                  debugPrint("[Seatsio]->[example]-> onChartRenderingStarted");
                },
                onObjectSelected: (object, type) async {
                  debugPrint("[Seatsio]->[example]-> onObjectSelected, label: ${object.label}");
                  _selectSeat(object);
                },
                onObjectDeselected: (object, type) async {
                  debugPrint("[Seatsio]->[example]-> onObjectDeselected, label: ${object.label}");
                  _deselectSeat(object);
                },
                onHoldSucceeded: (objects, ticketTypes) {
                  debugPrint("[Seatsio]->[example]-> onObjectSelected, objects: $objects | ticket types: $ticketTypes");
                },
                onHoldTokenExpired: () {
                  debugPrint("[Seatsio]->[example]-> onHoldTokenExpired");
                },
                onSessionInitialized: (holdToken) {
                  debugPrint("[Seatsio]->[example]-> onSessionInitialized, holdToken: $holdToken");
                },
              ),
            ),
            ColoredBox(
              color: Colors.black12,
              child: AspectRatio(
                aspectRatio: 1,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: (kToolbarHeight * 2) + MediaQuery.viewPaddingOf(context).bottom),
                  itemCount: _selectedObjectLabels.length,
                  itemBuilder: (_, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_selectedObjectLabels[index]),
                        if (_seatsioController != null)
                          IconButton(
                            onPressed: () {
                              final chart = SeatingChart(_seatsioController);
                              chart.deselectObject([_selectedObjectLabels[index]]);
                            },
                            icon: Icon(Icons.delete_forever),
                          ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadSeatsio,
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _selectSeat(SeatsioObject object) {
    setState(() {
      _selectedObjectLabels.add(object.label);
    });
  }

  void _deselectSeat(SeatsioObject object) {
    if (_selectedObjectLabels.contains(object.label)) {
      setState(() {
        _selectedObjectLabels.remove(object.label);
      });
    }
  }

  void _loadSeatsio() {
    final newChartConfig = _chartConfig.rebuild((b) => b..showLegend = false);
    _seatsioController?.reload(newChartConfig);
  }
}
