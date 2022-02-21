// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io' show Platform;

import 'package:rxdart/rxdart.dart';

import 'core/connectivity_service.interface.dart';
import 'core/connectivity_service.linux.dart' as linux;
import 'core/connectivity_service.common.dart' as common;
import 'core/connectivity_service.windows.dart' as windows;

class Connectivity implements BaseConnectivityServiceInterface {
  /// Constructs a singleton instance of [Connectivity].
  factory Connectivity() {
    if (_singleton == null) {
      if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
        _singleton = Connectivity._(common.ConnectivityService());
      } else if (Platform.isWindows) {
        _singleton = Connectivity._(windows.ConnectivityService());
      } else if (Platform.isLinux) {
        _singleton = Connectivity._(linux.ConnectivityService());
      }
    }

    return _singleton!;
  }
  const Connectivity._(this._connectivityService);
  static Connectivity? _singleton;

  final ConnectivityServiceInterface _connectivityService;

  /// Fires whenever the connection state changes.
  ///
  /// Only shows whether the device is `REALLY` connected to the network or not.
  @override
  ValueStream<bool> get isConnected => _connectivityService.isConnected;

  /// Fires whenever the connectivity state changes.
  ///
  /// Please note that it will not let you know about state of the `REAL` network connection.
  @override
  ValueStream<ConnectivityStatus> get onConnectivityChanged =>
      _connectivityService.onConnectivityChanged;

  /// Checks the `REAL` connection status of the device.
  ///
  /// Instead listen for connection status changes via [isConnected] stream.
  @override
  Future<bool> checkConnection() => _connectivityService.checkConnection();

  /// Checks the connection status of the device.
  ///
  /// Do not use the result of this function to decide whether you can reliably
  /// make a network request. It only gives you the radio status.
  ///
  /// Instead listen for connectivity changes via [onConnectivityChanged] stream.
  @override
  Future<ConnectivityStatus> checkConnectivity() =>
      _connectivityService.checkConnectivity();

  @override
  void dispose() => _connectivityService.dispose();
}
