import 'package:flutter/material.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:device_info_plus/device_info_plus.dart';

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('actions'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/general_data');
                },
                child: Text('to general_data')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/device_data');
                },
                child: Text('to device_data')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test_mac');
                },
                child: Text('to test_mac')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test_safe');
                },
                child: Text('to test_safe')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/test_imei');
                },
                child: Text('to test_imei')),
          ],
        ),
      ),
    );
  }
}
