// Copyright (c) 2020, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library cross_connectivity;

export 'src/core/connectivity_status.dart';
export 'src/connectivity.stub.dart'
    if (dart.library.html) 'src/connectivity.web.dart'
    if (dart.library.io) 'src/connectivity.io.dart';
export 'src/connectivity.widget.dart';
