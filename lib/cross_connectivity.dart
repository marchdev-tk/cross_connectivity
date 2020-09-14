// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library cross_connectivity;

export 'src/core/connectivity_status.dart';
export 'src/connectivity.stub.dart'
    if (dart.library.html) 'src/connectivity.web.dart'
    if (dart.library.io) 'src/connectivity.io.dart';
export 'src/connectivity.widget.dart';

/// Set of plugin settings.
class ConnectivitySettings {
  ConnectivitySettings._();

  static Duration _lookupDuration = const Duration(minutes: 1);
  static String _lookupHost = 'google.com';
  static bool _enablePolling = true;

  /// Gets lookup duration.
  ///
  /// Defaults to [const Duration(minutes: 1)].
  static Duration get lookupDuration => _lookupDuration;

  /// Gets lookup host.
  ///
  /// Defaults to `google.com`.
  static String get lookupHost => _lookupHost;

  /// Gets status of polling, `true` if polling is enable, otherwise `false`.
  ///
  /// Defaults to `true`.
  static bool get enablePolling => _enablePolling;

  /// Initializes [ConnectivitySettings] with default value.
  ///
  /// For more info about default values refer to:
  ///  * [ConnectivitySettings.lookupDuration];
  ///  * [ConnectivitySettings.lookupHost];
  ///  * [ConnectivitySettings.enablePolling].
  static void init({
    Duration lookupDuration = const Duration(minutes: 1),
    String lookupHost = 'google.com',
    bool enablePolling = true,
  }) {
    _lookupDuration = lookupDuration;
    _lookupHost = lookupHost;
    _enablePolling = enablePolling;
  }
}
