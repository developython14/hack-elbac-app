import 'package:flutter/material.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';
import 'dart:async';

class First_open extends StatelessWidget {
  const First_open({Key? key}) : super(key: key);

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<device_infos>().device_mac == '') {}
    return Scaffold(
      body: Center(
        child: Text('hi'),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {}
}
