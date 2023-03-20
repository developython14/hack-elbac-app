import 'package:flutter/material.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_mac/get_mac.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:device_information/device_information.dart';
import 'package:device_info_plus/device_info_plus.dart';

class First_open extends StatelessWidget {
  const First_open({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.watch<device_infos>().status == 'completed') {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text(context.watch<device_infos>().device_mac),
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

class free extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<free> {
  String _platformVersion = 'Unknown',
      _imeiNo = "",
      _modelName = "",
      _manufacturerName = "",
      _deviceName = "",
      _productName = "",
      _cpuType = "",
      _hardware = "";
  var _apiLevel;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    late String platformVersion,
        imeiNo = '',
        modelName = '',
        manufacturer = '',
        deviceName = '',
        productName = '',
        cpuType = '',
        hardware = '';
    var apiLevel;
    // Platform messages may fail,
    // so we use a try/catch PlatformException.
    try {
      platformVersion = await DeviceInformation.platformVersion;
      imeiNo = await DeviceInformation.deviceIMEINumber;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      apiLevel = await DeviceInformation.apiLevel;
      deviceName = await DeviceInformation.deviceName;
      productName = await DeviceInformation.productName;
      cpuType = await DeviceInformation.cpuName;
      hardware = await DeviceInformation.hardware;
    } on PlatformException catch (e) {
      platformVersion = '${e.message}';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = "Running on :$platformVersion";
      _imeiNo = imeiNo;
      _modelName = modelName;
      _manufacturerName = manufacturer;
      _apiLevel = apiLevel;
      _deviceName = deviceName;
      _productName = productName;
      _cpuType = cpuType;
      _hardware = hardware;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Information Plugin Example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text('$_platformVersion\n'),
              SizedBox(
                height: 10,
              ),
              Text('IMEI Number: $_imeiNo\n'),
              SizedBox(
                height: 10,
              ),
              Text('Device Model: $_modelName\n'),
              SizedBox(
                height: 10,
              ),
              Text('API Level: $_apiLevel\n'),
              SizedBox(
                height: 10,
              ),
              Text('Manufacture Name: $_manufacturerName\n'),
              SizedBox(
                height: 10,
              ),
              Text('Device Name: $_deviceName\n'),
              SizedBox(
                height: 10,
              ),
              Text('Product Name: $_productName\n'),
              SizedBox(
                height: 10,
              ),
              Text('CPU Type: $_cpuType\n'),
              SizedBox(
                height: 10,
              ),
              Text('Hardware Name: $_hardware\n'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
