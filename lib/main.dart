import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:hackelbac/providers/devices_info.dart';
import 'package:hackelbac/screens/first_open.dart';
import 'package:hackelbac/screens/mac_test.dart';
import 'package:hackelbac/screens/safe.dart';
import 'package:hackelbac/screens/test.dart';
import 'package:provider/provider.dart';
import 'providers/user_info.dart';
import 'package:hackelbac/screens/home.dart';

void main() {
  runApp(const Start());
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  });
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => userdata()),
        ChangeNotifierProvider(create: (_) => device_infos()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackElbac',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => start(),
        '/general_data': (context) => freefire(),
        '/device_data': (context) => device_data(),
        '/home': (context) => Home(),
        '/test_mac': (context) => test_mac(),
      },
    );
  }
}
