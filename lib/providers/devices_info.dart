import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class device_infos with ChangeNotifier, DiagnosticableTreeMixin {
  String device_mac = 'fr';

  void change_mac(adresse) {
    device_mac = adresse;
    notifyListeners();
  }

  void change() async {
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
