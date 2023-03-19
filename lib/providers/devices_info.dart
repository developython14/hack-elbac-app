import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';

class device_infos with ChangeNotifier, DiagnosticableTreeMixin {
  String device_mac = 'fr';
  String status = 'idle';

  void change_mac() async {
    print('function called suucesfly');
    status = 'loading';
    String id = await initPlatformState();
    device_mac = id;
    status = 'completed';
    notifyListeners();
  }

  void change() async {
    notifyListeners();
  }

  Future<String> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
    return platformVersion;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
