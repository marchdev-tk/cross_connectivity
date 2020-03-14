import 'package:flutter/widgets.dart';

import 'package:cross_connectivity/cross_connectivity.dart';

typedef Widget ConnectivityWidgetBuilder(
  BuildContext context,
  bool isConnected,
  ConnectivityStatus status,
);

class ConnectivityBuilder extends StatelessWidget {
  ConnectivityBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        _connectivity = Connectivity(),
        super(key: key);

  final Connectivity _connectivity;
  final ConnectivityWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _connectivity.isConnected,
      initialData: _connectivity.isConnected.value,
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
