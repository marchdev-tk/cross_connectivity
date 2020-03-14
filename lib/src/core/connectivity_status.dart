// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Connection status check result.
enum ConnectivityStatus {
  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none,

  /// Ethernet: Device connected via Ethernet
  ethernet,

  /// Unknown: Device connection status unknown
  unknown,
}