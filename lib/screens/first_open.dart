import 'package:flutter/material.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class First_open extends StatelessWidget {
  const First_open({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<device_infos>().status == 'completed') {
      Navigator.pushNamed(context, '/home');
    }
    return Scaffold(
      body: Center(
        child: Text('hi'),
      ),
    );
  }
}
