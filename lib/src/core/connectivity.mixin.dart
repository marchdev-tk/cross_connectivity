// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io' show InternetAddress, SocketException;

import '../../cross_connectivity.dart';
import 'connectivity_service.interface.dart';

mixin ConnectivityMixin on ConnectivityServiceInterface {
  Future<bool> hasConnection() async {
    bool hasConnection = false;

    try {
      final result =
          await InternetAddress.lookup(ConnectivitySettings.lookupHost);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      }
    } on SocketException catch (_) {}

    return hasConnection;
  }

  void lookupPolling({bool updateConnectivityStatus = false}) async {
    if (!ConnectivitySettings.enablePolling) {
      return;
    }

    await Future.delayed(ConnectivitySettings.lookupDuration);

    final hasRealConnection = await hasConnection();
    if (connected.valueWrapper.value != hasRealConnection) {
      connected.add(hasRealConnection);
    }
    if (updateConnectivityStatus == true) {
      connectivityChanged.add(hasRealConnection
          ? ConnectivityStatus.unknown
          : ConnectivityStatus.none);
    }

    lookupPolling();
  }
}
