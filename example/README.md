# cross_connectivity_example

Demonstrates how to use the cross_connectivity package.

## Usage

```dart
import 'package:flutter/material.dart';

import 'package:cross_connectivity/cross_connectivity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cross Connectivity Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cross Connectivity Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ConnectivityBuilder(
              builder: (context, isConnected, status) => Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    isConnected
                        ? Icons.signal_wifi_4_bar
                        : Icons.signal_wifi_off,
                    color: isConnected ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${status}',
                    style: TextStyle(
                      color: isConnected ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

## Getting Started

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
