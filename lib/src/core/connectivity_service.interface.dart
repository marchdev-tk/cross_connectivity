// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'connectivity_status.dart';

export 'connectivity_status.dart';

/// Discover network connectivity configurations: Distinguish between WI-FI
/// and cellular, check WI-FI status and more.
abstract class ConnectivityServiceInterface
    extends BaseConnectivityServiceInterface {
  /// Constructs a singleton instance of [ConnectivityServiceInterface].
  ConnectivityServiceInterface() : super();

  @protected
  final connected = BehaviorSubject<bool>();
  @protected
  final connectivityChanged = BehaviorSubject<ConnectivityStatus>();

  @override
  @mustCallSuper
  void dispose() {
    if (connected?.isClosed == false) {
      connected?.close();
    }
    if (connectivityChanged?.isClosed == false) {
      connectivityChanged?.close();
    }
  }
}

/// Discover network connectivity configurations: Distinguish between WI-FI
/// and cellular, check WI-FI status and more.
abstract class BaseConnectivityServiceInterface {
  /// Constructs a singleton instance of [BaseConnectivityServiceInterface].
  const BaseConnectivityServiceInterface();

  /// Fires whenever the connection state changes.
  ///
  /// Only shows whether the device is `REALLY` connected to the network or not.
  ValueStream<bool> get isConnected;

  /// Fires whenever the connectivity state changes.
  ///
  /// Please note that it will not let you know about state of the `REAL` network connection.
  ValueStream<ConnectivityStatus> get onConnectivityChanged;

  /// Checks the `REAL` connection status of the device.
  ///
  /// Instead listen for connection status changes via [isConnected] stream.
  Future<bool> checkConnection();

  /// Checks the connection status of the device.
  ///
  /// Do not use the result of this function to decide whether you can reliably
  /// make a network request. It only gives you the radio status.
  ///
  /// Instead listen for connectivity changes via [onConnectivityChanged] stream.
  Future<ConnectivityStatus> checkConnectivity();

  /// Obtains the wifi name (SSID) of the connected network.
  ///
  /// Please note that it DOESN'T WORK on emulators, Web, Windows and Linux (returns null).
  ///
  /// From android 8.0 onwards the GPS must be ON (high accuracy)
  /// in order to be able to obtain the SSID.
  Future<String> getWifiName();

  /// Obtains the wifi BSSID of the connected network.
  ///
  /// Please note that it DOESN'T WORK on emulators, Web, Windows and Linux (returns null).
  ///
  /// From Android 8.0 onwards the GPS must be ON (high accuracy)
  /// in order to be able to obtain the BSSID.
  Future<String> getWifiBSSID();

  /// Obtains the IP address of the connected wifi network.
  Future<String> getWifiIP();

  void dispose();
}
