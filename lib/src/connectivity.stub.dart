// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:rxdart/rxdart.dart';

import 'core/connectivity_service.interface.dart';

class Connectivity implements BaseConnectivityServiceInterface {
  /// Constructs a singleton instance of [Connectivity].
  factory Connectivity() => _singleton;
  const Connectivity._();
  static const Connectivity _singleton = Connectivity._();

  /// Fires whenever the connection state changes.
  ///
  /// Only shows whether the device is `REALLY` connected to the network or not.
  @override
  ValueStream<bool> get isConnected => throw UnimplementedError();

  /// Fires whenever the connectivity state changes.
  ///
  /// Please note that it will not let you know about state of the `REAL` network connection.
  @override
  ValueStream<ConnectivityStatus> get onConnectivityChanged =>
      throw UnimplementedError();

  /// Checks the `REAL` connection status of the device.
  ///
  /// Instead listen for connection status changes via [isConnected] stream.
  Future<bool> checkConnection() => throw UnimplementedError();

  /// Checks the connection status of the device.
  ///
  /// Do not use the result of this function to decide whether you can reliably
  /// make a network request. It only gives you the radio status.
  ///
  /// Instead listen for connectivity changes via [onConnectivityChanged] stream.
  @override
  Future<ConnectivityStatus> checkConnectivity() => throw UnimplementedError();

  @override
  void dispose() => throw UnimplementedError();
}
