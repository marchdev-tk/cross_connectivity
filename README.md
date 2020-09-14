# cross_connectivity

![Build](https://github.com/marchdev-tk/cross_connectivity/workflows/build/badge.svg)
[![Pub](https://img.shields.io/pub/v/cross_connectivity.svg)](https://pub.dartlang.org/packages/cross_connectivity)
![GitHub](https://img.shields.io/github/license/marchdev-tk/cross_connectivity)
![GitHub stars](https://img.shields.io/github/stars/marchdev-tk/cross_connectivity?style=social)

A Flutter plugin for handling `Connectivity` and `REAL Connection` state in the mobile, web and desktop platforms. Supports iOS, Android, Web, Windows, Linux and macOS.

## Getting Started

In order to use this plugin, add dependency in the `pubspec.yaml`:

```yaml
cross_connectivity: any
```

or

```yaml
cross_connectivity:
    git:
      url: https://github.com/marchdev-tk/cross_connectivity
```

Add an import to dart file:

```dart
import 'package:cross_connectivity/cross_connectivity.dart';
```

### Samples

Web sample:

![Web Sample](../assets/cc_web.gif?raw=true)

Desktop sample:

![Desktop Sample](../assets/cc_desktop.gif?raw=true)

Mobile sample:

![Mobile Sample](../assets/cc_mobile.gif?raw=true)

### Usage

#### Functional approach

This plugin provides two streams:

 * `isConnected` that shows whether the device is `REALLY` connected to the network or not.
 * `onConnectivityChanged` that it will not let you know about state of the `REAL` network connection. It only shows connectivity state.

Also for `one time` check could be used following methods:

 * `checkConnection()` that is working like `isConnected`, but returns `Future<bool>` instread of `Stream<bool>`.
 * `checkConnectivity()` that is working like `onConnectivityChanged`, but returns `Future<ConnectivityStatus>` instread of `Stream<ConnectivityStatus>`.

As an addition there are more methods (they are working only on Android/iOS/macOS):

 * `getWifiName()`  - Obtains the wifi name (SSID) of the connected network.
 * `getWifiBSSID()` - Obtains the wifi BSSID of the connected network.
 * `getWifiIP()` - Obtains the IP address of the connected wifi network.

#### Widget approach

As an alteration to funcitonal approach could be used `ConnectivityBuilder` widget as follows:

```dart
ConnectivityBuilder(
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
        '$status',
        style: TextStyle(
          color: status != ConnectivityStatus.none
              ? Colors.green
              : Colors.red,
        ),
      ),
    ],
  ),
)
```

## Feature requests and Bug reports

Feel free to post a feature requests or report a bug [here](https://github.com/marchdev-tk/cross_connectivity/issues).
