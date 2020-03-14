// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
                    isConnected == true
                        ? Icons.signal_wifi_4_bar
                        : Icons.signal_wifi_off,
                    color: isConnected == true ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${status}',
                    style: TextStyle(
                      color: status != ConnectivityStatus.none
                          ? Colors.green
                          : Colors.red,
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
