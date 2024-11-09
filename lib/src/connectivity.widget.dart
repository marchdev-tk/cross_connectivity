import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/widgets.dart';

/// Signature for strategies that build widgets based on [Connectivity.isConnected]
/// [Stream] and [Connectivity.onConnectivityChanged] [Stream].
typedef ConnectivityWidgetBuilder = Widget Function(
  BuildContext context,
  bool? isConnected,
  ConnectivityStatus? status,
);

/// Widget that builds itself based on the latest snapshot of interaction with
/// [Connectivity.isConnected] [Stream] and [Connectivity.onConnectivityChanged]
/// [Stream].
///
/// ```dart
/// ConnectivityBuilder(
///   builder: (context, isConnected, status) => Row(
///     mainAxisSize: MainAxisSize.min,
///     children: <Widget>[
///       Icon(
///         isConnected == true
///             ? Icons.signal_wifi_4_bar
///             : Icons.signal_wifi_off,
///         color: isConnected == true ? Colors.green : Colors.red,
///       ),
///       const SizedBox(width: 8),
///       Text(
///         '$status',
///         style: TextStyle(
///           color: status != ConnectivityStatus.none
///               ? Colors.green
///               : Colors.red,
///         ),
///       ),
///     ],
///   ),
/// )
/// ```
///
class ConnectivityBuilder extends StatelessWidget {
  /// Creates a new [ConnectivityBuilder] that builds itself based on the latest
  /// snapshot of interaction with [Connectivity.isConnected] [Stream] and
  /// [Connectivity.onConnectivityChanged] [Stream] and whose build strategy is
  /// given by [builder].
  ///
  /// The [builder] must not be null.
  ConnectivityBuilder({
    super.key,
    required this.builder,
  }) : _connectivity = Connectivity();

  final Connectivity _connectivity;

  /// The build strategy currently used by this builder.
  final ConnectivityWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _connectivity.isConnected,
      initialData: _connectivity.isConnected.valueOrNull,
      builder: (context, isConnected) {
        return StreamBuilder<ConnectivityStatus>(
          stream: _connectivity.onConnectivityChanged,
          builder: (context, connectivityStatus) {
            return builder(context, isConnected.data, connectivityStatus.data);
          },
        );
      },
    );
  }
}
