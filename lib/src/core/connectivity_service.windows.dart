// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:rxdart/rxdart.dart';

import 'connectivity.mixin.dart';
import 'connectivity_service.interface.dart';

/// Discover network connectivity configurations: Distinguish between WI-FI
/// and cellular, check WI-FI status and more.
class ConnectivityService extends ConnectivityServiceInterface
    with ConnectivityMixin {
  /// Constructs a singleton instance of [ConnectivityService].
  ConnectivityService() : super() {
    void update() async {
      final hasRealConnection = await hasConnection();

      connected.add(hasRealConnection);
      connectivityChanged.add(hasRealConnection
          ? ConnectivityStatus.unknown
          : ConnectivityStatus.none);
    }

    lookupPolling(updateConnectivityStatus: true);
    update();
  }

  /// Fires whenever the connection state changes.
  ///
  /// Only shows whether the device is `REALLY` connected to the network or not.
  @override
  ValueStream<bool> get isConnected => connected;

  /// Checks the `REAL` connection status of the device.
  ///
  /// Instead listen for connection status changes via [isConnected] stream.
  Future<bool> checkConnection() async {
    final status = await hasConnection();

    if (connected.value != status) {
      connected.add(status);
    }

    return status;
  }

  /// Fires whenever the connectivity state changes.
  ///
  /// Please note that it will not let you know about state of the `REAL` network connection.
  @override
  ValueStream<ConnectivityStatus> get onConnectivityChanged =>
      connectivityChanged;

  /// Checks the connection status of the device.
  ///
  /// Do not use the result of this function to decide whether you can reliably
  /// make a network request. It only gives you the radio status.
  ///
  /// Instead listen for connectivity changes via [onConnectivityChanged] stream.
  @override
  Future<ConnectivityStatus> checkConnectivity() async {
    final status = await hasConnection()
        ? ConnectivityStatus.unknown
        : ConnectivityStatus.none;

    if (connectivityChanged.value != status) {
      connectivityChanged.add(status);
    }

    return status;
  }

  @override
  void dispose() => super.dispose();
}
