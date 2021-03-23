# Changelog

## 3.0.2

* Fixed null pointer exception in `ConnectivityBuilder`
* Redo android example activity to android embedding v2

## 3.0.1

* Fixed lint issues

## 3.0.0

* Updated to NNBD.

## 2.0.1

* Updated changelog and readme.

## 2.0.0 (thanks to [cbenhagen](https://github.com/cbenhagen))

* [Breaking Change] The `getWifiName`, `getWifiBSSID` and `getWifiIP` are removed to [wifi_info_flutter](https://github.com/flutter/plugins/tree/master/packages/wifi_info_flutter).
* Migration guide:

  If you don't use any of the above APIs, your code should work as is. In addition, you can also remove `NSLocationAlwaysAndWhenInUseUsageDescription` and `NSLocationWhenInUseUsageDescription` in `ios/Runner/Info.plist`.

  If you use any of the above APIs, you can find the same APIs in the [wifi_info_flutter](https://github.com/flutter/plugins/tree/master/packages/wifi_info_flutter/wifi_info_flutter) plugin.
  For example, to migrate `getWifiName`, use the new plugin:
  ```dart
  final WifiInfo _wifiInfo = WifiInfo();
  final String wifiName = await _wifiInfo.getWifiName();
  ```

## 1.1.1 (thanks to [otopba](https://github.com/otopba))

* Updated libs: meta, http, rxdart.

## 1.1.0

* Added `ConnectivitySettings` with configurable `lookupDuration`, `lookupHost`, `enablePolling`.

## 1.0.2

* Removed debug printing.

## 1.0.1

* Fixed incompatibility issue with Safari and IE of NetworkInformation API.

## 1.0.0

* Created common interface for handling `Connectivity` and `REAL Connection` state in the mobile, web and desktop platforms. Supports iOS, Android, Web, Windows, Linux and macOS.
