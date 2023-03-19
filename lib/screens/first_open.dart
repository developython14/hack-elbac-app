import 'package:flutter/material.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class First_open extends StatelessWidget {
  const First_open({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<device_infos>().status == 'completed') {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('fd'),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
      );
    }
    context.read<device_infos>().change_mac();
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
